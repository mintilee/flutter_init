import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:offline/component/text.dart';
import 'package:offline/main.dart';
import 'package:offline/models/app_info.dart';
import 'package:offline/store/app.dart';
import 'package:offline/store/user-login.dart';
import 'package:offline/ui/pages/auth/login/login_screen.dart';
import 'package:offline/ui/widgets/layout.dart';
import 'package:offline/utils/router_utils.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  int count = 3;

  // 请求公共数据接口

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() {
    Timer? timer;
    Future.delayed(const Duration(milliseconds: 200), () {
      if (timer != null) {
        timer?.cancel();
        timer = null;
      }
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        if (count == 1) {
          timer?.cancel();
          timer = null;
          print({"debug========35=====准备起跳"});
          _goMain();
        }
        if (mounted) {
          setState(() {
            count--;
          });
        }
      });
    });
  }

  void _goMain() async {
    bool? isFirstApp = await UserLoginStore().getIsFirst();
    if (isFirstApp ?? true) {
      Get.to(LoginScreen(), binding: LoginScreenBinging());
    } else {
      print({"debug========57=====准备去首页"});
      RouterUtils.popToUntil(page: MainPage(), binding: MainPageBinding());
    }
    // RouteUtil.goMain(context);
    // 如果是第一次进来---》 登陆页面  true
    // 如果是 第二次进来 并登陆了 home页面
    // 如果是 第二次进来 token过期了 中转页
  }

  Widget _buildSplashBg() {
    return Image.asset(
      assetsName("splash/launch_image"),
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          _buildSplashBg(),
          Positioned(
            top: 30.w,
            right: 14.h,
            child: Offstage(
              offstage: false,
              child: InkWell(
                onTap: () async {
                  print({"需要去别的页面"});
                  // await AppStore().getAppInfo().then((value) => print({"debug======>", value!.deviceUUID}));
                  _goMain();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: const Color(0x19000000),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: customText("跳过${count}S", 14, Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
