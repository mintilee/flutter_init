import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:offline/component/button.dart';
import 'package:offline/component/fo-icon.dart';
import 'package:offline/component/nabbar.dart';
import 'package:offline/component/text.dart';
import 'package:offline/res/theme.dart';
import 'package:offline/ui/pages/mine/mine_controller.dart';
import 'package:offline/ui/pages/setting/setting_screen.dart';
import 'package:offline/ui/widgets/layout.dart';
import 'package:offline/ui/widgets/toast.dart';

class MineScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineController>(() => MineController());
  }
}

class MineScreen extends StatefulWidget {
  const MineScreen({Key? key}) : super(key: key);

  @override
  State<MineScreen> createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> with AutomaticKeepAliveClientMixin {
  MineController controller = Get.find<MineController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          backgroundColor: AppColor.bodyBG,
          appBar: AppBar(
            centerTitle: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(assetsName('mine/mine_bg')),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              )),
            ),
            actions: [
              Container(
                width: 375.w,
                height: 32.h,
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(FoIcon.ROLE_CHANGE, color: Colors.white),
                    gw(15),
                    CustomButton(
                      onPressed: () {
                        Get.to(SettingScreen(), binding: SettingScreenBinding());
                      },
                      child: const Icon(FoIcon.SET, color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          body: Builder(
            builder: (context) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 375.w,
                      height: 225.h - (Scaffold.of(context).appBarMaxHeight ?? 0),
                      child: Column(
                        children: [
                          Image.asset(
                            assetsName("mine/mine_bg"),
                            width: 375.w,
                            height: 225.h - (Scaffold.of(context).appBarMaxHeight ?? 0),
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        mineTop(),
                        gh(30),
                        topAmount(),
                        mineAssets(),
                        baseServices(),
                        otherServices(),
                        gh(15),
                      ],
                    ),
                  ))
                ],
              );
            },
          )),
    );
  }

  Widget mineTop() {
    return Container(
      width: 375.w,
      child: Column(
        children: [
          SizedBox(
            width: 375.w - 15.w * 2,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60.w / 2),
                  child: Container(
                    width: 60.w,
                    height: 60.h,
                    color: Colors.white,
                    child: Image.asset(
                      assetsName('mine/avatar'),
                      width: 56.w,
                      height: 56.h,
                      fit: BoxFit.none,
                    ),
                  ),
                ),
                gw(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // customText("张三", 22, Colors.white),
                        customText("${controller.homeData?.u_Name ?? '张三'}", 22, Colors.white),

                        gw(10),
                        Container(
                          height: 20.h,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 15.h,
                                  margin: EdgeInsets.only(left: 10.w),
                                  padding: EdgeInsets.only(left: 15.w, right: 5.w),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFC85B),
                                    borderRadius: BorderRadius.circular(15.w / 2),
                                  ),
                                  child: customText("运营中心", 10, Colors.white),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 20.w,
                                  height: 20.h,
                                  child: SvgPicture.asset(assetsSvgName("level")),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    CustomButton(
                      onPressed: () {
                        Clipboard.setData(const ClipboardData(text: "12345678"));
                      },
                      child: Row(
                        children: [
                          customText("推荐码：12345678", 12, Colors.white),
                          gw(5),
                          const Icon(FoIcon.COPYANDPASTE, size: 12, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // 待入账金额
  Widget topAmount() {
    return Container(
      width: 345.w,
      height: 90.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetsName('mine/amount_bg')),
          fit: BoxFit.contain,
        ),
      ),
      child: Row(
        children: [
          Expanded(
              child: centerColumn([
            customText('待入账金额(元)', 12, AppColor.greyText),
            customText('943.60', 24, AppColor.blackText, isBold: true),
          ])),
          Expanded(
              child: centerColumn([
            customText('可提现金额(元)', 12, AppColor.greyText),
            customText('4258.09', 24, AppColor.blackText, isBold: true),
          ]))
        ],
      ),
    );
  }

  // 我的资产

  Widget mineAssets() {
    return Container(
      width: 345.w,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.w),
          bottomRight: Radius.circular(8.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText('我的总资产(元)', 12, AppColor.blackText),
              CustomButton(
                onPressed: () {},
                child: Row(
                  children: [
                    customText('我的钱包', 12, AppColor.greyText),
                    gw(2),
                    const Icon(
                      FoIcon.ARROW_RIGHT,
                      size: 12,
                      color: AppColor.hintColor,
                    ),
                  ],
                ),
              )
            ],
          ),
          customText('5201.69', 24, AppColor.blueText, isBold: true),
          gh(15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText('累计收益(元)', 12, AppColor.greyText),
                    customText('53943.60', 16, AppColor.blackText),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText('本月收益(元)', 12, AppColor.greyText),
                    customText('53943.60', 16, AppColor.blackText),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText('今日收益(元)', 12, AppColor.greyText),
                    customText('53943.60', 16, AppColor.blackText),
                  ],
                ),
              )
            ],
          ),
          gh(15),
          SubmitButton(
            title: '收益明细',
            color: AppColor.blueColor1,
            onPressed: () {
              ToastUtils().showToast(
                message: "Hello, this is a custom toast!",
              );
            },
          ),
        ],
      ),
    );
  }

  // 基础服务
  Widget baseServices() {
    return Container(
      width: 345.w,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 345.w,
            height: 45.h,
            child: customText('基础服务', 16, AppColor.blackText, isBold: true),
          ),
          Container(
            width: 345.w,
            padding: EdgeInsetsDirectional.all(10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(controller.baseServiceData.length ?? 0, (index) {
                Map baseServiceItem = controller.baseServiceData[index] ?? {};
                return CustomButton(
                  onPressed: () {},
                  child: Container(
                    width: 157.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(assetsName("mine/base_service_${index + 1}")), fit: BoxFit.fitWidth),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.w, left: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(baseServiceItem['title'], 14, AppColor.blackText, isBold: true),
                              gh(5),
                              customText(
                                  baseServiceItem['subtitle'],
                                  12,
                                  index == 0
                                      ? AppColor.brownText
                                      : (index == 1 || index == 2)
                                          ? AppColor.blueText1
                                          : AppColor.pinkText1),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            assetsName("mine/${baseServiceItem['iconUrl']}"),
                            width: 40.w,
                            height: 40.h,
                            fit: BoxFit.fitWidth,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  // 其他服务
  Widget otherServices() {
    return Container(
      width: 345.w,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 345.w,
            height: 45.h,
            child: customText('其他服务', 16, AppColor.blackText, isBold: true),
          ),
          Container(
            width: 345.w,
            padding: EdgeInsetsDirectional.all(10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Wrap(
              spacing: 41.w,
              runSpacing: 15.h,
              children: List.generate(8, (index) {
                return Container(
                  child: centerColumn(
                    [
                      SvgPicture.asset(
                        assetsSvgName('mine/other_service'),
                        width: 36.w,
                        height: 36.h,
                      ),
                      gh(10),
                      customText('分润等级', 12, AppColor.blackText)
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
