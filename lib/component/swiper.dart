import 'package:card_swiper/card_swiper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperBanner extends StatefulWidget {
  final List list; // 数据
  final double? width; // 宽度
  final double? height; // 高度
  final double? radius; // 圆角
  final bool? loop; // 是否循环
  final bool? autoplay; // 自动播放
  final Function(Map data)? bannerTap; // 点击事件
  final int? indicatorWidth; // 指示器宽度
  final int? indicatorHeight; // 指示器高度
  final double? scale; // 缩放
  //

  final double? viewportFraction;

  const SwiperBanner({
    Key? key,
    required this.list,
    this.width = 375,
    this.height = 130,
    this.radius = 10,
    this.loop = false,
    this.autoplay = false,
    this.bannerTap,
    this.indicatorWidth = 100,
    this.indicatorHeight = 20,
    this.scale = 1,
    this.viewportFraction = 1,
  }) : super(key: key);

  @override
  State<SwiperBanner> createState() => _SwiperBannerState();
}

class _SwiperBannerState extends State<SwiperBanner> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width!.w,
      height: widget.height!.h,
      child: Swiper(
        itemCount: widget.list.length,
        autoplay: true,
        // onTap: widget.bannerTap!(widget.list[index]),
        onTap: (index) => widget.bannerTap!(widget.list[index]),
        itemBuilder: (context, index) {
          final bannerImg = widget.list[index]['src'];
          return Image.network(
            bannerImg,
            width: widget.width,
            height: widget.height,
            fit: BoxFit.fill,
          );
        },
        scale: widget.scale ?? 0.9,
        viewportFraction: widget.viewportFraction ?? 0.84,
      ),
    );
  }
}
