import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:aio/data/models/reminder.dart';
import 'package:aio/presentation/reminder/components/reminder_item.dart';

class SwipeReminderCell extends StatelessWidget {
  const SwipeReminderCell({
    super.key,
    required this.data,
    this.onTapped,
    this.actions,
  });
  final Reminder data;
  final Function(Reminder reminder)? onTapped;
  final List<SwipeAction>? actions;

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: ObjectKey(data),
      trailingActions: actions,
      child: ReminderItem(
        data: data,
        onTapped: onTapped,
      ),
    );
  }
}
