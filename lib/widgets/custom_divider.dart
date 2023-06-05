import 'package:flutter/material.dart';

import '../core/utils/util.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    this.color,
    this.height = 1,
  }) : super(key: key);
  final Color? color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color ?? context.neutral300,
      child: SizedBox(
        width: double.infinity,
        height: height,
      ),
    );
  }
}
