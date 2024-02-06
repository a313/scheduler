import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class BaseTooltip extends StatelessWidget {
  const BaseTooltip({
    super.key,
    required this.child,
    this.margin,
    this.message,
    this.richMessage,
    this.preferBelow = true,
    this.onTriggered,
    this.padding = padSymHor08Ver06,
  });
  final Widget child;
  final String? message;
  final InlineSpan? richMessage;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool preferBelow;
  final Function()? onTriggered;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      triggerMode: TooltipTriggerMode.tap,
      textStyle: AppFonts.pSmall.copyWith(color: context.neutral100),
      onTriggered: onTriggered,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.black,
      ),
      preferBelow: preferBelow,
      message: message,
      richMessage: richMessage,
      showDuration: const Duration(seconds: 5),
      child: child,
    );
  }
}
