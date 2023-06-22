import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/reminder.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/local_avatar.dart';

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
              size: 32,
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
                sizedBoxH06,
                Text(
                  data.createDate.getPassedTime(),
                  style: AppFonts.bSmall.copyWith(color: context.neutral900),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
