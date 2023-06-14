import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/local_avatar.dart';

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: AppFonts.bLarge,
                ),
                Text(
                  data.timetables.isEmpty
                      ? 'Chưa có lịch học'
                      : 'Lịch học: ${data.timetables.map((e) => e.dayInWeek.getDayOfWeek).join(", ")}',
                  style: AppFonts.bSmall,
                )
              ],
            ),
          ),
          if (isSelected) const Icon(Icons.check_circle_rounded)
        ],
      ),
    );
  }
}
