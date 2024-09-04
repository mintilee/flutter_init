import 'dart:async';

import 'package:flutter/material.dart';

class NoticeBar extends StatefulWidget {
  // 文本颜色
  final Color color;
  // 滚动条背景
  final Color background;
  // 通知文本内容
  final String text;
  // 左侧图标

  final Widget? leftIcon;

  // 通知栏模式，可选值为 closeable、link
  final String? mode;
  // 是否在长度溢出时滚动播放
  final bool scrollable;
  // 是否开启文本换行，只在禁用滚动时生效
  final bool wrapable;
  // 关闭通知栏时触发
  final Function()? onClose;
  // 点击通知栏时触发
  final Function()? onClick;
  // 滚动速率
  final int speed;
  // 动画延迟时间 (s)
  final int delay;

  const NoticeBar({
    Key? key,
    required this.text,
    this.color = Colors.amber,
    this.background = Colors.white,
    this.leftIcon,
    this.mode,
    this.scrollable = true,
    this.wrapable = false,
    this.speed = 5,
    this.delay = 100,
    this.onClose,
    this.onClick,
  }) : super(key: key);

  @override
  _NoticeBar createState() => _NoticeBar();
}

class _NoticeBar extends State<NoticeBar> {
  ScrollController? scrollController;
  late double screenWidth;
  double? screenHeight;
  double position = 0.0;
  Timer? _timer;
  final GlobalKey _key = GlobalKey();
  bool showNotice = true;

  @override
  void initState() {
    scrollController = ScrollController();
    if (widget.scrollable) WidgetsBinding.instance.addPostFrameCallback(_onLayoutDone);
    super.initState();
  }

  _onLayoutDone(_) {
    RenderBox notice = _key.currentContext!.findRenderObject() as RenderBox;
    double widgetWidth = notice.size.width;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    _timer = Timer.periodic(Duration(milliseconds: widget.delay), (timer) {
      double maxScrollExtent = scrollController!.position.maxScrollExtent;
      double pixels = scrollController!.position.pixels;
      if (pixels + widget.speed >= maxScrollExtent) {
        position = (maxScrollExtent - (screenWidth * 0.5) + widgetWidth) / 2 - widgetWidth + pixels - maxScrollExtent;
        scrollController!.jumpTo(position);
      }
      position += widget.speed;
      scrollController!.animateTo(position, duration: Duration(milliseconds: widget.delay), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    if (_timer != null) _timer!.cancel();
    super.dispose();
  }

  Widget buildText() {
    return Expanded(
      child: widget.scrollable
          ? ListView(
              key: _key,
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(fontSize: 14, color: widget.color),
                    maxLines: widget.wrapable && !widget.scrollable ? null : 1,
                  ),
                ),
                Container(width: screenWidth * 0.5),
                Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(fontSize: 14, color: widget.color),
                    maxLines: widget.wrapable && !widget.scrollable ? null : 1,
                  ),
                )
              ],
            )
          : Text(
              widget.text,
              style: TextStyle(fontSize: 14, color: widget.color),
              maxLines: widget.wrapable ? null : 1,
            ),
    );
  }

  List<Widget> buildCloseButon() {
    return [
      (widget.mode == "closeable" || widget.mode == "link") ? const SizedBox(width: 16) : Container(),
      (widget.mode == "closeable" || widget.mode == "link")
          ? GestureDetector(
              child: Icon(widget.mode == "closeable" ? Icons.cancel : Icons.chevron_right, color: widget.color, size: 16),
              onTap: () {
                //TODO:增加动画效果
                if (widget.mode == "closeable" && widget.onClose != null) {
                  setState(() {
                    showNotice = false;
                  });
                  widget.onClose!();
                }
                if (widget.mode == "link" && widget.onClick != null) {
                  widget.onClick!();
                }
              },
            )
          : Container()
    ];
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Visibility(
      visible: showNotice,
      child: Container(
        height: widget.wrapable ? null : 40,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: widget.background,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            widget.leftIcon != null ? widget.leftIcon! : Container(),
            SizedBox(width: widget.leftIcon != null ? 16 : 0),
            buildText(),
            ...buildCloseButon(),
          ],
        ),
      ),
    );
  }
}
