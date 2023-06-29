import 'package:flutter/material.dart';
import 'package:scheduler/data/models/schedule.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../../../core/utils/util.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem(
      {super.key, required this.data, this.onTapped, this.suffix});
  final Schedule data;
  final Function(Schedule data)? onTapped;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapped?.call(data),
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: padAll12,
        child: Row(
          children: [
            Expanded(
              child: Text(
                data.name,
                style: AppFonts.bMedium,
              ),
            ),
            sizedBoxW06,
            Text(
              '${data.begin.formated} -> ${data.end.formated}',
              style: AppFonts.bMedium.copyWith(color: context.neutral900),
            ),
            sizedBoxW04,
            suffix ??
                Icon(
                  Icons.keyboard_arrow_right,
                  color: context.neutral800,
                ),
          ],
        ),
      ),
    );
  }
}
