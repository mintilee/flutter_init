import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:offline/component/button.dart';
import 'package:offline/component/fo-icon.dart';
import 'package:offline/component/nabbar.dart';
import 'package:offline/component/text.dart';
import 'package:offline/models/app_info.dart';
import 'package:offline/models/app_user_login.dart';
import 'package:offline/net/http.dart';
import 'package:offline/net/intercept.dart';
import 'package:offline/res/theme.dart';

import 'package:offline/store/app.dart';
import 'package:offline/store/user-login.dart';
import 'package:offline/ui/pages/auth/login/login_screen.dart';
import 'package:offline/ui/pages/home/home_screen.dart' deferred as home;
import 'package:offline/ui/pages/mine/mine_screen.dart' deferred as mine;
import 'package:offline/ui/pages/datas/datas_screen.dart' deferred as datas;

import 'package:offline/ui/widgets/deferred.dart';
import 'package:offline/ui/widgets/initial_binding.dart';
import 'package:offline/ui/widgets/splash_page.dart';
import 'package:offline/ui/widgets/toast.dart';
import 'package:offline/ui/widgets/tools.dart';
import 'package:offline/utils/log_utils.dart';

import 'ui/widgets/layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 去掉状态栏的阴影
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  await Hive.initFlutter();
  Hive.registerAdapter<AppInfo>(AppInfoAdapter());
  Hive.registerAdapter<AppUserLogin>(AppUserLoginAdapter());
  // await AppStore.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    openAppinfoHive();
    openAppUserLoginHive();

    LogUtil.init(isDebug: true);
    initDio();
  }

  void initDio() {
    final List<Interceptor> interceptors = <Interceptor>[];

    /// 统一添加身份验证请求头
    interceptors.add(AuthInterceptor());

    interceptors.add(LoggingInterceptor());

    configDio(
      baseUrl: 'http://api.boxinda.vip',
      interceptors: interceptors,
    );
  }

  void openAppinfoHive() async {
    await AppStore.init();
    await AppStore().appInfo();
  }

  void openAppUserLoginHive() async {
    await UserLoginStore.init();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (kIsWeb) {
          return false;
        } else {
          return true;
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            builder: FToastBuilder(),
            darkTheme: AppTheme.defaultTheme,
            theme: AppTheme.defaultTheme,
            navigatorKey: Global.navigatorKey,
            debugShowCheckedModeBanner: false,
            home: SplashPage(),
            initialBinding: InitialBinding(),
            supportedLocales: const [Locale("en"), Locale("zh")],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}

class MainPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageCtrl>(() => MainPageCtrl());
  }
}

class MainPageCtrl extends GetxController {
  final tabbarIndex = RxInt(0);

  @override
  void onInit() {
    super.onInit();
  }
}

class MainPage extends GetView<MainPageCtrl> {
  @override
  Widget build(BuildContext context) {
    ToastUtils.init(context);
    return GetBuilder<MainPageCtrl>(
      builder: (_) {
        return Scaffold(
          body: GetX<MainPageCtrl>(
            builder: (_) {
              return LazyIndexedStack(index: controller.tabbarIndex.value, children: [
                tabPage(0),
                tabPage(1),
                tabPage(2),
              ]);
            },
          ),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 60.h + bottomBarHeight(context),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: bottomBarHeight(context),
              ),
              child: GetX<MainPageCtrl>(
                builder: (controller) {
                  return Row(
                    children: [
                      bottonBar(0),
                      bottonBar(1),
                      bottonBar(2),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  // 首页、数据、我的
  Widget tabPage(int index) {
    return CustomDeferredWidgt(
        loader: index == 0
            ? home.loadLibrary
            : index == 1
                ? datas.loadLibrary
                : mine.loadLibrary,
        build: () => index == 0
            ? home.HomeScreen()
            : index == 1
                ? datas.DatasScreen()
                : mine.MineScreen());
  }

  Widget bottonBar(int index) {
    bool activeBar = controller.tabbarIndex.value == index;
    return CustomButton(
      onPressed: () {
        controller.tabbarIndex.value = index;
        print({"debug==${index}====185===${controller.tabbarIndex.value}": activeBar});
      },
      child: SizedBox(
        width: 375.w / 3,
        height: 60.h,
        child: Padding(
          padding: EdgeInsets.only(bottom: 3.w),
          child: Align(
            child: centerColumn([
              Icon(
                  index == 0
                      ? FoIcon.HOME
                      : index == 1
                          ? FoIcon.DATA
                          : FoIcon.MINE,
                  color: activeBar ? AppColor.theme : AppColor.blackColor1),
              customText(
                  index == 0
                      ? '首页'
                      : index == 1
                          ? "数据"
                          : "我的",
                  10,
                  activeBar ? AppColor.themeText : AppColor.blackText),
            ]),
          ),
        ),
      ),
    );
  }
}
