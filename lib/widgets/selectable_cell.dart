import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class SelectableCell extends StatelessWidget {
  const SelectableCell({
    super.key,
    this.prefix,
    required this.label,
    this.content,
    this.onTap,
    this.suffix,
    this.color,
    this.selectedColor,
    this.isSelected = false,
  });
  final Widget? prefix;
  final String label;
  final String? content;
  final Function()? onTap;
  final Widget? suffix;
  final Color? color;
  final Color? selectedColor;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final n = color ?? context.neutral1100;
    final s = selectedColor ?? context.funcCornflowerBlue;
    return Padding(
      padding: padSymHor16Ver12,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Row(
          children: [
            prefix?.paddingOnly(right: 12.0) ?? const SizedBox(),
            Expanded(
                child: Text(
              label,
              style: AppFonts.bMedium.copyWith(color: isSelected ? s : n),
            )),
            suffix ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}
