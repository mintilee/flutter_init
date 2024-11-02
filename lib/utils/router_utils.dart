import 'package:get/get.dart';

import 'package:offline/ui/pages/application/application_controller.dart';

import 'package:offline/ui/pages/application/application_screen.dart';

class RouterUtils {
  // 回到主页面
  void popToUntil({int? tabIndex = 0}) {
    Get.until((route) {
      if (route is GetPageRoute) {
        if (route.binding is ApplicationBinding) {
          ApplicationController ctrl = Get.find<ApplicationController>();
          ctrl.tabbarIndex = tabIndex;
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    });
  }
}
