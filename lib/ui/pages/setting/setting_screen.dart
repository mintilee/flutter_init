import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:offline/component/button.dart';
import 'package:offline/component/fo-icon.dart';
import 'package:offline/component/nabbar.dart';
import 'package:offline/component/text.dart';
import 'package:offline/models/app_user_home.dart';
import 'package:offline/res/theme.dart';
import 'package:offline/routers/names.dart';
import 'package:offline/routers/routes.dart';
import 'package:offline/store/home.dart';
import 'package:offline/ui/pages/application/application_controller.dart';
import 'package:offline/ui/pages/auth/login/login_screen.dart';
import 'package:offline/ui/pages/setting/setting_controller.dart';
import 'package:offline/ui/pages/setting/userinfo/userinfo_screen.dart';
import 'package:offline/ui/widgets/layout.dart';

class SettingScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SettingController>(SettingController());
  }
}

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF9F9F9FF),
      appBar: Navbar(
        title: "设置",
        color: const Color(0xF9F9F9FF),
      ),
      body: submitBody(context, "安全退出", marginTop: 15.w, contentColor: Color(0xF9F9F9FF), buttonHeight: 80, build: (boxHeight, context) {
        return SizedBox(
          height: boxHeight,
          width: 345.w,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.w),
                child: Column(
                  children: [
                    cellWidget("个人信息", icon: FoIcon.ROLE_CHANGE),
                    cellWidget("地址管理", icon: FoIcon.BELL),
                  ],
                ),
              ),
              gh(15),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.w),
                child: Column(
                  children: [
                    cellWidget("账户安全", icon: FoIcon.ROLE_CHANGE),
                    cellWidget("备用手机号", icon: FoIcon.BELL),
                  ],
                ),
              ),
              gh(15),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.w),
                child: Column(
                  children: [
                    cellWidget("关于我们", icon: FoIcon.ROLE_CHANGE),
                    cellWidget("当前版本", icon: FoIcon.BELL, subTitle: "1.0.0"),
                    cellWidget("相关协议", icon: FoIcon.BELL),
                  ],
                ),
              )
            ],
          ),
        );
      },
          bottomChild: Container(
            child: submitButton("退出登录", () async {
              controller.loginOut().then((value) {
                return Get.offAll(const LoginScreen(), binding: LoginScreenBinging(), routeName: AppRoutes.login);
              });
            }, textColor: Color(0xFFFF513A), color: Colors.white),
          )),
    );
  }

  Widget cellWidget(String title, {IconData? icon, String? subTitle}) {
    return Container(
      width: 345.w,
      height: 55.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: CustomButton(
        onPressed: () {
          Get.to(UserinfoScreen(), binding: UserinfoBinding());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Icon(icon, size: 20, color: AppColor.blackText),
                gw(10),
                customText(title, 16, AppColor.blackText, isBold: true),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                if (subTitle != null) ...[
                  customText(subTitle, 16, AppColor.blackText, isBold: true),
                  gw(10),
                ],
                const Icon(FoIcon.ARROW_RIGHT, size: 16, color: AppColor.blackText),
              ],
            )
          ],
        ),
      ),
    );
  }
}
