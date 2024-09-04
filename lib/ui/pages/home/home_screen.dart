import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:offline/component/button.dart';
import 'package:offline/component/fo-icon.dart';
import 'package:offline/component/noticeBar.dart';
import 'package:offline/component/swiper.dart';
import 'package:offline/component/text.dart';
import 'package:offline/res/theme.dart';
import 'package:offline/ui/pages/home/home_controller.dart';
import 'package:offline/ui/pages/home/home_models.dart';
import 'package:offline/ui/widgets/layout.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  HomeController ctrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          body: EasyRefresh.builder(
        onRefresh: () {},
        childBuilder: (context, physics) {
          return SingleChildScrollView(
              physics: physics,
              child: Column(
                children: [
                  homeTop(),
                  gh(15),
                  topBanner(),
                  gh(15),
                  middleMenus(),
                  gh(15),
                  dataAggregation(),
                  SizedBox(
                    width: 375.w,
                    height: 60.h,
                    child: centerColumn([
                      customText('项目名称', 16, AppColor.greyText2, isBold: true),
                      gh(5),
                      customText('- 让展业更轻松更省心 -', 12, AppColor.greyText2),
                    ]),
                  ),
                ],
              ));
        },
      )),
    );
  }

  // 首页头部
  Widget homeTop() {
    return Container(
      width: 375.w,
      // height: 225.h,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(assetsName('home/home_bg')), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          gh(statuBarsHeight(context)),
          SizedBox(
            width: 375.w - 15.w * 2,
            height: statuBarsHeight(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  style: TextStyle(fontSize: 18.w, color: Colors.white),
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Hello,',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: customText("欢迎您使用展业通用版", 12, Colors.white),
                      )
                    ],
                  ),
                ),
                const Icon(FoIcon.BELL, color: Colors.white),
              ],
            ),
          ),
          SizedBox(
            width: 375.w - 15.w * 2,
            height: 90.h,
            child: GetBuilder<HomeController>(
              builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(ctrl.homeModel.value!.topMenu.length, (index) {
                    TopMenuModel topMenuItem = ctrl.homeModel.value!.topMenu[index];
                    return Container(
                      width: 60.w,
                      child: CustomButton(
                        onPressed: () {},
                        child: centerColumn([
                          SvgPicture.asset(assetsSvgName("home/${topMenuItem.icon!}")),
                          gh(8),
                          customText(topMenuItem.title, 13, Colors.white),
                        ]),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
          noticeView(),
        ],
      ),
    );
  }

  // notice 广播
  Widget noticeView() {
    return Container(
      width: 375.w,
      // height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.w),
          topRight: Radius.circular(16.w),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        margin: EdgeInsets.only(top: 15.h),
        child: NoticeBar(
          mode: "link",
          background: AppColor.theme.withOpacity(0.1),
          leftIcon: Icon(
            FoIcon.BULLETIN,
            color: AppColor.blueColor1,
            size: 16.w,
          ),
          text: '热烈祝贺张**复购50台机具，项目平台正式...',
          color: AppColor.blackText,
          onClick: () {},
        ),
      ),
    );
  }

  // topBanner
  Widget topBanner() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.w),
        child: SwiperBanner(
          width: 375 - 15 * 2,
          height: 115,
          bannerTap: (data) {
            print({"debug========168": data});
          },
          list: [
            {"src": "https://img.js.design/assets/img/65eebe8dd4c8c0c3d71cc8a2.png"}
          ],
        ));
  }

  // 自定义菜单
  Widget middleMenus() {
    return Container(
      width: 345.w,
      height: 174.h,
      padding: EdgeInsets.symmetric(vertical: 15.w),
      child: PageView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: List.generate(10, (index) {
              return SizedBox(
                width: 60.w,
                child: centerColumn([
                  SvgPicture.asset(assetsSvgName('home/menu')),
                  gh(8),
                  customText('测试', 14, AppColor.themeText),
                ]),
              );
            }),
          );
        },
      ),
    );
  }

  // 数据汇总
  Widget dataAggregation() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.w),
      child: Container(
        padding: const EdgeInsets.all(1),
        width: 345.w,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: AppColor.theme.withOpacity(.1),
            offset: const Offset(0, 95),
            blurRadius: 45,
          )
        ]),
        child: Column(
          children: [
            Container(
              width: 345.w,
              height: 45.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  tileMode: TileMode.clamp,
                  colors: [AppColor.theme.withOpacity(.05), Colors.transparent],
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: UnconstrainedBox(
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColor.subtheme,
                              AppColor.subtheme.withOpacity(.6),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.w),
                          ),
                        ),
                        child: Row(
                          children: [
                            customText('本月数据', 12, Colors.white),
                            gw(5),
                            const Icon(
                              FoIcon.ARROW_DOWN,
                              color: Colors.white,
                              size: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      gw(10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: customText('数据统计', 16, AppColor.blackText, isBold: true),
                      ),
                      gw(5),
                      const Icon(FoIcon.QUESTION),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 345.w,
              height: 145.h,
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(assetsName('home/data_bg')), fit: BoxFit.fill),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText('团队总交易金额(元)', 12, AppColor.greyText),
                            gh(5),
                            Text.rich(
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.sp),
                                const TextSpan(children: [
                                  TextSpan(
                                    text: "1236.90",
                                  ),
                                  TextSpan(
                                    text: "万",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ]))
                          ],
                        ),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText('团队总交易数(笔)', 12, AppColor.greyText),
                          gh(5),
                          customText('2645', 21, AppColor.blackText, isBold: true),
                        ],
                      )),
                    ],
                  ),
                  Row(
                    children: List.generate(4, (index) {
                      return Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText('新增商户', 12, AppColor.greyText),
                          gh(5),
                          Text.rich(
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.sp),
                              const TextSpan(children: [
                                TextSpan(
                                  text: "120",
                                ),
                                TextSpan(
                                  text: "户",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ]))
                        ],
                      ));
                    }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
