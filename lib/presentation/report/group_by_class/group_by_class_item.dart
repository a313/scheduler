import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../../../core/utils/util.dart';

class GrByClassItem extends StatelessWidget {
  const GrByClassItem({
    super.key,
    required this.data,
  });

  final Event data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Row(
        children: [
          Expanded(
              child: Text(
            data.startTime.toStringFormat(DateFormater.EEEEddMMyyyy),
            style: AppFonts.bMedium,
          )),
          if (data.isActive)
            Row(
              children: [
                sizedBoxW16,
                Text(
                  '${'Open'.tr} (${data.joinedIds.length}/${data.invitedIds.length})',
                  style:
                      AppFonts.h300.copyWith(color: context.funcCornflowerBlue),
                ),
              ],
            )
          else
            Text(
              'Close'.tr,
              style: AppFonts.h300.copyWith(color: context.funcRadicalRed),
            )
        ],
      ),
    ).coloredBox(color: context.neutral200);
  }
}
