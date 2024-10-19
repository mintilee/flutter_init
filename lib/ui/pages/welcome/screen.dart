import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:offline/component/text.dart';
import 'package:offline/main.dart';
import 'package:offline/routers/names.dart';
import 'package:offline/ui/pages/welcome/controller.dart';
import 'package:offline/ui/widgets/layout.dart';

class WelcomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              assetsName("splash/launch_image"),
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 50.w,
            right: 14.h,
            child: Offstage(
              offstage: false,
              child: InkWell(
                onTap: () async {
                  Get.offAndToNamed(AppRoutes.login);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: const Color(0x19000000),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: GetBuilder<WelcomeController>(
                    builder: (_) {
                      return customText("跳过${_.count}S", 14, Colors.white);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeBg() {
    return Image.asset(
      assetsName("splash/launch_image"),
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }
}
