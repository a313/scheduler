import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';

import '../../../data/models/class_room.dart';
import 'class_room_item.dart';

class ClassRoomCell extends StatelessWidget {
  const ClassRoomCell({
    super.key,
    required this.data,
    this.onTapped,
    this.actions,
  });
  final ClassRoom data;

  final Function(ClassRoom classroom)? onTapped;
  final List<SwipeAction>? actions;

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: ObjectKey(data),
      trailingActions: actions,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onTapped?.call(data),
        child: ClassRoomItem(data: data),
      ),
    );
  }
}
