import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offline/component/button.dart';
import 'package:offline/component/text.dart';
import 'package:offline/res/theme.dart';

/// 布局相关的

// 获取相关图片
String assetsName(String img) {
  return "assets/images/$img.png";
}

// 获取相关svg
String assetsSvgName(String svg) {
  return "assets/svg/$svg.svg";
}

// 获取设备状态栏的高度
double statuBarsHeight(BuildContext? context) {
  final MediaQueryData data = MediaQuery.of(context ?? GlobalKey<NavigatorState>().currentContext!);
  EdgeInsets padding = data.padding;
  padding = padding.copyWith(bottom: data.viewPadding.top);
  return padding.top;
}

// 获取设备安全区域的高度
double bottomBarHeight(BuildContext? context) {
  final MediaQueryData data = MediaQuery.of(context ?? GlobalKey<NavigatorState>().currentContext!);
  EdgeInsets padding = data.padding;
  padding = padding.copyWith(bottom: data.viewPadding.bottom);
  return padding.bottom;
}

// 高度占位
SizedBox gh(double height) {
  return SizedBox(height: height.h);
}

// 宽度占位
SizedBox gw(double width) {
  return SizedBox(width: width.w);
}

// 垂直居中
Column centerColumn(
  List<Widget> children, {
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
}) {
  return Column(
    mainAxisAlignment: mainAxisAlignment,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: MainAxisSize.min,
    children: children,
  );
}

// 获取文本的宽度
Size calculateTextHeight(String value, double fontSize, FontWeight fontWeight, double maxWidth, int maxLines, BuildContext context, {Color? color, double? texeHeight}) {
  value = filterText(value);
  TextPainter painter = TextPainter(

      ///AUTO：华为手机如果不指定locale的时候，该方法算出来的文字高度是比系统计算偏小的。
      locale: Localizations.localeOf(context),
      // locale: WidgetsBinding.instance!.window.locale,
      // locale: Localizations.localeOf(GlobalKey<NavigatorState>().currentContext!),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
      textScaleFactor: 1, //字体缩放大小
      text: TextSpan(
          text: value,
          style: TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            height: texeHeight,
          )));
  painter.layout(maxWidth: maxWidth);

  ///文字的宽度:painter.width
  return Size(painter.width, painter.height);
}

// 过滤文本
String filterText(String text) {
  String tag = '<br>';
  while (text.contains('<br>')) {
    // flutter 算高度,单个\n算不准,必须加两个
    text = text.replaceAll(tag, '\n\n');
  }
  return text;
}

// body+底部定位 区域

Widget submitBody(BuildContext context, String title,
    {Function()? onPressed, List<Widget>? children, Widget? bottomChild, double? marginTop, double? fromTop, Color? contentColor, double? buttonHeight, Color? bottomColor, DecoratedBox? bottomDecoratedBox, Widget Function(double boxHeight, BuildContext context)? build}) {
  return Builder(
    builder: (context) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            gh(marginTop ?? 0),
            realityBody(context, children: children, buttonHeight: buttonHeight, marginTop: marginTop, contentColor: contentColor, fromTop: fromTop, build: build),
            bottomChild ?? bottomThemeSubmit(context, title, onPressed: onPressed, color: bottomColor),
          ],
        ),
      );
    },
  );
}

Widget realityBody(BuildContext context, {List<Widget>? children, double? marginTop, double? fromTop, Color? contentColor, double? buttonHeight, Widget Function(double boxHeight, BuildContext context)? build}) {
  double screenHeight = ScreenUtil().screenHeight;
  double appBarMaxHeight = Scaffold.of(context).appBarMaxHeight ?? 0;
  double bottomHeight = buttonHeight ?? (80.h + bottomBarHeight(context));
  double paddingBottom = 0;
  double topMargin = marginTop != null ? marginTop.h : 0;
  double topSpacing = fromTop != null ? fromTop.h : 0;
  double boxHeight = screenHeight - appBarMaxHeight - bottomHeight - paddingBottom - topMargin - topSpacing;

  return Container(
    width: 375.w,
    height: boxHeight,
    color: contentColor ?? AppColor.scaffoldBG,
    child: children != null
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: children,
            ),
          )
        : build != null
            ? build(boxHeight, context)
            : Container(),
  );
}

Widget bottomThemeSubmit(BuildContext context, String title, {Function()? onPressed, bool enalble = true, Color? color}) {
  return Container(
    width: 375.w,
    height: 80.h + bottomBarHeight(context),
    color: Colors.white,
    padding: EdgeInsets.only(bottom: bottomBarHeight(context)),
    child: Center(
      child: submitButton(title, onPressed ?? () {}, enable: enalble, color: color),
    ),
  );
}

Widget submitButton(
  String? title,
  Function() onPressed, {
  bool enable = true,
  double? width,
  double? height,
  Color? color,
  Color? textColor,
  double? fontSize,
  LinearGradient? linearGradient,
  bool isBold = false,
  double? radius,
}) {
  return CustomButton(
    onPressed: enable ? onPressed : null,
    child: Opacity(
      opacity: enable ? 1.0 : 0.5,
      child: Container(
        width: width != null ? width.w : 345.w,
        height: height != null ? height.h : 50.h,
        decoration: BoxDecoration(
          gradient: color != null
              ? null
              : LinearGradient(colors: [
                  AppColor.theme,
                  AppColor.theme.withOpacity(0.5),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          color: color,
          borderRadius: BorderRadius.circular(radius != null ? radius.w : 25.w),
        ),
        child: Center(
          child: customText(title ?? "", fontSize ?? 15, textColor ?? Colors.white, isBold: isBold),
        ),
      ),
    ),
  );
}
