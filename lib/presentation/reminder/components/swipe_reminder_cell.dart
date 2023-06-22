import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:scheduler/data/models/reminder.dart';
import 'package:scheduler/presentation/reminder/components/reminder_item.dart';

class SwipeReminderCell extends StatelessWidget {
  const SwipeReminderCell({
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
      child: ReminderItem(
        data: data,
        onTapped: onTapped,
      ),
    );
  }
}
