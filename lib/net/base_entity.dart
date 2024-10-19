import 'package:offline/res/constant.dart';

class BaseEntity<T> {
  BaseEntity(this.code, this.message, this.data, this.success);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[Constant.code] as int?;
    success = json[Constant.success] as bool;
    message = json[Constant.message] as String;
    if (json.containsKey(Constant.data)) {
      data = _generateOBJ<T>(json[Constant.data] as Object?);
    }
  }

  int? code;
  bool? success;
  late String message;
  T? data;

  T? _generateOBJ<O>(Object? json) {
    if (json == null) {
      return null;
    }
    if (T.toString() == 'String') {
      return json.toString() as T;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as T;
    } else {
      /// List类型数据
      if (json is List) {
        return json.map((e) => e as Map<dynamic, dynamic>).toList() as T;
      } else {
        return json as T;
      }
    }
  }

  // return JsonConvert.fromJsonAsT<T>(json);
}
