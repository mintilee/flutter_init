import 'package:hive/hive.dart';
import 'package:offline/models/app_user_login.dart';

class UserLoginStore {
  static const String userLoginStore = 'userLogin';
  final Box<AppUserLogin> box = Hive.box<AppUserLogin>(userLoginStore);

  static Future<void> init() async {
    await Hive.openBox<AppUserLogin>(userLoginStore);
  }

  // 更新 token
  Future<void> updateToken({required String token}) async {
    await box.put('userlogin', AppUserLogin(token: token));
  }

  // 更新 isFirst
  Future<void> updateIsFirst() async {
    String? token = await getToken();
    print({"debug======> token========20": token});
    await box.put('userlogin', AppUserLogin(isFirst: false, token: token ?? ""));
  }

  // 获取token
  Future<String?> getToken() async {
    return await box.get('userlogin')?.token ?? "";
  }

  // 获取isFirst
  Future<bool?> getIsFirst() async {
    return await box.get('userlogin')?.isFirst;
  }
}
