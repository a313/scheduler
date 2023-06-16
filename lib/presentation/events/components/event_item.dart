import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_state_widget.dart';
import 'package:scheduler/widgets/custom_divider.dart';
import 'package:scheduler/widgets/local_avatar.dart';

import '../../../data/models/event.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.data});

  final Event data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padSymVer08,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimeConstComponent(data: data),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.bSmall,
                ),
                const CustomDivider(),
                ABWidget(
                  isShowA: data.students.isNotEmpty,
                  widgetA: (c) => Row(
                      children:
                          List.generate(min(data.students.length, 5), (index) {
                    final obj = data.students[index];
                    return LocalAvatar(
                      path: obj.image,
                      name: obj.name,
                    );
                  })),
                  widgetB: (c) => Text(
                    'No student included',
                    style: AppFonts.bSmall.copyWith(color: context.neutral600),
                  ),
                ),
                if (data.note.hasText)
                  Text(
                    'Note: ${data.note!}',
                    style: AppFonts.bSmall,
                  ),
              ],
            ),
          ),
          sizedBoxW14,
        ],
      ),
    );
  }
}

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
                data.startTime.toStringFormat(DateFormater.HHmm),
                style: AppFonts.bSmall.copyWith(
                  color: isGoingOn ? context.primaryDark : context.neutral1100,
                ),
              ),
            ],
          ),
          Padding(
            padding: padSymHor14,
            child: Text(
                data.endTime.difference(data.startTime).formatInDuration()),
          ),
        ],
      ),
    );
  }
}
