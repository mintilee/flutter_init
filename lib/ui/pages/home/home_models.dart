class HomeModel {
  // top菜单
  List<TopMenuModel> topMenu;

  String title;
  HomeModel({required this.title, required this.topMenu});
}

class TopMenuModel {
  // 标题
  String title;
  // icon 图标
  String? icon;
  // router 路由
  String? router;

  TopMenuModel({required this.title, this.icon, this.router});
}
