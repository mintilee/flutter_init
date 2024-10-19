import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offline/main.dart';

// class RouterUtils {
//   // 返回首页
//   void popToUntil<T>({Widget? page, Bindings? binding, T? popTo, dynamic alignment, String? name}) {
//     if (page != null && binding != null) {
//       Get.offUntil(
//           GetPageRoute(page: () => page, binding: binding, settings: RouteSettings(arguments: alignment, name: name)),
//           (route) => route is GetPageRoute
//               ? route.binding is MainPageBinding
//                   ? true
//                   : false
//               : false);
//     } else {
//       Get.until((route) => route is GetPageRoute
//           ? route.binding is MainPageBinding
//               ? true
//               : false
//           : false);
//     }
//   }
// }
