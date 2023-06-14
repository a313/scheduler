import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';

import '../../../data/models/class_room.dart';
import 'class_room_item.dart';

class ClassRoomCell extends StatelessWidget {
  const ClassRoomCell({
    super.key,
    required this.data,
    this.onTapped,
    required this.onEdit,
  });
  final ClassRoom data;

  final Function(ClassRoom classroom)? onTapped;
  final Function(ClassRoom classroom) onEdit;

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
      child: ClassRoomItem(data: data),
    );
  }
}
