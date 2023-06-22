import 'package:flutter/material.dart';
import 'package:scheduler/data/models/schedule.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../../../core/utils/util.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({super.key, required this.data});
  final Schedule data;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            style: AppFonts.bMedium,
          ),
        ],
      ),
    );
  }
}
