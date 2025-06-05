import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/data/models/class_room.dart';
import 'package:aio/data/models/event.dart';
import 'package:aio/widgets/local_avatar.dart';

import '../../../core/utils/util.dart';
import '../../../theme/app_fonts.dart';

class GrByStudentItem extends StatelessWidget {
  const GrByStudentItem({
    super.key,
    required this.data,
    required this.joinerId,
    required this.classRoom,
  });
  final ClassRoom classRoom;
  final Event data;
  final int? joinerId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 8, 16, 8),
      child: Row(
        children: [
          LocalAvatar(
            path: classRoom.image,
            size: 24,
            name: data.name,
          ),
          sizedBoxW12,
          Expanded(
              child: Text(
                  data.startTime.toStringFormat(DateFormater.EEEEddMMyyyy))),
          if (data.isActive && data.joinedIds.contains(joinerId))
            Row(
              children: [
                sizedBoxW16,
                Text(
                  'Joined'.tr,
                  style:
                      AppFonts.h300.copyWith(color: context.funcCornflowerBlue),
                ),
              ],
            )
          else
            Text(
              'Off'.tr,
              style: AppFonts.h300.copyWith(color: context.funcRadicalRed),
            )
        ],
      ),
    );
  }
}
