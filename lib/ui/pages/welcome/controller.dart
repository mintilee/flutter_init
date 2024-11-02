import 'dart:async';

import 'package:get/get.dart';
import 'package:offline/models/app_public.dart';
import 'package:offline/net/net.dart';
// import 'package:offline/store/public.dart';
// import 'package:offline/store/user-login.dart';
// import 'package:offline/ui/pages/auth/login/login_screen.dart';
// import 'package:offline/utils/router_utils.dart';

class WelcomeController extends GetxController {
  int count = 3;

  void _init() {
    Timer? timer;
    Future.delayed(const Duration(milliseconds: 200), () {
      if (timer != null) {
        timer?.cancel();
        timer = null;
      }
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        count--;
        if (count == 1) {
          timer?.cancel();
          timer = null;
          print({"debug========35=====准备起跳"});
          getPublicInfoApi(isReflesh: true);
        }
      });
    });
  }

  // 获取公共缓存信息
  // AppPublic? publicData;
  // void getPublicInfo() async {
  //   await AppPublicStore.init();
  //   AppPublicStore().getPublicData().then((value) {
  //     publicData = value;
  //     update();
  //   });
  // }

  // 请求公共缓存的接口
  AppPublic? publicData;

  Future<dynamic> getPublicInfoApi({bool isReflesh = false}) async {
    if (isReflesh == true) {
      return DioUtils().requestNetwork(
        Method.post,
        HttpApi.public,
        onSuccess: (json) {
          print("======成功=====");
          Map jsonData = json as Map<String, dynamic>;
          publicData = AppPublic.fromJson(jsonData['data'] ?? {});
          update();
        },
      );
    }
    return null;
  }

  @override
  void onInit() async {
    _init();
    super.onInit();
  }
}
