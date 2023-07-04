import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:scheduler/domain/entities/swipe_action_data.dart';

import '../../../data/models/class_room.dart';
import 'class_room_item.dart';

class SwipeClassRoomCell extends StatelessWidget {
  const SwipeClassRoomCell({
    super.key,
    required this.data,
    this.onTapped,
    this.actions,
  });
  final ClassRoom data;

  final Function(ClassRoom classroom)? onTapped;
  final List<SwipeActionData<ClassRoom>>? actions;

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: ObjectKey(data),
      trailingActions: actions?.map((e) => e.toAction(data)).toList(),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onTapped?.call(data),
        child: ClassRoomItem(data: data),
      ),
    );
  }
}
