import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/class_room.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:aio/widgets/local_avatar.dart';

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
    return Opacity(
      opacity: data.isOpen ? 1 : 0.5,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: AppFonts.h500,
                  ),
                  sizedBoxH04,
                  Text(
                    data.timetables.isEmpty
                        ? 'Not exist schedule'.tr
                        : '${'Schedule'.tr}: ${data.timetables.map((e) => e.dayInWeek.getDayOfWeek).join(", ")}',
                    style: AppFonts.bSmall.copyWith(color: context.neutral900),
                  )
                ],
              ),
            ),
            if (isSelected) const Icon(Icons.check_circle_rounded)
          ],
        ),
      ),
    );
  }
}
