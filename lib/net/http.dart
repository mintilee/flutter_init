import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:offline/main.dart';
import 'package:offline/res/constant.dart';
import 'package:offline/ui/widgets/toast.dart';
import 'package:offline/utils/log_utils.dart';

import 'base_entity.dart';
import 'error_handle.dart';

/// 默认dio配置
Duration _connectTimeout = const Duration(seconds: 3000);
Duration _receiveTimeout = const Duration(seconds: 3000);
Duration _sendTimeout = const Duration(seconds: 3000);
String _baseUrl = '';
List<Interceptor> _interceptors = [];

/// 初始化Dio配置
void configDio({
  Duration? connectTimeout,
  Duration? receiveTimeout,
  Duration? sendTimeout,
  String? baseUrl,
  List<Interceptor>? interceptors,
}) {
  _connectTimeout = connectTimeout ?? _connectTimeout;
  _receiveTimeout = receiveTimeout ?? _receiveTimeout;
  _sendTimeout = sendTimeout ?? _sendTimeout;
  _baseUrl = baseUrl ?? _baseUrl;
  _interceptors = interceptors ?? _interceptors;
}

typedef NetSuccessCallback<T> = void Function(T data);
typedef NetSuccessListCallback<T> = void Function(List<T> data);
typedef NetErrorCallback = void Function(int code, String msg, {bool? apiStatus});

/// @weilu https://github.com/simplezhli
class DioUtils {
  factory DioUtils() => _singleton;

  DioUtils._() {
    final BaseOptions options = BaseOptions(
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      sendTimeout: _sendTimeout,
      headers: {"terninalType": 2},

      /// dio默认json解析，这里指定返回UTF8字符串，自己处理解析。（可也以自定义Transformer实现）
      responseType: ResponseType.plain,
      validateStatus: (_) {
        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
      baseUrl: _baseUrl,
//      contentType: Headers.formUrlEncodedContentType, // 适用于post form表单提交
    );
    _dio = Dio(options);

    /// Fiddler抓包代理配置 https://www.jianshu.com/p/d831b1f7c45b
    // _dio.httpClientAdapter = IOHttpClientAdapter()..onHttpClientCreate = (HttpClient client) {
    //   client.findProxy = (uri) {
    //     //proxy all request to localhost:8888
    //     return 'PROXY 10.41.0.132:8888';
    //   };
    //   return client;
    // };

    /// 添加拦截器
    void addInterceptor(Interceptor interceptor) {
      _dio.interceptors.add(interceptor);
    }

    _interceptors.forEach(addInterceptor);
  }

  static final DioUtils _singleton = DioUtils._();

  static DioUtils get instance => DioUtils();

  static late Dio _dio;

  Dio get dio => _dio;

  // 数据返回格式统一，统一处理异常
  Future<BaseEntity<T>> _request<T>(
    String method,
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    final Response<String> response = await _dio.request<String>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: _checkOptions(method, options),
      cancelToken: cancelToken,
    );
    try {
      final String data = response.data.toString();
      final bool isCompute = !Constant.isDriverTest && data.length > 10 * 1024;
      debugPrint('isCompute:$isCompute');
      final Map<String, dynamic> map = isCompute ? await compute(parseData, data) : parseData(data);
      return BaseEntity<T>.fromJson(map);
    } catch (e) {
      debugPrint(e.toString());
      return BaseEntity<T>(ExceptionHandle.parse_error, '数据解析错误！', null, false);
    }
  }

  Options _checkOptions(String method, Options? options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  Future<dynamic> requestNetwork<T>(
    Method method,
    String url, {
    NetSuccessCallback<T?>? onSuccess,
    NetErrorCallback? onError,
    Object? params,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) {
    return _request<T>(
      method.value,
      url,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ).then<void>((BaseEntity<T> result) {
      if (result.success == true) {
        onSuccess?.call(result.data);
      } else {
        _onError(result.code, result.message, onError, false);
        ToastUtils().showToast(message: result.message);
      }
    }, onError: (dynamic e) {
      _cancelLogPrint(e, url);
      final NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError, false);
    });
  }

  /// 统一处理(onSuccess返回T对象，onSuccessList返回 List<T>)
  void asyncRequestNetwork(
    Method method,
    String url, {
    NetSuccessCallback? onSuccess,
    NetErrorCallback? onError,
    Object? params,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) {
    Stream.fromFuture(_request(
      method.value,
      url,
      data: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    )).asBroadcastStream().listen((result) {
      if (result.code == 0) {
        if (onSuccess != null) {
          onSuccess(result.data);
        }
      } else {
        _onError(result.code, result.message, onError, false);
      }
    }, onError: (dynamic e) {
      _cancelLogPrint(e, url);
      final NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError, false);
    });
  }

  void _cancelLogPrint(dynamic e, String url) {
    if (e is DioException && CancelToken.isCancel(e)) {
      Log.e('取消请求接口： $url');
    }
  }

  void _onError(int? code, String msg, NetErrorCallback? onError, bool? successStatus) {
    if (code == null || !successStatus!) {
      code = ExceptionHandle.unknown_error;
      // msg = '未知异常';
      msg = msg;
      successStatus = successStatus;
    }
    Log.e(
      '接口请求异常： code: $code, mag: $msg, apiStatus: $successStatus',
    );
    onError?.call(code, msg);
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

enum Method { get, post, put, patch, delete, head }

/// 使用拓展枚举替代 switch判断取值
/// https://zhuanlan.zhihu.com/p/98545689
extension MethodExtension on Method {
  String get value => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD'][index];
}
