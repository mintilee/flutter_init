import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/**
 * @description 主题
 */

class AppTheme {
  AppTheme._();
  static const String fontName = 'WorkSans';

  static MaterialColor primaryTheme = MaterialColor(AppColor.theme.value, const <int, Color>{
    50: AppColor.theme,
    100: AppColor.theme,
    200: AppColor.theme,
    300: AppColor.theme,
    400: AppColor.theme,
    500: AppColor.theme,
    600: AppColor.theme,
    700: AppColor.theme,
    800: AppColor.theme,
    900: AppColor.theme,
  });

  static const TextTheme textTheme = TextTheme(
    displayLarge: displayLarge,
  );
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: AppColor.darkerText,
  );

  static ThemeData defaultTheme = ThemeData(
    primaryColor: AppColor.theme,
    primarySwatch: primaryTheme,
    textTheme: AppTheme.textTheme,
    platform: TargetPlatform.iOS,
    scaffoldBackgroundColor: AppColor.scaffoldBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColor.cursorColor,
      selectionColor: AppColor.selectionColor.withOpacity(0.3),
    ),
    hintColor: AppColor.hintColor,
    highlightColor: AppColor.highlightColor,
    splashColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );
}

class AppColor {
  AppColor._();
  static const Color theme = Color(0xFF0077FF); // 主题颜色
  static const Color subtheme = Color(0xFFFF4E08); // 子主题颜色

  static const Color scaffoldBG = Color(0xFFFFFFFF); // Scaffold 默认背景色
  static const Color bodyBG = Color(0xFFf6f6f6);
  // #F6F6F6
  static const Color cursorColor = Colors.blue; // 光标颜色
  static const Color selectionColor = Color(0XFF2196F3); // 文本选中颜色
  static const Color hintColor = Color(0xFF999999); // 提示文本或占位符文本的颜色
  static const Color highlightColor = Color(0x40CCCCCC); // 水波纹点击颜色
  static const Color splashColor = Color(0x40CCCCCC); // 水波纹松开颜色

  static const Color darkerText = Color(0xFF17262A);

  // 文字颜色
  static const Color blackText = Color(0xFF333333);
  static const Color blackText2 = Color(0xFF000000);
  static const Color blackText3 = Color(0xFF666666);

  // 白色
  static const Color whiteText1 = whiteColor1;

  // 灰色
  static const Color greyText = hintColor;
  static const Color greyText2 = Color(0xFFCCCCCC);

  // 蓝色
  static const Color blueText = blueColor1;
  static const Color blueText1 = Color(0xFF7A98AE);

  // 粉色
  static const Color pinkText1 = Color(0xFFBD807C);

  static const Color themeText = theme;

  // 棕色
  static const Color brownText = Color(0xFFBD987A);

  // 背景颜色
  static const Color blueColor1 = Color(0xFF2C67E9);
  static const Color blueColor2 = Color(0xFFE6EFFF);

  static const Color blackColor1 = blackText;

  // 白色背景
  static const Color whiteColor1 = Color(0xFFEEEEEE);
  static const Color whiteColor2 = Color(0x00FFFFFF);

  // 灰色背景
  static const Color greyColor1 = Color(0xFFF8F8F8);

  // 橙色背景
  static const Color orangeColor1 = Color(0xFFFFF5E6);

  // 青色
  static const Color cyanColor1 = Color(0xFFE6FBFF);
}
