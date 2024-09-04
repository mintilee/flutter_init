import 'package:hive/hive.dart';
part 'app_user_login.g.dart';

/**
 * 用户登陆 存储部分数据
 */
@HiveType(typeId: 1)
class AppUserLogin extends HiveObject {
  @HiveField(0)
  // 是否是第一次使用此App
  final bool isFirst;
  // 用户token
  @HiveField(1)
  final String token;
  // 是否是C端
  @HiveField(2)
  final bool? cClient;
  // 是否上架
  @HiveField(3)
  final bool? isAppstore;

  AppUserLogin({
    this.isFirst = true,
    required this.token,
    this.cClient = false,
    this.isAppstore = false,
  });
}
