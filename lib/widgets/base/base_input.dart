import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class BaseInput extends StatelessWidget {
  const BaseInput({
    Key? key,
    required this.title,
    this.isRequired = false,
    this.hintText,
    this.helperText,
    this.errorText,
    this.validator,
    this.keyboardType,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
    this.formaters,
    this.textCapitalization = TextCapitalization.words,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.prefix,
    this.suffix,
    this.maxLength,
    this.maxLines = 1,
    this.textStyle,
    this.validMode,
    this.obscureText = false,
  }) : super(key: key);
  final String title;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool isRequired;
  final bool enabled;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final List<TextInputFormatter>? formaters;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final int? maxLines;
  final AutovalidateMode? validMode;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: title,
                  style: AppFonts.bSmall.copyWith(color: context.neutral1100),
                ),
                if (isRequired)
                  TextSpan(
                    text: ' (bắt buộc)',
                    style:
                        AppFonts.bSmall.copyWith(color: context.funcRadicalRed),
                  ),
              ]),
            )),
        sizedBoxH08,
        BaseTextField(
          autofocus: autofocus,
          focusNode: focusNode,
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          validator: validator,
          textCapitalization: textCapitalization,
          enabled: enabled,
          formaters: formaters,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          validMode: validMode,
          obscureText: obscureText,
          prefix: prefix,
          suffix: suffix,
          hintText: hintText,
          textStyle: textStyle ?? AppFonts.pMedium,
          helperText: helperText,
          errorText: errorText,
        ),
      ],
    );
  }
}

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    Key? key,
    this.hintText,
    this.helperText,
    this.errorText,
    this.validator,
    this.keyboardType,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
    this.formaters,
    this.textCapitalization = TextCapitalization.words,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.prefix,
    this.suffix,
    this.maxLength,
    this.maxLines = 1,
    this.textStyle,
    this.validMode,
    this.obscureText = false,
  }) : super(key: key);

  final bool autofocus;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final String? Function(String? p1)? validator;
  final TextCapitalization textCapitalization;
  final bool enabled;
  final List<TextInputFormatter>? formaters;
  final TextInputAction? textInputAction;
  final Function(String p1)? onChanged;
  final Function(String p1)? onSubmitted;
  final AutovalidateMode? validMode;
  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final TextStyle? textStyle;
  final String? helperText;
  final String? errorText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      obscureText: obscureText,
      maxLines: maxLines,
      validator: validator,
      textCapitalization: textCapitalization,
      enabled: enabled,
      inputFormatters: formaters,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      autovalidateMode: validMode,
      style: (textStyle ?? AppFonts.pMedium).copyWith(
        color: enabled ? null : context.neutral600,
      ),
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        contentPadding: padSymHor16Ver12,
        hintText: hintText,
        filled: true,
        fillColor: enabled ? context.neutral100 : context.neutral300,
        labelStyle: (textStyle ?? AppFonts.pMedium).copyWith(height: 1),
        hintStyle: (textStyle ?? AppFonts.pMedium)
            .copyWith(color: context.neutral600, height: 1),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: context.neutral300, width: 2.0),
          borderRadius: borRad08,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.neutral300, width: 2.0),
          borderRadius: borRad08,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.primaryDark, width: 2.0),
          borderRadius: borRad08,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.funcRadicalRed, width: 2.0),
          borderRadius: borRad08,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.funcRadicalRed, width: 2.0),
          borderRadius: borRad08,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.neutral300, width: 2.0),
          borderRadius: borRad08,
        ),
        helperMaxLines: 1,
        counter: const SizedBox(),
        helperText: helperText,
        hintMaxLines: 2,
        helperStyle:
            AppFonts.bSmall.copyWith(color: context.neutral800, height: 1),
        errorText: errorText,
        errorMaxLines: 2,
        errorStyle:
            AppFonts.bSmall.copyWith(color: context.funcRadicalRed, height: 1),
      ),
    );
  }
}

