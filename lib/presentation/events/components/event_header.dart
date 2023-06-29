import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class EventHeader extends StatelessWidget {
  const EventHeader({super.key, required this.time});
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: context.neutral300,
        border: Border(
          bottom: BorderSide(
            color: context.neutral400,
            width: .5,
          ),
        ),
      ),
      child: Row(
        children: [
          sizedBoxW14,
          _Prefix(time: time),
          Text(time.toStringFormat(DateFormater.EEEEddMMyyyy))
        ],
      ),
    );
  }
}

class _Prefix extends StatelessWidget {
  const _Prefix({
    required this.time,
  });
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    if (time.isToday()) {
      return const Text(
        'Today',
        style: AppFonts.h300,
      ).paddingOnly(right: 8);
    } else if (time.isTomorrow()) {
      return const Text(
        'Tomorrow',
        style: AppFonts.h300,
      ).paddingOnly(right: 8);
    } else if (time.isYesterday()) {
      return const Text(
        'Yesterday',
        style: AppFonts.h300,
      ).paddingOnly(right: 8);
    }
    return const SizedBox();
  }
}
