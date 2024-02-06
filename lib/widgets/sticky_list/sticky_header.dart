import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class StickyHeader extends StatelessWidget {
  const StickyHeader({
    super.key,
    required this.header,
  });
  final String header;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padSymVer16,
      color: context.neutral200,
      child: Text(
        header,
        style: AppFonts.h500.copyWith(color: context.neutral800),
      ),
    );
  }
}
