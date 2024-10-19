import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:offline/main.dart';
import 'package:offline/models/app_info.dart';
import 'package:offline/models/app_user_home.dart';
import 'package:offline/net/net.dart';
import 'package:offline/routers/names.dart';
import 'package:offline/store/app.dart';
import 'package:offline/store/home.dart';
import 'package:offline/store/user-login.dart';

import 'package:offline/ui/pages/auth/login/login_models.dart';

import 'package:offline/utils/bus_notify.dart';
import 'package:offline/utils/event_bus.dart';
import 'package:offline/utils/log_utils.dart';
import 'package:offline/utils/regx_utils.dart';

class LoginScreenController extends GetxController {
  final LoginModel loginModel = LoginModel(
    isShow: false,
    loginMethod: 0,
    account: "",
    phone: "",
    password: "",
    smsCode: "",
  );

  final flag = RxBool(true);
  // 是否同意
  final selectAgreeStatus = RxBool(false);

  // 登陆
  void toLogin() async {
    final AppInfo? appinfo = await AppStore().getAppInfo();

//     {
//   "login_Type": 1, // 1密码 2验证码
//   "loginID": "string", // 用户账号
//   "password": "string", // 密码
//   "u_Type": 0,
//   "phoneKey": "string",
// }

    Map<String, dynamic> params = {
      "login_Type": loginModel.loginMethod == 0 ? 1 : 2,
      "loginID": "",
      "password": "",
      "u_Type": 1,
      "phoneKey": appinfo!.deviceUUID,
      // sms_Code
    };

    if (loginModel == null) {
      Log.d("LoginModel is null");
      return;
    }

    if (loginModel.loginMethod == 0) {
      if (!RegExpUtils.isPhoneReg(loginModel.account.trim())) {
        Log.d("请输入账号==toast");
        return;
      }

      if (loginModel.password.trim().isEmpty) {
        Log.d("请输入密码==toast");
        return;
      }

      params['loginID'] = loginModel.account;
      params['password'] = loginModel.password;
    } else {
      if (!RegExpUtils.isPhoneReg(loginModel.phone.trim())) {
        Log.d("请输入账号==toast1");
        return;
      }

      if (loginModel.smsCode.trim().isEmpty) {
        Log.d("请输入验证码==toast");
        return;
      }
      params['loginID'] = loginModel.phone;
      params['sms_Code'] = loginModel.smsCode;
    }

    DioUtils.instance.requestNetwork(Method.post, HttpApi.login, params: params, onSuccess: (json) async {
      Map jsonData = json as Map<String, dynamic>;
      bus.emit(USER_LOGIN_NOTIFY, "登录成功了");

      await UserLoginStore().updateToken(token: jsonData['loginData']['token']);
      await UserLoginStore().updateIsFirst();

      await AppHomeStore.init();
      await AppHomeStore().updateHomeData(homeData: AppUserHome.fromJson(jsonData['homeData']));

      Future.delayed(const Duration(seconds: 1), () {
        Get.offAndToNamed(AppRoutes.application);
      });
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
