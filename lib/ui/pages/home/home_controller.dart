import 'package:get/get.dart';
import 'package:offline/models/app_user_home.dart';
import 'package:offline/store/home.dart';
import 'package:offline/ui/pages/home/home_models.dart';

class HomeController extends GetxController {
  var homeModel = Rx<HomeModel?>(null);

  AppUserHome? homeData;

  @override
  void onInit() async {
    super.onInit();
    fetchHome();
    await AppHomeStore.init();
    print({"debug=====初始化=======10===home"});

    AppHomeStore().getHomeData().then((value) {
      homeData = value;
    });
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
