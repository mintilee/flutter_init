import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offline/component/fo-icon.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? action;
  final double elevation = 0;
  final Color? color;
  final Color shadowColor = Colors.transparent;
  final TextStyle? titleStyle;
  final Widget? flexibleSpace;
  final bool blueBackground = false;
  final Widget? titleWidget;
  final SystemUiOverlayStyle systemOverlayStyle = SystemUiOverlayStyle.dark;
  final Function()? backPressed;
  final bool white = false;
  final bool centerTitle = true;
  final bool needBack = true;
  final double? leadingWidth;
  final Color? linearStartColor;
  final Color? linearEndColor;

  Navbar({
    Key? key,
    required this.title,
    this.color,
    this.leading,
    this.action,
    this.titleStyle,
    this.flexibleSpace,
    this.titleWidget,
    this.backPressed,
    this.leadingWidth,
    this.linearStartColor,
    this.linearEndColor,
  }) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: widget.centerTitle,
      elevation: widget.elevation,
      systemOverlayStyle: widget.white ? SystemUiOverlayStyle.light : const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
      shadowColor: widget.shadowColor,
      backgroundColor: widget.color ?? Colors.white,
      flexibleSpace: widget.flexibleSpace == null && widget.blueBackground
          ? Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                widget.linearStartColor ?? const Color(0xFF6796F5),
                widget.linearEndColor ?? const Color.fromARGB(255, 127, 127, 127),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            )
          : widget.flexibleSpace,
      title: widget.titleWidget ??
          Text(
            widget.title,
            style: widget.titleStyle ?? const TextStyle(fontSize: 21, color: Colors.black, fontWeight: FontWeight.w700),
          ),
      leadingWidth: widget.leadingWidth,
      leading: widget.leading ?? (widget.needBack ? defaultBackButton(context, backPressed: widget.backPressed, white: widget.white) : null),
      actions: widget.action,
    );
  }

  Widget defaultBackButton(
    BuildContext context, {
    Color? color,
    Function()? backPressed,
    double? width,
    bool white = false,
    bool close = false,
  }) {
    return RawMaterialButton(
      onPressed: () {
        if (backPressed != null) {
          backPressed();
        } else {
          Navigator.pop(context);
        }
      },
      child: defaultBackButtonView(color: color, white: white, close: close, width: width),
    );
  }

  Widget defaultBackButtonView({
    Color? color,
    double? width,
    bool white = false,
    bool close = false,
  }) {
    return SizedBox(
      width: width ?? (16 + 16).w,
      height: kToolbarHeight,
      child: Align(
          alignment: Alignment(close ? 1 : -0.3, 0.1),
          child: close
              ? const Icon(FoIcon.CLOSE, size: 20)
              : Icon(
                  FoIcon.ARROW_LEFT_BACK,
                  size: 20,
                  color: white ? Colors.white : Colors.black,
                )),
    );
  }
}
