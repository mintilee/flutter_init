import 'package:get/get.dart';
import 'package:offline/ui/pages/home/home_models.dart';

class HomeController extends GetxController {
  var homeModel = Rx<HomeModel?>(null);

  @override
  void onInit() {
    super.onInit();
    print({"debug=====初始化=======10===home"});
    fetchHome();
  }

  // 初始化models里面的数据

  void fetchHome() {
    homeModel.value = HomeModel(title: '主页', topMenu: [
      TopMenuModel(
        title: '伙伴',
        icon: 'top_menu1',
        router: '/top_route1',
      ),
      TopMenuModel(
        title: '商户',
        icon: 'top_menu2',
        router: '/top_route2',
      ),
      TopMenuModel(
        title: '终端',
        icon: 'top_menu3',
        router: '/top_route3',
      ),
      TopMenuModel(
        title: '钱包',
        icon: 'top_menu4',
        router: '/top_route4',
      ),
    ]);
  }
}
