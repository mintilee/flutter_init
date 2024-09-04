import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 基础的文本
Text customText(
  String text,
  double fontSize,
  Color? color, {
  bool isBold = false,
  FontWeight? fw,
  int maxLines = 1,
  TextAlign textAlign = TextAlign.start,
  TextBaseline? textBaseline,
  double textHeight = 1.25,
  TextOverflow overflow = TextOverflow.ellipsis,
}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize.sp,
      color: color ?? Colors.black,
      fontWeight: fw ?? (isBold ? FontWeight.bold : FontWeight.normal),
      height: textHeight.sp,
      textBaseline: textBaseline,
    ),
  );
}
