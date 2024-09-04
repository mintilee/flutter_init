import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:offline/component/button.dart';
import 'package:offline/component/fo-icon.dart';
import 'package:offline/component/nabbar.dart';
import 'package:offline/component/text.dart';
import 'package:offline/res/theme.dart';
import 'package:offline/ui/pages/datas/datas_controller.dart';
import 'package:offline/ui/widgets/layout.dart';

class DatasScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DatasController>(DatasController());
  }
}

class DatasScreen extends StatefulWidget {
  const DatasScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DatasScreenState();
}

class _DatasScreenState extends State<DatasScreen> with AutomaticKeepAliveClientMixin {
  DatasController ctrl = DatasController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: AppColor.bodyBG,
        appBar: AppBar(
          centerTitle: false,
          title: Row(
            children: [
              customText('数据看板', 18, AppColor.blackColor1, isBold: true),
              gw(5),
              const Icon(
                FoIcon.QUESTION,
                color: AppColor.greyText,
                size: 24,
              ),
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  assetsName('datas/datas_bg'),
                ),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          actions: [
            CustomButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColor.whiteColor1, width: 1.w),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Row(
                  children: [
                    customText('全部品牌', 12, AppColor.blackText3),
                    gw(5),
                    const Icon(
                      FoIcon.ARROW_DOWN,
                      size: 10,
                      color: AppColor.blackColor1,
                    )
                  ],
                ),
              ),
            ),
            gw(15),
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
                    height: 190.h - (Scaffold.of(context).appBarMaxHeight ?? 0),
                    child: Column(
                      children: [
                        Image.asset(
                          assetsName("datas/datas_bg"),
                          width: 375.w,
                          height: 190.h - (Scaffold.of(context).appBarMaxHeight ?? 0),
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
                      topIncome(),
                      gh(15),
                      transactionData(),
                      gh(15),
                      terminalData(),
                      gh(15),
                      partnerData(),
                      Container(
                        alignment: Alignment.center,
                        width: 375.w,
                        height: 40.h,
                        child: customText('- 让展业更轻松更省心 -', 12, AppColor.greyText2),
                      )
                    ],
                  ),
                ))
              ],
            );
          },
        ),
      ),
    );
  }

  // 累计收益
  Widget topIncome() {
    return Container(
      width: 345.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  gw(5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText('累计收益(元)', 14, AppColor.blackText),
                      customText("3289654.83", 24, AppColor.blueText, isBold: true),
                    ],
                  ),
                ],
              ),
              Image.asset(assetsName('datas/income'), width: 90.w, height: 90.h, fit: BoxFit.fill),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [gw(5), customText('本月收益(元)', 12, AppColor.greyText), gw(5), customText("1200.00", 12, AppColor.blackText)],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  border: Border.all(color: AppColor.theme),
                ),
                child: customText('查看明细', 12, AppColor.blueText),
              )
            ],
          ),
          gh(20),
        ],
      ),
    );
  }

  // 交易数据
  Widget transactionData() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.w),
      child: Container(
        width: 345.w,
        child: Column(
          children: [
            Container(
              width: 345.w,
              height: 45.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppColor.blueColor2,
                AppColor.whiteColor2,
              ])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(assetsSvgName('datas/toggle')),
                      gw(10),
                      customText('交易数据', 16, AppColor.blackText, isBold: true),
                    ],
                  ),
                  CustomButton(
                    onPressed: () {},
                    child: Container(
                      height: 45.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          customText('查看更多', 14, AppColor.greyText),
                          gw(5),
                          const Icon(
                            FoIcon.ARROW_RIGHT,
                            size: 14,
                            color: AppColor.greyText,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 345.w,
              height: 150.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 60.h,
                    padding: EdgeInsets.only(left: 17.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(assetsSvgName('datas/trade')),
                            gw(5),
                            customText('团队交易额汇总', 10, AppColor.greyText),
                          ],
                        ),
                        gh(6),
                        Text.rich(
                            style: TextStyle(color: AppColor.blackText, fontSize: 16.sp, fontWeight: FontWeight.bold),
                            TextSpan(children: [
                              TextSpan(text: "3289654.83"),
                              TextSpan(text: "元", style: TextStyle(fontSize: 10.sp)),
                            ]))
                      ],
                    ),
                  ),
                  Container(
                    width: 315.w,
                    height: 60.h,
                    padding: EdgeInsets.symmetric(horizontal: 17.w),
                    decoration: BoxDecoration(
                      color: AppColor.greyColor1,
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 140.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText('个人交易额', 10, AppColor.greyText),
                              Text.rich(
                                  style: TextStyle(color: AppColor.blackText, fontSize: 16.sp, fontWeight: FontWeight.bold),
                                  TextSpan(children: [
                                    const TextSpan(text: "108149.57"),
                                    TextSpan(text: "元", style: TextStyle(fontSize: 10.sp)),
                                  ]))
                            ],
                          ),
                        ),
                        Container(
                          width: 1.w,
                          height: 20.h,
                          color: AppColor.whiteColor1,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 17.w),
                          width: 140.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText('下游团队交易额', 10, AppColor.greyText),
                              Text.rich(
                                  style: TextStyle(color: AppColor.blackText, fontSize: 16.sp, fontWeight: FontWeight.bold),
                                  TextSpan(children: [
                                    const TextSpan(text: "645233.58"),
                                    TextSpan(text: "元", style: TextStyle(fontSize: 10.sp)),
                                  ]))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // 终端数据
  Widget terminalData() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.w),
      child: Container(
        width: 345.w,
        child: Column(
          children: [
            Container(
              width: 345.w,
              height: 45.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppColor.orangeColor1,
                AppColor.whiteColor2,
              ])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(assetsSvgName('datas/terminal')),
                      gw(10),
                      customText('终端数据', 16, AppColor.blackText, isBold: true),
                    ],
                  ),
                  CustomButton(
                    onPressed: () {},
                    child: Container(
                      height: 45.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          customText('查看更多', 14, AppColor.greyText),
                          gw(5),
                          const Icon(
                            FoIcon.ARROW_RIGHT,
                            size: 14,
                            color: AppColor.greyText,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 345.w,
              height: 195.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              color: Colors.white,
              child: Column(
                children: [
                  gh(10),
                  Container(
                    width: 308.w,
                    height: 30.h,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: AppColor.greyColor1,
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: List.generate(ctrl.terminalData.length, (index) {
                        Map terminalItem = ctrl.terminalData[index] ?? {};
                        return GetBuilder<DatasController>(
                          builder: (controller) {
                            return Flexible(
                                child: CustomButton(
                              onPressed: () {
                                ctrl.terminalCurrent.value = index;
                              },
                              child: GetX<DatasController>(
                                builder: (_) {
                                  bool flag = ctrl.terminalCurrent.value == index ? true : false;
                                  return Container(
                                    width: 100.w,
                                    height: 26.h,
                                    margin: EdgeInsets.only(left: index != 0 ? 2 : 0),
                                    decoration: flag
                                        ? BoxDecoration(
                                            borderRadius: BorderRadius.circular(4.w),
                                            color: Colors.white,
                                          )
                                        : null,
                                    child: Center(
                                      child: customText(
                                          index == 0
                                              ? "全部"
                                              : index == 1
                                                  ? "自营"
                                                  : "下游团队",
                                          12,
                                          AppColor.blackText,
                                          isBold: true),
                                    ),
                                  );
                                },
                              ),
                            ));
                          },
                        );
                      }),
                    ),
                  ),
                  gh(10),
                  // 数据
                  GetX<DatasController>(
                    builder: (controller) {
                      Map data = ctrl.terminalData[ctrl.terminalCurrent.value] ?? {};
                      return Container(
                        width: 315.w,
                        child: Column(
                          children: [
                            Row(
                              children: List.generate(2, (index) {
                                return Container(
                                  width: 315.w / 2 - 1,
                                  height: 60.h,
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [SvgPicture.asset(assetsSvgName("datas/${index == 0 ? 'phone' : 'merchants'}")), gw(5), customText(index == 0 ? "总机具数" : "总商户数", 10, AppColor.greyText)],
                                      ),
                                      gh(5),
                                      Text.rich(
                                          style: TextStyle(fontSize: 16.sp, color: AppColor.blackText),
                                          TextSpan(children: [
                                            TextSpan(text: "${index == 0 ? data['terTotal'] : data['merTota']}"),
                                            TextSpan(text: index == 0 ? "台" : "户", style: TextStyle(fontSize: 10.sp)),
                                          ]))
                                    ],
                                  ),
                                );
                              }),
                            ),
                            gh(10),
                            Container(
                              width: 315.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: AppColor.greyColor1,
                                borderRadius: BorderRadius.circular(8.w),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Flex(
                                  direction: Axis.horizontal,
                                  children: List.generate(3, (index) {
                                    return Row(
                                      children: [
                                        Container(
                                          width: 104.w,
                                          padding: EdgeInsets.only(left: 15.w),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              customText(
                                                  index == 0
                                                      ? "已绑定机具"
                                                      : index == 1
                                                          ? "已激活机具"
                                                          : "已达标机具",
                                                  10,
                                                  AppColor.greyText),
                                              Text.rich(
                                                  style: TextStyle(fontSize: 16.sp, color: AppColor.blackText),
                                                  TextSpan(children: [
                                                    TextSpan(
                                                        text: "${index == 0 ? data['isBinding'] : index == 1 ? data['isActivate'] : data['isAchieved']}"),
                                                    TextSpan(text: "台", style: TextStyle(fontSize: 10.sp)),
                                                  ]))
                                            ],
                                          ),
                                        ),
                                        if (index != 2) Container(width: 1.w, height: 20.h, color: AppColor.whiteColor1)
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // 伙伴数据
  Widget partnerData() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.w),
      child: Container(
        width: 345.w,
        child: Column(
          children: [
            Container(
              width: 345.w,
              height: 45.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppColor.cyanColor1,
                AppColor.whiteColor2,
              ])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(assetsSvgName('datas/partner')),
                      gw(10),
                      customText('伙伴数据', 16, AppColor.blackText, isBold: true),
                    ],
                  ),
                  CustomButton(
                    onPressed: () {},
                    child: Container(
                      height: 45.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          customText('查看更多', 14, AppColor.greyText),
                          gw(5),
                          const Icon(
                            FoIcon.ARROW_RIGHT,
                            size: 14,
                            color: AppColor.greyText,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 345.w,
              height: 210.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 60.h,
                    padding: EdgeInsets.only(left: 17.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(assetsSvgName('datas/team')),
                            gw(5),
                            customText('团队伙伴汇总', 10, AppColor.greyText),
                          ],
                        ),
                        gh(6),
                        Text.rich(
                            style: TextStyle(color: AppColor.blackText, fontSize: 16.sp, fontWeight: FontWeight.bold),
                            TextSpan(children: [
                              TextSpan(text: "375"),
                              TextSpan(text: "人", style: TextStyle(fontSize: 10.sp)),
                            ]))
                      ],
                    ),
                  ),
                  Container(
                    width: 315.w,
                    height: 115.h,
                    decoration: BoxDecoration(
                      color: AppColor.greyColor1,
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Column(
                        children: [
                          Container(
                            width: 315.w,
                            height: 40.h,
                            child: Flex(
                              direction: Axis.horizontal,
                              children: List.generate(2, (index) {
                                return Row(
                                  children: [
                                    Container(
                                      width: 315.w / 2 - 1,
                                      padding: EdgeInsets.only(left: 15.w),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          customText(index == 0 ? "直属伙伴人数" : "下游团队伙伴人数", 10, AppColor.greyText),
                                          Text.rich(
                                              style: TextStyle(color: AppColor.blackText, fontSize: 16.sp, fontWeight: FontWeight.bold),
                                              TextSpan(children: [
                                                TextSpan(text: "375"),
                                                TextSpan(text: "人", style: TextStyle(fontSize: 10.sp)),
                                              ]))
                                        ],
                                      ),
                                    ),
                                    if (index == 0) Container(width: 1.w, height: 20.h, color: AppColor.whiteColor1),
                                  ],
                                );
                              }),
                            ),
                          ),
                          gh(15),
                          Container(
                            width: 315.w,
                            height: 40.h,
                            child: Flex(
                              direction: Axis.horizontal,
                              children: List.generate(3, (index) {
                                return Row(
                                  children: [
                                    Container(
                                      width: 315.w / 3 - 1,
                                      padding: EdgeInsets.only(left: 15.w),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          customText(
                                              index == 0
                                                  ? "本月直属新增"
                                                  : index == 1
                                                      ? "本月团队新增"
                                                      : "本月新增汇总",
                                              10,
                                              AppColor.greyText),
                                          Text.rich(
                                              style: TextStyle(color: AppColor.blackText, fontSize: 16.sp, fontWeight: FontWeight.bold),
                                              TextSpan(children: [
                                                TextSpan(text: "375"),
                                                TextSpan(text: "人", style: TextStyle(fontSize: 10.sp)),
                                              ]))
                                        ],
                                      ),
                                    ),
                                    if (index != 2) Container(width: 1.w, height: 20.h, color: AppColor.whiteColor1),
                                  ],
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  // Container(
                  //   width: 315.w,
                  //   height: 60.h,
                  //   padding: EdgeInsets.symmetric(horizontal: 17.w),
                  //   decoration: BoxDecoration(
                  //     color: AppColor.greyColor1,
                  //     borderRadius: BorderRadius.circular(8.w),
                  //   ),
                  //   child: Flex(
                  //     direction: Axis.horizontal,
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SizedBox(
                  //         width: 140.w,
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             customText('个人交易额', 10, AppColor.greyText),
                  //             Text.rich(
                  //                 style: TextStyle(color: AppColor.blackText, fontSize: 16.sp, fontWeight: FontWeight.bold),
                  //                 TextSpan(children: [
                  //                   const TextSpan(text: "108149.57"),
                  //                   TextSpan(text: "元", style: TextStyle(fontSize: 10.sp)),
                  //                 ]))
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         width: 1.w,
                  //         height: 20.h,
                  //         color: AppColor.whiteColor1,
                  //       ),
                  //       Container(
                  //         padding: EdgeInsets.only(left: 17.w),
                  //         width: 140.w,
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             customText('下游团队交易额', 10, AppColor.greyText),
                  //             Text.rich(
                  //                 style: TextStyle(color: AppColor.blackText, fontSize: 16.sp, fontWeight: FontWeight.bold),
                  //                 TextSpan(children: [
                  //                   const TextSpan(text: "645233.58"),
                  //                   TextSpan(text: "元", style: TextStyle(fontSize: 10.sp)),
                  //                 ]))
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
