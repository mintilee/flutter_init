import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offline/component/button.dart';
import 'package:offline/component/nabbar.dart';
import 'package:offline/component/text.dart';
import 'package:offline/res/theme.dart';
import 'package:offline/routers/app_pages.dart';
import 'package:offline/routers/names.dart';
import 'package:offline/ui/pages/application/application_controller.dart';
import 'package:offline/ui/pages/application/application_screen.dart';
import 'package:offline/ui/pages/home/home_screen.dart';
import 'package:offline/ui/pages/setting/userinfo/userinfo_controller.dart';
import 'package:offline/utils/router_utils.dart';

class UserinfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserinfoController>(UserinfoController());
  }
}

class UserinfoScreen extends GetView<UserinfoController> {
  const UserinfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(title: "用户信息"),
      body: Column(
        children: [
          CustomButton(
            onPressed: () {
              RouterUtils().popToUntil();
            },
            child: customText("回到首页", 18, AppColor.darkerText),
          )
        ],
      ),
    );
  }
}
