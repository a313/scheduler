import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:aio/data/models/schedule.dart';
import 'package:aio/presentation/schedules/components/schedule_item.dart';

class SwipeScheduleCell extends StatelessWidget {
  const SwipeScheduleCell({
    super.key,
    required this.data,
    this.onTapped,
    this.actions,
  });
  final Schedule data;
  final Function(Schedule reminder)? onTapped;
  final List<SwipeAction>? actions;

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: ObjectKey(data),
      trailingActions: actions,
      child: ScheduleItem(
        data: data,
        onTapped: onTapped,
      ),
    );
  }
}
