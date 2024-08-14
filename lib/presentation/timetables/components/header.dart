import 'package:flutter/material.dart';
import 'package:aio/theme/app_fonts.dart';

import '../../../core/utils/util.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.time,
  });
  final DateTime time;
  @override
  Widget build(BuildContext context) {
    final start = time.getStartOfWeek();
    return SizedBox(
      height: R1H,
      child: Row(
        children: [
          const Text(' ').size(w: C1W),
          _Date(start: start, incr: 0).expanded(),
          _Date(start: start, incr: 1).expanded(),
          _Date(start: start, incr: 2).expanded(),
          _Date(start: start, incr: 3).expanded(),
          _Date(start: start, incr: 4).expanded(),
          _Date(start: start, incr: 5).expanded(),
          _Date(start: start, incr: 6).expanded(),
        ],
      ),
    );
  }
}

class _Date extends StatelessWidget {
  const _Date({
    required this.start,
    required this.incr,
  });
  final int incr;
  final DateTime start;

  @override
  Widget build(BuildContext context) {
    final r = start.add(Duration(days: incr));
    if (r.isToday()) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration:
              BoxDecoration(borderRadius: borRad16, color: context.primaryDark),
          child: Text(
            '${(incr + 1).getDayOfWeek}, ${r.day}',
            style: AppFonts.h100.copyWith(color: context.neutral100),
            textAlign: TextAlign.center,
          ));
    }
    return Text(
      '${(incr + 1).getDayOfWeek}, ${r.day}',
      style: AppFonts.h200,
      textAlign: TextAlign.center,
    );
  }
}
