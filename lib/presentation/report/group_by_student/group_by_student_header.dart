import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/data/models/report_for_student.dart';

import '../../../core/utils/util.dart';
import '../../../theme/app_fonts.dart';
import '../../../widgets/base/base_tooltip.dart';
import '../../../widgets/local_avatar.dart';

class GrByStudentHeader extends StatelessWidget {
  const GrByStudentHeader({
    super.key,
    required this.data,
    required this.isShowChildren,
    required this.onToggle,
    this.onTapped,
  });
  final ReportForStudent data;
  final bool isShowChildren;
  final Function(bool isShow) onToggle;
  final Function(ReportForStudent data)? onTapped;

  @override
  Widget build(BuildContext context) {
    int total = 0;
    List<String> formula = [];
    List<String> count = [];
    data.data.forEach((key, value) {
      var fee = key.tuition;
      int onCount = 0;
      if (data.student.isSpecial) {
        fee = data.student.fee;
      }
      for (var element in value) {
        if (element.isActive && element.joinedIds.contains(data.student.id)) {
          onCount++;
        }
      }
      count.add('$onCount/${value.length} (${key.name.avatarName()})');
      formula.add('$onCount x $fee');
      total += onCount * fee;
    });

    final fullFormula = '${formula.join(' + ')}= $total';
    final fullJoined = count.join(', ');
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTapped?.call(data),
      child: Container(
        padding: padSymHor16Ver08,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: context.neutral500)),
            color: context.neutral300),
        child: Row(
          children: [
            LocalAvatar(
              path: data.student.image,
              size: 40,
              name: data.student.name,
            ),
            sizedBoxW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          data.student.name,
                          style: AppFonts.h500,
                        ),
                      ),
                      Text(
                        fullJoined,
                        style: AppFonts.h400,
                      ),
                    ],
                  ),
                  BaseTooltip(
                    message: 'student_formula'.tr,
                    child: Row(
                      children: [
                        Text(
                          fullFormula,
                          style: AppFonts.h400
                              .copyWith(color: context.funcCornflowerBlue),
                        ),
                        sizedBoxW06,
                        const Icon(
                          Icons.info_outline,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
