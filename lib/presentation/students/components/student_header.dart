import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';

class StudentHeader extends StatelessWidget {
  const StudentHeader({super.key, required this.classRoom});
  final ClassRoom? classRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: context.neutral300,
        border: Border(
          bottom: BorderSide(
            color: context.neutral400,
            width: .5,
          ),
        ),
      ),
      child: Row(
        children: [sizedBoxW14, Text(classRoom?.name ?? 'Not in any class')],
      ),
    );
  }
}
