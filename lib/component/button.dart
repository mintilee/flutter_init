import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offline/component/text.dart';

// 自定义button
class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  const CustomButton({Key? key, required this.onPressed, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      onPressed: onPressed,
      child: child,
    );
  }
}

// 提交的button

class SubmitButton extends StatelessWidget {
  // 标题
  final String? title;
  final Function()? onPressed;
  // 是否重复点击
  final bool enable = true;
  // 宽
  final double? width;
  // 高
  final double? height;
  // 背景颜色
  final Color? color;
  // 文本颜色
  final Color? textColor;
  // 圆角
  final double? radius;
  // 字体大小
  final double? fontSize;
  // 渐变
  final LinearGradient? linearGradient;
  // 渐变色
  final List<Color>? linearColor;
  // 文字是否加粗
  final bool? isBold;

  const SubmitButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.width = 345,
    this.height = 45,
    required this.color,
    this.textColor,
    this.radius = 45 / 2,
    this.fontSize,
    this.linearGradient,
    this.isBold = false,
    this.linearColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: enable ? onPressed : null,
      child: Opacity(
        opacity: enable ? 1.0 : 0.5,
        child: Container(
          width: width != null ? width?.w : 345.w,
          height: height != null ? height?.w : 50.w,
          decoration: BoxDecoration(
            gradient: color != null
                ? null
                : (linearGradient ??
                    LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: linearColor!,
                    )),
            color: color,
            borderRadius: BorderRadius.circular(radius != null ? radius!.w : 25.w),
          ),
          child: Center(
            child: customText(title ?? "", fontSize ?? 15, textColor ?? Colors.white, isBold: isBold!),
          ),
        ),
      ),
    );
  }
}
