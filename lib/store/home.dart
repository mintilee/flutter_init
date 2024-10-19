import 'package:hive/hive.dart';
import 'package:offline/models/app_user_home.dart';

class AppHomeStore {
  static const String userHomeStore = "userHome";

  final Box<AppUserHome> box = Hive.box(userHomeStore);

  static Future<void> init() async {
    await Hive.openBox<AppUserHome>(userHomeStore);
  }

  // 更新homeData
  Future<void> updateHomeData({required AppUserHome homeData}) async {
    await box.put('userHome', homeData);
  }

  // 获取homeData
  Future<AppUserHome?> getHomeData() async {
    return await box.get('userHome');
  }

  // 清理AppHome缓存数据
  Future<void> clear() async {
    await box.clear();
  }
}
