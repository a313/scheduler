import 'package:flutter/material.dart';

import '../core/utils/util.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.color,
    this.height = 1,
    this.indent = 0.0,
    this.endIndent = 0.0,
  });
  final Color? color;
  final double height;
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: indent, end: endIndent),
      child: ColoredBox(
        color: color ?? context.neutral300,
        child: SizedBox(
          width: double.infinity,
          height: height,
        ),
      ),
    );
  }
}
