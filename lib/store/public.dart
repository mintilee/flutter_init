import 'package:hive_flutter/hive_flutter.dart';
import 'package:offline/models/app_public.dart';

class AppPublicStore {
  static const String name = 'appPublic';

  final Box<AppPublic> box = Hive.box(name);

  static Future<void> init() async {
    await Hive.openBox<AppPublic>(name);
  }

  // 获取publicData
  Future<AppPublic?> getPublicData() async {
    return await box.get('appPublic');
  }

  //更新publicData
  Future<void> updatePublicData({required AppPublic publicData}) async {
    await box.put('appPublic', publicData);
  }

  // 清理AppPublic缓存数据
  Future<void> clear() async {
    await box.clear();
  }
}
