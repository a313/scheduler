import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/data/models/event.dart';
import 'package:aio/presentation/students/components/compact_student_item.dart';
import 'package:aio/theme/app_fonts.dart';

import '../../../core/utils/util.dart';

class GrByClassItem extends StatefulWidget {
  const GrByClassItem({
    super.key,
    required this.data,
  });

  final Event data;

  @override
  State<GrByClassItem> createState() => _GrByClassItemState();
}

class _GrByClassItemState extends State<GrByClassItem> {
  bool isShowChildren = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                widget.data.startTime.toStringFormat(DateFormater.EEEEddMMyyyy),
                style: AppFonts.bMedium,
              )),
              if (widget.data.isActive)
                Row(
                  children: [
                    sizedBoxW16,
                    Text(
                      '${'Open'.tr} (${widget.data.joinedIds.length}/${widget.data.invitedIds.length})',
                      style: AppFonts.h300
                          .copyWith(color: context.funcCornflowerBlue),
                    ),
                  ],
                )
              else
                Text(
                  'Close'.tr,
                  style: AppFonts.h300.copyWith(color: context.funcRadicalRed),
                ),
              InkWell(
                  onTap: () {
                    setState(() {
                      isShowChildren = !isShowChildren;
                    });
                  },
                  child: isShowChildren
                      ? const Icon(Icons.expand_less)
                      : const Icon(Icons.expand_more)),
            ],
          ),
          if (isShowChildren)
            ...List.generate(widget.data.students.length, (index) {
              final std = widget.data.students[index];
              final isActive = widget.data.isActive;
              final isJoined = widget.data.joinedIds.contains(std.id);
              return Row(
                children: [
                  Expanded(child: CompactStudentItem(data: std)),
                  if (isActive && isJoined)
                    Row(
                      children: [
                        sizedBoxW16,
                        Text(
                          'Joined'.tr,
                          style: AppFonts.h300
                              .copyWith(color: context.funcCornflowerBlue),
                        ),
                      ],
                    )
                  else
                    Text(
                      'Off'.tr,
                      style:
                          AppFonts.h300.copyWith(color: context.funcRadicalRed),
                    )
                ],
              );
            })
        ],
      ),
    ).coloredBox(color: context.neutral200);
  }
}
