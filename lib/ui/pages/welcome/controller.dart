import 'dart:async';

import 'package:get/get.dart';
import 'package:offline/store/user-login.dart';
import 'package:offline/ui/pages/auth/login/login_screen.dart';
import 'package:offline/utils/router_utils.dart';

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
        }
      });
    });
  }

  // 跳转到对应的路由
  void jumpToLogin() async {}

  @override
  void onInit() async {
    _init();
    super.onInit();
  }
}
