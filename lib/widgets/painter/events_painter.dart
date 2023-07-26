import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

import '../../data/models/event.dart';
import '../../theme/app_fonts.dart';

class EventsPainter extends CustomPainter {
  final BuildContext context;
  final List<Event> events;
  EventsPainter({required this.context, required this.events});

  @override
  void paint(Canvas canvas, Size size) {
    const fullSeconds = 43200;
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    const oneSec = 360 / fullSeconds;
    final now = DateTime.now();
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;
    for (var event in events) {
      final color = event.name.nameToColor().withOpacity(0.2);

      final startTime = event.startTime;
      final endTime = event.endTime;
      final dur = endTime.difference(startTime).inSeconds;
      final begin = startTime.difference(now.beginOfDay()).inSeconds;

      bool isPassedEvent = endTime.isBefore(now);
      bool isMoment = now.isBetween(startTime, endTime);
      var r = 0.3 * radius;
      var strokeWidth = 0.3 * radius;
      if (isPassedEvent) {
        r = 0.2 * radius;
        strokeWidth = 0.1 * radius;
      } else if (isMoment) {
        r = 0.6 * radius;
        strokeWidth = 0.3 * radius;
      } else {
        r = 0.4 * radius;
        strokeWidth = 0.2 * radius;
      }

      if (dur > 900) {
        final startAngle =
            Utils.degreesToRadians(begin % fullSeconds * oneSec) - 0.5 * pi;
        final sweepAngle = Utils.degreesToRadians(dur * oneSec);
        final rect2 = Rect.fromCircle(center: center, radius: r);

        paint.color = color;
        paint.strokeWidth = strokeWidth;
        canvas.drawArc(rect2, startAngle, sweepAngle, false, paint);

        final textSpan = TextSpan(
          text: event.name,
          style: AppFonts.bSuperSmall.copyWith(
            color: context.neutral1100,
          ),
        );
        final textPainter = TextPainter(
          text: textSpan,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        );
        textPainter.layout(
          minWidth: 0,
          maxWidth: 70,
        );
        var x3 = centerX + r * 0.7 * cos(startAngle + sweepAngle * 0.5);
        var y3 = centerX + r * 0.7 * sin(startAngle + sweepAngle * 0.5);
        final tOffset = Offset(x3, y3);
        final xCenter = tOffset.dx - textPainter.width / 2;
        final yCenter = tOffset.dy - textPainter.height / 2;
        textPainter.paint(canvas, Offset(xCenter, yCenter));
      } else {
        print('Less than 15m');
      }
    }
  }

  @override
  bool shouldRepaint(EventsPainter oldDelegate) {
    return listEquals(oldDelegate.events, events);
  }
}
