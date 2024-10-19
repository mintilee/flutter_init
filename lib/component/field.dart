import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Fields extends StatefulWidget {
  // @DocsProp("controller", "TextEditingController", "控制器")
  final TextEditingController? controller;
  // @DocsProp("value", "String", "当前值")
  final String? value;
  // 自动聚焦
  final bool? autoFocus;
  // @DocsProp("focusNode", "FocusNode", "聚焦对象")
  final FocusNode? focusNode;
  // @DocsProp("onFocus", "Function()", "聚焦时回调")
  final Function()? onFocus;
  // @DocsProp("onBlur", "Function()", "失去焦点回调")
  final Function()? onBlur;
  // 输入框左侧文本
  final String? label;
  // label文字
  final TextStyle? labelStyle;
  // label 宽度
  final double? labelWidth;
  // 输入框类型
  final TextInputType type;
  // 大小 可选large
  final String? size;
  //输入的最大字符数
  final int? maxLength;
  // 输入框占位提示文字
  final String? placeholder;
  // 是否显示那边框
  final bool? border;
  // 是否禁用输入框
  final bool? disabledInput;
  // 是否在label后面添加冒号
  final bool? colon;
  // 是否显示表单必填星号
  final bool? required;
  // 是否使内容垂直居中
  final TextAlign? center;
  // 是否启用清除图标
  final bool? clearable;
  // 清除图标
  final Widget? clearIcon;
  // 是否显示字数统计
  final bool? showWordLimit;
  // 自适应高度
  final bool? autoSize;
  // 显示几行
  final int? maxLines;
  // 左侧图标
  final Widget? leftIcon;
  // 右侧图标
  final Widget? rightIcon;
  // 当前变化时触发的事件
  final Function(String val)? onChange;
  // input 可视区高度
  final double? height;
  // password显示还是隐藏
  final bool? passwordHidden;

  const Fields({
    Key? key,
    this.value,
    this.label,
    this.labelStyle,
    this.labelWidth = 80,
    this.height = 54,
    required this.type,
    this.size,
    this.maxLength = 50,
    this.placeholder,
    this.border,
    this.disabledInput,
    this.colon = false,
    this.required,
    this.center = TextAlign.start,
    this.clearable = false,
    this.clearIcon,
    this.showWordLimit = false,
    this.autoSize = false,
    this.maxLines = 2,
    this.leftIcon,
    this.rightIcon,
    this.onChange,
    this.controller,
    this.autoFocus = false,
    this.onFocus,
    this.onBlur,
    this.focusNode,
    this.passwordHidden = false,
  }) : super(key: key);

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  late FocusNode focusNode;
  final focusNodeFocus = ValueNotifier(false);

  late TextEditingController _controller;
  late bool clearableStatus = false;
  focus() {
    focusNode.requestFocus();
  }

  blur() {
    focusNode.unfocus();
  }

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();
    _controller.text = widget.value ?? _controller.text;
    focusNode.addListener(() {
      focusNodeFocus.value = focusNode.hasPrimaryFocus;
    });

    focusNodeFocus.addListener(() {
      if (focusNodeFocus.value) {
        print({"debug==============> 121"});
        setState(() {
          clearableStatus = widget.clearable ?? false;
        });
        widget.onFocus?.call();
      } else {
        print({"debug==========> 124"});
        setState(() {
          clearableStatus = false;
        });
        widget.onBlur?.call();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) focusNode.dispose();
    if (widget.controller == null) _controller.dispose();
    focusNodeFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.autoSize! ? null : widget.height?.h,
      child: Row(
        children: [
          if (widget.leftIcon != null) widget.leftIcon!,
          if (widget.label != null)
            Container(
              width: widget.labelWidth,
              height: widget.autoSize! ? widget.height?.h : null,
              alignment: widget.autoSize! ? Alignment.topLeft : Alignment.centerLeft,
              child: Text.rich(
                textAlign: TextAlign.left,
                TextSpan(
                  children: [
                    if (widget.colon!)
                      TextSpan(
                        text: "*",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.h,
                        ),
                      ),
                    TextSpan(
                      text: "${widget.label}",
                      style: widget.labelStyle ??
                          TextStyle(
                            fontSize: 15.h,
                            color: Colors.black,
                          ),
                    )
                  ],
                ),
              ),
            ),
          Expanded(
            flex: 1,
            child: TextField(
              controller: _controller,
              focusNode: focusNode,
              textAlign: widget.center ?? TextAlign.start,
              keyboardType: widget.type,
              decoration: InputDecoration(
                  border: widget.border ?? false ? const OutlineInputBorder() : InputBorder.none,
                  hintText: widget.placeholder,
                  counterText: widget.showWordLimit ?? true ? "${_controller.text.length} / ${widget.maxLength}" : "",
                  hintStyle: TextStyle(
                    fontSize: 15.sp,
                    height: 1.3,
                  )),
              readOnly: widget.disabledInput ?? false,
              maxLength: widget.maxLength,
              maxLines: widget.autoSize ?? true ? widget.maxLines : 1,
              minLines: widget.autoSize ?? true ? widget.maxLines! : 1,
              textInputAction: TextInputAction.done,
              obscureText: widget.passwordHidden ?? false,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
              ),
              onChanged: (val) {
                widget.onChange!(val);
              },
              onSubmitted: (val) {
                widget.onChange!(val);
              },
            ),
          ),
          if (widget.clearable! && clearableStatus)
            RawMaterialButton(
              constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: _controller.clear,
              child: const Icon(
                Icons.clear,
                color: Colors.red,
                size: 20,
              ),
            ),
          if (widget.rightIcon != null) widget.rightIcon!
        ],
      ),
    );
  }
}
