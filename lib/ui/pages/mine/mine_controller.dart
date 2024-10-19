import 'package:get/get.dart';
import 'package:offline/models/app_user_home.dart';
import 'package:offline/store/app.dart';
import 'package:offline/store/home.dart';
import 'package:offline/utils/bus_notify.dart';
import 'package:offline/utils/event_bus.dart';

class MineController extends GetxController {
  // 基础服务
  final List baseServiceData = [
    {"title": "实名认证", "subtitle": "保障财产安全", "iconUrl": "real_name"},
    {"title": "地址管理", "subtitle": "查看收货地址", "iconUrl": "address"},
    {"title": "结算卡", "subtitle": "完成提现认证", "iconUrl": "debit_card"},
    {"title": "联系客服", "subtitle": "400-123-1234", "iconUrl": "service"},
  ];

  AppUserHome? homeData;

  // 获取用户信息
  void hiveHomeData() async {
    await AppHomeStore.init();
    AppHomeStore().getHomeData().then((value) {
      homeData = value;
    });
  }

  // 用户登录通知
  onLoginNotify(arg) {
    print("===============$arg============29=======min====你来了======");
  }

  @override
  void onInit() async {
    bus.on(USER_LOGIN_NOTIFY, onLoginNotify);
    // hiveHomeData();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    print("=====执行不执行====MINE===");
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    bus.off(USER_LOGIN_NOTIFY, onLoginNotify);
  }
}
