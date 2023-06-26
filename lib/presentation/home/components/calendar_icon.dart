import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

import '../../../theme/app_fonts.dart';

class CalendarIcon extends StatelessWidget {
  const CalendarIcon({
    super.key,
    required this.isActive,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final day = now.day.toString();

    return Stack(
      children: [
        Container(
          width: 24,
          margin: const EdgeInsets.only(bottom: 4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(
              color: isActive ? context.primaryDark : context.neutral600,
              width: 1.5,
            ),
            color: isActive ? context.primaryDark : context.neutral100,
          ),
          child: Column(
            children: [
              const SizedBox(height: 6),
              Text(
                day,
                style: AppFonts.h100.copyWith(
                    fontSize: 13,
                    color: isActive ? context.neutral100 : context.neutral600),
              ),
            ],
          ),
        ),
        Positioned(
            top: 6,
            child: Container(
              width: 24,
              height: 1.5,
              color: isActive ? context.neutral100 : context.neutral600,
            ))
      ],
    );
  }
}
