import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

import '../../../data/models/event.dart';
import '../../../theme/app_fonts.dart';

class TimeConstComponent extends StatelessWidget {
  const TimeConstComponent({
    super.key,
    required this.data,
    required this.time,
  });
  final DateTime time;
  final Event data;

  @override
  Widget build(BuildContext context) {
    var start = data.startTime;
    if (start.beginOfDay().isBefore(time)) {
      start = time;
    }

    var end = data.endTime;
    if (end.isBefore(time.endOfDay())) {
      end = time;
    }

    var timeStr = data.startTime.toStringFormat(DateFormater.HHmm);
    final now = DateTime.now();
    final isGoingOn = now.isBetween(start, end);

    final duration = end.difference(start);
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
                      shape: BoxShape.circle,
                      color: context.funcCornflowerBlue),
                  width: 6,
                  height: 6,
                )
              else
                sizedBoxW14,
              Text(
                timeStr,
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
              duration.formatInDuration(),
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
