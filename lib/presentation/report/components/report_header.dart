import 'package:flutter/material.dart';
import 'package:scheduler/data/models/report.dart';

import '../../../core/utils/util.dart';
import '../../../theme/app_fonts.dart';
import '../../../widgets/local_avatar.dart';

class ReportHeader extends StatelessWidget {
  const ReportHeader({
    super.key,
    required this.data,
    required this.isShowChildren,
    required this.onToggle,
    this.onTapped,
  });
  final Report data;
  final bool isShowChildren;
  final Function(bool isShow) onToggle;
  final Function(Report data)? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTapped?.call(data),
      child: Container(
        padding: padSymHor12,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: context.neutral500)),
            color: context.neutral100),
        child: Row(
          children: [
            LocalAvatar(
              path: data.student.image,
              size: 32,
              name: data.student.name,
            ),
            sizedBoxW12,
            Expanded(
              child: Text(
                data.student.name,
                style: AppFonts.h500,
              ),
            ),
            Text(
              data.getFormula,
              style: AppFonts.bMedium,
            ),
            IconButton(
                onPressed: () => onToggle(!isShowChildren),
                icon: isShowChildren
                    ? const Icon(Icons.keyboard_double_arrow_up)
                    : const Icon(Icons.keyboard_double_arrow_down)),
          ],
        ),
      ),
    );
  }
}
