import 'package:flutter/material.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:offline/component/button.dart';
import 'package:offline/component/fo-icon.dart';
import 'package:offline/component/text.dart';
import 'package:offline/res/theme.dart';
import 'package:offline/ui/pages/application/application_controller.dart';
import 'package:offline/ui/pages/datas/datas_controller.dart';
import 'package:offline/ui/pages/home/home_controller.dart';
import 'package:offline/ui/pages/mine/mine_controller.dart';

import 'package:offline/ui/pages/home/home_screen.dart' deferred as home;
import 'package:offline/ui/pages/datas/datas_screen.dart' deferred as datas;
import 'package:offline/ui/pages/mine/mine_screen.dart' deferred as mine;

import 'package:offline/ui/widgets/deferred.dart';
import 'package:offline/ui/widgets/layout.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DatasController>(() => DatasController());
    Get.lazyPut<MineController>(() => MineController());
  }
}

class ApplicationScreen extends GetView<ApplicationController> {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplicationController>(
      builder: (_) {
        return Scaffold(
          body: GetX<ApplicationController>(
            builder: (_) {
              return LazyIndexedStack(index: controller.tabbarIndex, children: [
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
              child: GetX<ApplicationController>(
                initState: (_) {},
                builder: (_) {
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
    bool activeBar = controller.tabbarIndex == index;
    return CustomButton(
      onPressed: () {
        controller.tabbarIndex = index;

        print({"debug==${index}====185===${controller.tabbarIndex}": activeBar});
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
