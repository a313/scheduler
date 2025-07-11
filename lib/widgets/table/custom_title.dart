import 'package:flutter/material.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/theme/app_fonts.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final double smallSize;
  final double bigSize;

  const CustomTitle(
    this.title, {
    super.key,
    this.textStyle,
    this.smallSize = 16,
    this.bigSize = 18,
  });
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
