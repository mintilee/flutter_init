import 'package:get/get.dart';
import 'package:offline/models/app_user_home.dart';

import 'package:offline/store/home.dart';
import 'package:offline/store/user-login.dart';

class SettingController extends GetxController {
  @override
  onInit() async {
    await AppHomeStore.init();
    await UserLoginStore.init();
    print("========初始化成功=========");
    super.onInit();
  }

  // 退出登录
  Future<bool> loginOut() async {
    // 清理缓存的数据
    // AppHomeStore().getHomeData().then((value) {
    //   AppUserHome? homeData = value; // 这样去拿去值
    // });
    UserLoginStore().updateToken(token: "");
    AppHomeStore().clear();
    return true;
  }
}
