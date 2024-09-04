import 'package:get/get.dart';
import 'package:offline/ui/pages/datas/datas_controller.dart';
import 'package:offline/ui/pages/home/home_controller.dart';
import 'package:offline/ui/pages/mine/mine_controller.dart';

// 初始绑定
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DatasController>(() => DatasController());
    Get.lazyPut<MineController>(() => MineController());
  }
}
