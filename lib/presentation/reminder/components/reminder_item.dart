import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/reminder.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/local_avatar.dart';

class ReminderItem extends StatelessWidget {
  const ReminderItem({
    super.key,
    required this.data,
    this.onTapped,
    required this.onEdit,
  });
  final Reminder data;
  final Function(Reminder reminder)? onTapped;
  final Function(Reminder reminder) onEdit;

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: ObjectKey(data),
      trailingActions: [
        SwipeAction(
          onTap: (handler) => onEdit(data),
          title: 'Edit',
        )
      ],
      child: Padding(
        padding: padAll12,
        child: Row(
          children: [
            LocalAvatar(path: data.image, size: 32),
            sizedBoxW06,
            Text(
              data.name,
              style: AppFonts.bMedium,
            ),
            sizedBoxW06,
            const Expanded(
              child: Text(
                'data.phones.join(",")',
                style: AppFonts.bMedium,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
