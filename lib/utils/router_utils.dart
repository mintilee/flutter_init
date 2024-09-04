import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offline/main.dart';

class RouterUtils {
  RouterUtils._();

  // 返回首页
  static void popToUntil<T>({Widget? page, Bindings? binding, T? popTo}) {
    if (page != null && binding != null) {
      Get.offUntil(
          GetPageRoute(
            page: () => page,
            binding: binding,
          ), (route) {
        if (route is GetPageRoute) {
          if (route.binding is MainPageBinding) {
            return true;
          }
          return false;
        } else {
          return false;
        }
      });
    } else {
      Get.until((route) {
        if (route is GetPageRoute) {
          if (route.binding is MainPageBinding) {
            return true;
          }
          return false;
        } else {
          return false;
        }
      });
    }
  }
}
