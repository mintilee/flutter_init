class LoginModel {
  // 是否展示密码
  bool isShow;
  // 登陆方式 0、密码 1、短信
  int loginMethod;
  // 账号
  String account;
  // 手机号
  String phone;
  //密码
  String password;
  // 短信
  String smsCode;

  LoginModel({
    required this.isShow,
    required this.loginMethod,
    required this.account,
    required this.phone,
    required this.password,
    required this.smsCode,
  });
}