class MoneyInput extends StatefulWidget {
  final String? helperText;
  final String suffixStr;

  final bool enabled;
  final String? Function(String?)? validator;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final List<TextInputFormatter>? formaters;

  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final Widget? prefix;
  final Widget? suffix;
  final TextStyle? textStyle;
  final int? maxLength;
  final int? maxLines;
  final int multiple;
  final String? hintText;

  const MoneyInput(
      {Key? key,
      this.helperText,
      this.validator,
      this.controller,
      this.focusNode,
      this.autofocus = false,
      this.enabled = true,
      this.formaters,
      this.onChanged,
      this.onSubmitted,
      this.textInputAction,
      this.prefix,
      this.suffix,
      this.maxLength,
      this.maxLines = 1,
      this.textStyle,
      this.hintText,
      this.suffixStr = 'VNĐ',
      this.multiple = 1})
      : assert(maxLength == null || maxLength > 0),
        assert(multiple > 0),
        super(key: key);

  @override
  State<MoneyInput> createState() => _MoneyInputState();
}

class _MoneyInputState extends State<MoneyInput> {
  late TextEditingController controller;
  late FocusNode focusNode;
  late String content;
  late double size;
  late bool isFocus = false;
  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(onFocusLis);
    controller.addListener(onChange);
    content = controller.text;
    final contentSize = _textSize(content, widget.textStyle ?? AppFonts.h700);
    size = contentSize;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onFocus(),
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: size,
                child: TextFormField(
                  style: widget.textStyle,
                  keyboardType: TextInputType.number,
                  enabled: widget.enabled,
                  maxLength: widget.maxLength,
                  controller: controller,
                  scrollPadding: EdgeInsets.zero,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  inputFormatters: widget.formaters,
                  onChanged: (val) {
                    widget.onChanged?.call(val);
                  },
                  focusNode: focusNode,
                  autofocus: widget.autofocus,
                  validator: widget.validator,
                  cursorColor: context.neutral100,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    errorMaxLines: 2,
                    isDense: false,
                    filled: true,
                    hintText: widget.hintText,
                    contentPadding: const EdgeInsets.only(top: 3),
                    fillColor: context.transparent,
                    labelStyle: widget.textStyle,
                    hintStyle: (widget.textStyle ?? AppFonts.h700)
                        .copyWith(color: context.neutral100),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    helperText: widget.helperText,
                    helperMaxLines: 2,
                    helperStyle:
                        AppFonts.bSmall.copyWith(color: context.neutral800),
                    errorStyle:
                        AppFonts.bSmall.copyWith(color: context.funcRadicalRed),
                    counter: const SizedBox(),
                  ),
                ),
              ),
              getSuffixIcon(content, context),
            ],
          ),
        ),
      ),
    );
  }

  double _textSize(String str, TextStyle style) {
    var text = str;
    if (text.isEmpty) {
      text = widget.hintText ?? "0";
    }
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.rtl,
    )..layout();
    //1 is cursor width
    final width = textPainter.size.width + 1;
    return width;
  }

  String getSuffixStr(String content) {
    if (content.isEmpty) return '';
    return widget.suffixStr;
  }

  String getMultipleStr(String content) {
    if (content.isEmpty) return '';
    return widget.multiple.toDecimalPattern().substring(1);
  }

  Widget getSuffixIcon(String content, BuildContext context) {
    return Row(
      children: [
        Text(
          getMultipleStr(content),
          style: (widget.textStyle ?? AppFonts.h700).copyWith(height: 1),
        ),
        sizedBoxW04,
        Text(
          getSuffixStr(content),
          style: (widget.textStyle ?? AppFonts.h700).copyWith(
            height: 1,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  void onFocus() {
    focusNode.requestFocus();
  }

  void onFocusLis() {
    setState(() {
      isFocus = focusNode.hasFocus;
    });
  }

  void onChange() {
    setState(() {
      content = controller.text;
      size = _textSize(content, (widget.textStyle ?? AppFonts.h700));
    });
  }
}
