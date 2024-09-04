import 'package:get/get.dart';
import 'package:offline/main.dart';
import 'package:offline/models/app_info.dart';
import 'package:offline/net/net.dart';
import 'package:offline/store/app.dart';
import 'package:offline/store/user-login.dart';

import 'package:offline/ui/pages/auth/login/login_models.dart';
import 'package:offline/utils/log_utils.dart';
import 'package:offline/utils/regx_utils.dart';

class LoginScreenController extends GetxController {
  var loginModel = Rx<LoginModel?>(null);

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
      "login_Type": 1,
      "loginID": "",
      "password": "",
      "u_Type": 1,
      "phoneKey": appinfo!.deviceUUID,
    };
    if (loginModel.value?.loginMethod == 0) {
      if (!RegExpUtils.isPhoneReg(loginModel.value!.account.trim())) {
        Log.d("请输入账号==toast");
        return;
      }

      if (loginModel.value!.password.trim().isEmpty) {
        Log.d("请输入密码==toast");
        return;
      }

      params['loginID'] = loginModel.value!.account;
      params['password'] = loginModel.value!.password;
    } else {}

    DioUtils.instance.requestNetwork(Method.post, HttpApi.login, params: params, onSuccess: (json) async {
      Map jsonData = json as Map<String, dynamic>;
      print({"debug=========53": jsonData['loginData']['token']});
      await UserLoginStore().updateToken(token: jsonData['loginData']['token']);
      await UserLoginStore().updateIsFirst();
      Get.until((route) {
        if (route is GetPageRoute) {
          if (route.binding is MainPageBinding) {
            return true;
          }
          return false;
        } else {
          return false;
        }
      });
    });
  }

  @override
  void onInit() {
    super.onInit();
    fetchLogin();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 此处的作用是初始化model数据
  void fetchLogin() {
    loginModel.value = LoginModel(
      isShow: false,
      loginMethod: 0,
      account: "",
      phone: "",
      password: "",
      smsCode: "",
    );
  }
}
