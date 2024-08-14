import 'package:flutter/material.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/theme/app_fonts.dart';

import '../../../widgets/custom_divider.dart';

class Background extends StatelessWidget {
  const Background(
    this.height, {
    super.key,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return TimeFrame(height);
  }
}

class TimeFrame extends StatelessWidget {
  const TimeFrame(
    this.height, {
    super.key,
  });

  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _TimeCell(time: '00:00').size(h: height),
        const _TimeCell(time: '01:00').size(h: height),
        const _TimeCell(time: '02:00').size(h: height),
        const _TimeCell(time: '03:00').size(h: height),
        const _TimeCell(time: '04:00').size(h: height),
        const _TimeCell(time: '05:00').size(h: height),
        const _TimeCell(time: '06:00').size(h: height),
        _TimeCell(time: '07:00', color: context.neutral600).size(h: height),
        const _TimeCell(time: '08:00').size(h: height),
        const _TimeCell(time: '09:00').size(h: height),
        const _TimeCell(time: '10:00').size(h: height),
        const _TimeCell(time: '11:00').size(h: height),
        _TimeCell(time: '12:00', color: context.neutral600).size(h: height),
        _TimeCell(time: '13:00', color: context.neutral600).size(h: height),
        const _TimeCell(time: '14:00').size(h: height),
        const _TimeCell(time: '15:00').size(h: height),
        const _TimeCell(time: '16:00').size(h: height),
        const _TimeCell(time: '17:00').size(h: height),
        _TimeCell(time: '18:00', color: context.neutral600).size(h: height),
        _TimeCell(time: '19:00', color: context.neutral600).size(h: height),
        const _TimeCell(time: '20:00').size(h: height),
        const _TimeCell(time: '21:00').size(h: height),
        const _TimeCell(time: '22:00').size(h: height),
        const _TimeCell(time: '23:00').size(h: height),
      ],
    );
  }
}

class _TimeCell extends StatelessWidget {
  const _TimeCell({
    required this.time,
    this.color,
  });
  final String time;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(time, style: AppFonts.bSuperSmall).size(w: C1W),
        CustomDivider(
          height: 0.3,
          color: color,
        ).expanded(),
      ],
    );
  }
}
