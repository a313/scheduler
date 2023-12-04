import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_common_widget.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_search_page.dart';
import 'package:scheduler/widgets/bottomsheets/date_picker_bottomsheet.dart';

class BaseTextField extends StatefulWidget {
  const BaseTextField({
    Key? key,
    this.labelText,
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
    this.initialValue,
    this.onClear,
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
  final Function()? onClear;
  final Function(String p1)? onSubmitted;
  final AutovalidateMode? validMode;
  final Widget? prefix;
  final Widget? suffix;
  final String? labelText;
  final TextStyle? textStyle;
  final String? helperText;
  final String? errorText;
  final bool obscureText;
  final String? initialValue;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  late TextEditingController controller;
  late bool showPassword;

  @override
  void initState() {
    showPassword = widget.obscureText;
    controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      obscureText: showPassword,
      maxLines: widget.maxLines,
      validator: widget.validator,
      textCapitalization: widget.textCapitalization,
      enabled: widget.enabled,
      inputFormatters: widget.formaters,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      autovalidateMode: widget.validMode,
      style: (widget.textStyle ?? AppFonts.pMedium).copyWith(
        color: widget.enabled ? null : context.neutral600,
      ),
      initialValue: widget.initialValue,
      decoration: InputDecoration(
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix ??
            _Suffix(
              controller: controller,
              obscureText: widget.obscureText,
              showPassword: showPassword,
              onChanged: widget.onChanged,
              onClear: widget.onClear,
              onToggleVisible: (visible) {
                setState(() {
                  showPassword = visible;
                });
              },
            ),
        labelText: widget.labelText,
        fillColor: widget.enabled ? context.neutral100 : context.neutral300,
        labelStyle: (widget.textStyle ?? AppFonts.pMedium).copyWith(height: 1),
        hintStyle: (widget.textStyle ?? AppFonts.pMedium)
            .copyWith(color: context.neutral600, height: 1),
        helperMaxLines: 1,
        counter: const SizedBox(),
        helperText: widget.helperText,
        hintMaxLines: 2,
        helperStyle:
            AppFonts.bSmall.copyWith(color: context.neutral800, height: 1),
        errorText: widget.errorText,
        errorMaxLines: 2,
        errorStyle:
            AppFonts.bSmall.copyWith(color: context.funcRadicalRed, height: 1),
      ),
    );
  }
}

class _Suffix extends StatelessWidget {
  const _Suffix(
      {required this.controller,
      required this.showPassword,
      required this.obscureText,
      this.onChanged,
      this.onClear,
      this.onToggleVisible});

  final TextEditingController controller;
  final bool showPassword;
  final bool obscureText;

  final Function(String p1)? onChanged;
  final Function()? onClear;
  final Function(bool visible)? onToggleVisible;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            controller.clear();
            onChanged?.call("");
            onClear?.call();
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset("assets/svg/Regular/XCircle.svg"),
          ),
        ),
        if (obscureText)
          IconButton(
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
              color: context.neutral700,
            ),
            onPressed: onToggleVisible?.call(!showPassword),
          ),
      ],
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

class BaseDateField extends StatefulWidget {
  const BaseDateField({
    Key? key,
    required this.labelText,
    this.mode = CupertinoDatePickerMode.date,
    this.initDate,
    this.minDate,
    this.maxDate,
    required this.onSelected,
    required this.timeFormat,
    this.validator,
  }) : super(key: key);

  final String labelText;
  final CupertinoDatePickerMode mode;

  final DateTime? initDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final String timeFormat;
  final Function(DateTime?) onSelected;
  final String? Function(String?)? validator;

  @override
  State<BaseDateField> createState() => _BaseDateFieldState();
}

class _BaseDateFieldState extends State<BaseDateField> with BaseCommonWidgets {
  TextEditingController controller = TextEditingController();
  late DateTime selectedTime;

  @override
  void initState() {
    selectedTime = widget.initDate ?? DateTime.now();
    controller.text = selectedTime.toStringFormat(widget.timeFormat);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showPicker,
      behavior: HitTestBehavior.translucent,
      child: IgnorePointer(
        ignoring: true,
        child: BaseTextField(
          labelText: widget.labelText,
          controller: controller,
          validator: widget.validator,
        ),
      ),
    );
  }

  void showPicker() {
    bottomSheet(DatePickerBottomsheet(
        initDate: selectedTime,
        mode: widget.mode,
        title: widget.labelText,
        onSelected: (date) {
          if (date != null) {
            setState(() {
              selectedTime = date;
              controller.text = date.toStringFormat(widget.timeFormat);
            });
          }
          widget.onSelected.call(date);
        }));
  }
}

class BaseSearchField<T> extends StatefulWidget {
  const BaseSearchField(
      {super.key,
      this.isMultiSelect = false,
      required this.onSelected,
      required this.labelText,
      this.validator,
      this.initValue,
      required this.options,
      required this.itemBuilder,
      this.onSearchEmpty,
      required this.searchBy,
      this.selectedBuilder,
      required this.valueBuilder});
  final List<T>? initValue;
  final List<T> options;
  final bool isMultiSelect;
  final Function(List<T>?) onSelected;
  final String labelText;
  final String? Function(String?)? validator;
  final Widget Function(BuildContext context, T obj) itemBuilder;
  final Widget Function(BuildContext context, T obj)? selectedBuilder;
  final Widget Function(BuildContext context)? onSearchEmpty;
  final String Function(List<T>? values) valueBuilder;
  final bool Function(T element, String value) searchBy;
  @override
  State<BaseSearchField<T>> createState() => _BaseSearchFieldState<T>();
}

class _BaseSearchFieldState<T> extends State<BaseSearchField<T>> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.text = widget.valueBuilder(widget.initValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toSearchPage,
      behavior: HitTestBehavior.translucent,
      child: IgnorePointer(
        ignoring: true,
        child: BaseTextField(
          labelText: widget.labelText,
          controller: controller,
          validator: widget.validator,
        ),
      ),
    );
  }

  Future<void> toSearchPage() async {
    final value = await Get.to(BaseSearchPage(
        isMultiSelect: widget.isMultiSelect,
        title: widget.labelText,
        options: widget.options,
        selected: widget.initValue,
        itemBuilder: widget.itemBuilder,
        selectedBuilder: widget.selectedBuilder,
        searchBy: widget.searchBy));
    if (value == null) return;
    controller.text = widget.valueBuilder(value);
    widget.onSelected(value);
  }
}

class BaseSwitchField extends StatefulWidget {
  const BaseSwitchField({
    super.key,
    required this.initState,
    required this.labelText,
    required this.onChanged,
  });
  final bool initState;
  final String labelText;
  final Function(bool value) onChanged;
  @override
  State<BaseSwitchField> createState() => _BaseSwitchFieldState();
}

class _BaseSwitchFieldState extends State<BaseSwitchField> {
  bool currentState = false;

  @override
  void initState() {
    currentState = widget.initState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        IgnorePointer(
          ignoring: true,
          child: BaseTextField(
            labelText: widget.labelText,
            suffix: const SizedBox(),
          ),
        ),
        CupertinoSwitch(
          value: currentState,
          onChanged: (value) {
            setState(() {
              currentState = value;
            });
            widget.onChanged(currentState);
          },
        ),
      ],
    );
  }
}
