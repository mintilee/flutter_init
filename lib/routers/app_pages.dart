import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:offline/routers/names.dart';
import 'package:offline/routers/observes.dart';
import 'package:offline/ui/pages/application/application_screen.dart';
import 'package:offline/ui/pages/auth/login/login_screen.dart';
import 'package:offline/ui/pages/datas/datas_screen.dart';
import 'package:offline/ui/pages/home/home_screen.dart';
import 'package:offline/ui/pages/mine/mine_screen.dart';
import 'package:offline/ui/pages/welcome/screen.dart';

class AppPages {
  static const initial = AppRoutes.initial;
  static final RouteObserver<Route> observer = RouteObservers();
  static final List<String> history = [];
  static final List<GetPage> routes = [
    // 主进程页面
    GetPage(
      name: AppRoutes.initial,
      page: () => const WelcomeScreen(),
      binding: WelcomeScreenBinding(),
    ),

    GetPage(
      name: AppRoutes.application,
      page: () => const ApplicationScreen(),
      binding: ApplicationBinding(),
    ),

    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.data,
      page: () => const DatasScreen(),
      binding: DatasScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.mine,
      page: () => const MineScreen(),
      binding: MineScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginScreenBinging(),
    ),
  ];
}
