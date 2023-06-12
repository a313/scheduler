import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/local_avatar.dart';

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

class ClassRoomItem extends StatelessWidget {
  const ClassRoomItem({
    super.key,
    required this.data,
    this.isSelected = false,
  });

  final ClassRoom data;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padAll12,
      child: Row(
        children: [
          LocalAvatar(path: data.image, size: 32),
          sizedBoxW06,
          Text(
            data.name,
            style: AppFonts.bMedium,
          ),
          // sizedBoxW06,
          // Expanded(
          //   child: Text(
          //     'data.phones.join(",")',
          //     style: AppFonts.bMedium,
          //     textAlign: TextAlign.right,
          //   ),
          // ),
          if (isSelected) const Icon(Icons.check_circle_rounded)
        ],
      ),
    );
  }
}
