import 'package:flutter/material.dart';

import '../../core/utils/util.dart';

class BaseSelection extends StatelessWidget {
  const BaseSelection({
    Key? key,
    required this.isSelected,
    required this.onSelect,
    required this.child,
    this.padding = padSymHor08Ver06,
    this.fixedWidth,
  }) : super(key: key);
  final Widget child;
  final bool isSelected;
  final Function() onSelect;
  final EdgeInsets padding;
  final double? fixedWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onSelect,
      child: Container(
        width: fixedWidth,
        padding: padding,
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: borRad08,
                color: context.primaryDark,
                border: Border.all(
                  color: context.primaryDark,
                  width: 2,
                ),
              )
            : BoxDecoration(
                borderRadius: borRad08,
                border: Border.all(
                  color: context.neutral300,
                  width: 2,
                ),
              ),
        child: child,
      ),
    );
  }
}
