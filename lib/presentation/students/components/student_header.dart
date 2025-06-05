import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/class_room.dart';
import 'package:aio/data/models/student.dart';
import 'package:aio/theme/app_fonts.dart';

class StudentHeader extends StatelessWidget {
  const StudentHeader({super.key, required this.classRoom, required this.data});
  final ClassRoom classRoom;
  final List<Student> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: classRoom.name.nameToColor(),
        border: Border(
          bottom: BorderSide(
            color: context.neutral400,
            width: .5,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          sizedBoxW14,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  classRoom.name,
                  style: AppFonts.h500,
                ),
                sizedBoxH04,
                Text(
                  classRoom.timetables.isEmpty
                      ? 'Not exist schedule'.tr
                      : '${'Schedule'.tr}: ${classRoom.timetables.map((e) => e.dayInWeek.getDayOfWeek).join(", ")}',
                  style: AppFonts.bSmall.copyWith(color: context.neutral900),
                )
              ],
            ),
          ),
          Text('${'Total'.tr}: ${data.length}'),
          sizedBoxW14,
        ],
      ),
    );
  }
}
