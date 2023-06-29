import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

import '../../../data/models/event.dart';
import '../../../theme/app_fonts.dart';

class TimeConstComponent extends StatelessWidget {
  const TimeConstComponent({
    super.key,
    required this.data,
  });

  final Event data;

  @override
  Widget build(BuildContext context) {
    final start = data.startTime;
    final end = data.endTime;
    final now = DateTime.now();
    final isGoingOn = now.isBetween(start, end);
    final isAllDay = start.difference(end).inHours > 23;
    return SizedBox(
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (isGoingOn)
                Container(
                  margin: padSymHor04,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: context.primaryDark),
                  width: 6,
                  height: 6,
                )
              else
                sizedBoxW14,
              Text(
                isAllDay
                    ? 'ALL DAY'
                    : data.startTime.toStringFormat(DateFormater.HHmm),
                style: AppFonts.bSmall.copyWith(
                  color: isGoingOn ? context.primaryDark : context.neutral1100,
                  decoration: data.isActive ? null : TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          sizedBoxH08,
          Padding(
            padding: padSymHor14,
            child: Text(
              data.duration.formatInDuration(),
              style: AppFonts.bSmall.copyWith(
                  decoration:
                      data.isActive ? null : TextDecoration.lineThrough),
            ),
          ),
        ],
      ),
    );
  }
}
