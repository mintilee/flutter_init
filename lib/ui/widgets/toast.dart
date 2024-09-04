import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static FToast? _fToast;

  // 初始化FToast实例
  static void init(BuildContext context) {
    _fToast = FToast();
    _fToast!.init(context);
  }

  // 显示Toast消息
  static void showToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    double fontSize = 16.0,
    int durationInSeconds = 2,
  }) {
    if (_fToast == null) {
      throw Exception("ToastUtils not initialized. Call ToastUtils.init(context) first.");
    }

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: backgroundColor,
      ),
      child: Text(
        message,
        style: TextStyle(fontSize: fontSize, color: textColor),
      ),
    );

    _fToast!.showToast(
      child: toast,
      gravity: gravity,
      toastDuration: Duration(seconds: durationInSeconds),
    );
  }

  // 取消所有显示的Toast
  static void cancelAllToasts() {
    _fToast?.removeQueuedCustomToasts();
  }
}
