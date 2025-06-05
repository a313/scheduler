import 'package:aio/core/utils/util.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:full_calender/models/lunar_date_time.dart';

class DefaultDayCell extends StatelessWidget {
  const DefaultDayCell({
    super.key,
    required this.date,
    required this.lunarDetail,
  });

  final DateTime date;
  final LunarDateTime lunarDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Stack(
        children: [
          Center(
            child: Text(
              date.day.toString(),
              style: AppFonts.bMedium,
            ),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: Text(
              '${lunarDetail.day}',
              style: AppFonts.h100.copyWith(
                color: context.neutral600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
