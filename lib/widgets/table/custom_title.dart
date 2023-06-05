import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final double smallSize;
  final double bigSize;

  const CustomTitle(
    this.title, {
    Key? key,
    this.textStyle,
    this.smallSize = 16,
    this.bigSize = 18,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final style = textStyle ?? AppFonts.h500;
    return Text(
      title,
      style:
          style.copyWith(fontSize: context.isSmallScene ? smallSize : bigSize),
    );
  }
}
