import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offline/component/button.dart';
import 'package:offline/component/text.dart';
import 'package:offline/res/theme.dart';
import 'package:offline/ui/widgets/layout.dart';

class ErrorStatusScreen extends StatelessWidget {
  final double boxHeight;
  final double appBarMaxHeight;
  final int errorCode;
  final Function()? toLogin;

  const ErrorStatusScreen({super.key, this.boxHeight = 0, this.errorCode = 0, this.toLogin, this.appBarMaxHeight = 0});

  @override
  Widget build(BuildContext context) {
    // 标题
    String errorTitle = "您的账号登录状态已失效，请重新登录";
    // 错误图片
    String errorImg = "";

    switch (errorCode) {
      case 201:
        // errorTitle = "身份验证失败，请重新登录";
        errorImg = "error/icon_201";
        break;
      case 202:
        // errorTitle = "身份信息已经过期，请重新登录";
        errorImg = "error/icon_201";
        break;
      case 203:
        // errorTitle = "您的账号已在其他设备登录";
        errorImg = "error/icon_201";
        break;
      case 404:
        // errorTitle = "抱歉，您要访问的页面不存在";
        errorImg = "error/icon_404";
        break;
      default:
        errorImg = "error/icon_201";
    }

    return SizedBox(
      width: 375.w,
      height: boxHeight,
      child: Padding(
        padding: EdgeInsets.only(bottom: appBarMaxHeight),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 185.w,
                height: 156.h,
                child: Image.asset(
                  assetsName(errorImg),
                  width: 185.w,
                  fit: BoxFit.fitWidth,
                ),
              ),
              gh(30),
              customText(errorTitle, 15, AppColor.greyText),
              gh(33),
              CustomButton(
                onPressed: () {
                  if (toLogin != null) {
                    toLogin!();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 120.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: AppColor.theme,
                    borderRadius: BorderRadius.circular(18.w),
                  ),
                  child: customText("重新登录", 12, Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
