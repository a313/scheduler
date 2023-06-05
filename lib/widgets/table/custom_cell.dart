import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class CustomCell extends StatelessWidget {
  const CustomCell({
    Key? key,
    required this.title,
    this.content,
    this.contentWidget,
    this.titleStyle,
    this.contentStyle,
  })  : assert(content != null || contentWidget != null),
        super(key: key);
  final String title;
  final TextStyle? titleStyle;
  final String? content;
  final TextStyle? contentStyle;
  final Widget? contentWidget;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: titleStyle ??
                AppFonts.pSmall.copyWith(color: context.neutral900),
          ),
        ),
        sizedBoxW04,
        Expanded(
          child: contentWidget ??
              Text(
                content!,
                textAlign: TextAlign.right,
                style: contentStyle ??
                    AppFonts.h300.copyWith(color: context.neutral900),
              ),
        )
      ],
    );
  }
}

class CustomCellFlexibleTitle extends StatelessWidget {
  const CustomCellFlexibleTitle({
    Key? key,
    required this.title,
    this.content,
    this.contentWidget,
    this.titleStyle,
    this.contentStyle,
  })  : assert(content != null || contentWidget != null),
        super(key: key);
  final String title;
  final TextStyle? titleStyle;
  final String? content;
  final TextStyle? contentStyle;
  final Widget? contentWidget;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: titleStyle ??
                AppFonts.pSmall.copyWith(color: context.neutral900),
          ),
        ),
        sizedBoxW04,
        contentWidget ??
            Text(
              content!,
              style: contentStyle ??
                  AppFonts.h300.copyWith(color: context.neutral900),
            ),
      ],
    );
  }
}
