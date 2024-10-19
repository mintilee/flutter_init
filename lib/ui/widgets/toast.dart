import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static final ToastUtils _instance = ToastUtils._internal();

  factory ToastUtils() {
    return _instance;
  }

  ToastUtils._internal();

  late FToast fToast;
  // 初始化FToast实例
  void init(BuildContext context) {
    fToast = FToast();
    fToast.init(context);
  }

  // 显示Toast消息
  void showToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    double fontSize = 12.0,
    int durationInSeconds = 2,
  }) {
    if (fToast == null) {
      throw Exception("ToastUtils not initialized. Call ToastUtils.init(context) first.");
    }

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 9.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: backgroundColor,
      ),
      child: Text(
        message,
        style: TextStyle(fontSize: fontSize, color: textColor),
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: gravity,
      toastDuration: Duration(seconds: durationInSeconds),
    );
  }

  // 取消所有显示的Toast
  void cancelAllToasts() {
    fToast.removeQueuedCustomToasts();
  }
}
