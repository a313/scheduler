import 'package:flutter/material.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/reminder.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:aio/widgets/local_avatar.dart';

class ReminderItem extends StatelessWidget {
  const ReminderItem({
    super.key,
    required this.data,
    this.onTapped,
  });
  final Reminder data;
  final Function(Reminder reminder)? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTapped?.call(data),
      child: Padding(
        padding: padAll12,
        child: Row(
          children: [
            LocalAvatar(
              path: data.image,
              size: 40,
              name: data.name,
            ),
            sizedBoxW12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: AppFonts.h500,
                ),
                Text(
                  'Create At: ${data.remindDate.toStringFormat(DateFormater.ddMMYYYY)}',
                  style: AppFonts.bSmall.copyWith(color: context.neutral1000),
                ),
                Text(
                  data.remindDate.getDiffTime(DateTime.now()),
                  style: AppFonts.bSmall.copyWith(color: context.neutral1000),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
