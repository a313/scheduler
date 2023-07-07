import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/widgets/base/base_tooltip.dart';

import '../../../core/utils/util.dart';
import '../../../data/models/event.dart';
import '../../../theme/app_fonts.dart';
import '../../../widgets/local_avatar.dart';

class GrByClassHeader extends StatelessWidget {
  const GrByClassHeader({super.key, required this.data, required this.events});

  final ClassRoom data;
  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    final onCount = events.where((e) => e.isActive).length;
    return Padding(
      padding: padSymHor16Ver08,
      child: Row(
        children: [
          LocalAvatar(
            path: data.image,
            size: 40,
            name: data.name,
          ),
          sizedBoxW12,
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text(data.name, style: AppFonts.h500)),
                    Text('$onCount/${events.length}', style: AppFonts.h400),
                  ],
                ),
                BaseTooltip(
                  message: 'class_formula'.tr,
                  child: Row(
                    children: [
                      Text(
                        caculate(events),
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
          sizedBoxW16,
        ],
      ),
    ).coloredBox(color: context.neutral300);
  }

  String caculate(List<Event> events) {
    final fee = data.tuition;
    var specialFee = 0;
    var studentOnCount = 0;
    final activeEvent = events.where((e) => e.isActive);
    for (var e in activeEvent) {
      for (var s in e.students) {
        if (e.joinedIds.contains(s.id)) {
          if (s.isSpecial) {
            specialFee += s.fee;
          } else {
            studentOnCount += 1;
          }
        }
      }
    }
    final total = studentOnCount * fee + specialFee;
    return '$studentOnCount * $fee + $specialFee = $total';
  }
}
