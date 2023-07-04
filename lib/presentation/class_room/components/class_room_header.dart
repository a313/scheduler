import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/theme/app_fonts.dart';

class ClassRoomHeader extends StatelessWidget {
  const ClassRoomHeader({super.key, required this.data, required this.title});
  final String title;
  final List<ClassRoom> data;

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
        children: [
          sizedBoxW14,
          Expanded(
            child: Text(title.tr, style: AppFonts.bMedium),
          ),
          Text('${'Total'.tr}: ${data.length}'),
          sizedBoxW14,
        ],
      ),
    );
  }
}
