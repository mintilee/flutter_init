// 全局GlobalKey
import 'package:flutter/material.dart';

class Global {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

// 收起键盘
takeBackKeyboard(BuildContext? context) {
  FocusScope.of(context ?? Global.navigatorKey.currentContext!).requestFocus(FocusNode());
}
