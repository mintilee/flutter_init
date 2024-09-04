import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:offline/component/button.dart';
import 'package:offline/component/field.dart';
import 'package:offline/component/fo-icon.dart';
// import 'package:offline/component/nabbar.dart';
import 'package:offline/component/text.dart';
import 'package:offline/net/api.dart';
import 'package:offline/res/theme.dart';
import 'package:offline/ui/pages/auth/login/login_controller.dart';
import 'package:offline/ui/widgets/layout.dart';
import 'package:offline/ui/widgets/tools.dart';

class LoginScreenBinging implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginScreenController>(LoginScreenController());
  }
}

class LoginScreen extends GetView<LoginScreenController> {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetsName('auth/background')),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: CustomButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        const Icon(
                          FoIcon.ROLE_CHANGE,
                        ),
                        customText('切换商户端', 12, AppColor.blackText2),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                top: kToolbarHeight,
                bottom: bottomBarHeight(context) + 30.h,
                left: 15.w,
                right: 15.w,
                child: SizedBox(
                  width: 345.w,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: customText('欢迎来到通用版', 24, AppColor.blackText, isBold: true),
                      ),
                      gh(120),
                      Column(
                        children: [
                          changeLoginStatusView(),
                          gh(30),
                          GetBuilder<LoginScreenController>(
                            builder: (_) {
                              return Visibility(visible: controller.flag.value, child: passwordLogin());
                            },
                          ),
                          GetBuilder<LoginScreenController>(
                            builder: (_) {
                              return Visibility(visible: !controller.flag.value, child: smsLogin());
                            },
                          ),
                          AgreeLoginView(),
                          SubmitButton(
                            title: "登录",
                            color: AppColor.theme,
                            onPressed: () {
                              controller.toLogin();
                            },
                          ),
                          gh(30),
                          Align(
                            alignment: Alignment.centerRight,
                            child: CustomButton(
                              onPressed: () {},
                              child: customText('忘记密码', 14, AppColor.theme),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 30.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          customText('立即注册', 16, AppColor.blackText),
                          const Icon(FoIcon.ARROW_RIGHT, size: 12),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ))),
    );
  }

  // 登陆方式
  Widget changeLoginStatusView() {
    return Row(
      children: List.generate(2, (index) {
        Size size = calculateTextHeight("密码登陆", 18, FontWeight.bold, double.infinity, 1, Global.navigatorKey.currentContext!, texeHeight: 1.25.sp);
        return GetBuilder<LoginScreenController>(
          builder: (_) {
            bool flag = controller.loginModel.value!.loginMethod == index ? true : false;
            return Expanded(
                child: SizedBox(
              width: size.width.w,
              height: size.height.h,
              child: CustomButton(
                onPressed: () {
                  controller.loginModel.value!.loginMethod = index;
                  controller.flag.value = controller.loginModel.value!.loginMethod == 0 ? true : false;
                  controller.update();
                },
                child: Stack(
                  children: [
                    Center(
                      child: customText(index == 0 ? "密码登陆" : "验证码登录", 18, AppColor.blackText, isBold: flag ? true : false),
                    ),
                    if (flag)
                      Align(
                        alignment: const Alignment(0, 0.8),
                        child: Container(
                          width: 45.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: AppColor.blueColor1.withOpacity(.5),
                            borderRadius: BorderRadius.circular(3.w),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ));
          },
        );
      }),
    );
  }

  // 您已阅读并同意
  Widget AgreeLoginView() {
    return Container(
      width: 345.w,
      height: 48.h,
      child: Row(
        children: [
          GetBuilder<LoginScreenController>(
            builder: (_) {
              return CustomButton(
                onPressed: () {
                  controller.selectAgreeStatus.value = !controller.selectAgreeStatus.value;
                  controller.update();
                },
                child: controller.selectAgreeStatus.value
                    ? const Icon(
                        FoIcon.CIRCLE_RADIO_SELECT,
                        size: 24,
                      )
                    : const Icon(
                        FoIcon.CIRCLE_RADIO,
                        size: 24,
                      ),
              );
            },
          ),
          gw(7),
          Row(
            children: [
              customText('您已阅读并同意', 12, AppColor.greyText),
              CustomButton(
                onPressed: () {},
                child: customText("《用户注册协议》", 12, AppColor.themeText),
              ),
              customText('和', 12, AppColor.greyText),
              CustomButton(
                onPressed: () {},
                child: customText("《隐私政策》", 12, AppColor.themeText),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 密码登陆
  Widget passwordLogin() {
    return Column(
      children: [
        Container(
          width: 345.w,
          height: 55.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Fields(
            type: TextInputType.text,
            placeholder: "请输入账号",
            onChange: (val) {
              controller.loginModel.value!.account = val;
            },
          ),
        ),
        gh(15),
        Container(
          width: 345.w,
          height: 55.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Fields(
            type: TextInputType.visiblePassword,
            placeholder: "请输入密码",
            value: controller.loginModel.value!.password,
            onChange: (val) {
              controller.loginModel.value!.password = val;
            },
            rightIcon: CustomButton(
              onPressed: () {
                controller.loginModel.value!.isShow = !controller.loginModel.value!.isShow;
                controller.update();
              },
              child: GetX<LoginScreenController>(
                builder: (_) {
                  return controller.loginModel.value!.isShow ? Icon(FoIcon.CLOSE_EYE) : Icon(FoIcon.OPEN_EYE);
                },
              ),
            ),
            passwordHidden: controller.loginModel.value!.isShow,
          ),
        ),
      ],
    );
  }

  // 验证码登陆
  Widget smsLogin() {
    return Column(
      children: [
        Container(
          width: 345.w,
          height: 55.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Fields(
            maxLength: 11,
            type: TextInputType.phone,
            placeholder: "请输入手机号",
            onChange: (val) {
              controller.loginModel.value!.phone = val;
              print({"${controller.loginModel.value!.phone}======1000"});
            },
          ),
        ),
        gh(15),
        Container(
          width: 345.w,
          height: 55.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Fields(
            type: TextInputType.number,
            placeholder: "请输入验证码",
            value: "",
            onChange: (val) {
              controller.loginModel.value!.smsCode = val;
            },
            rightIcon: CustomButton(
              onPressed: () {},
              child: customText('获取验证码', 16, AppColor.themeText),
            ),
          ),
        ),
      ],
    );
  }
}
