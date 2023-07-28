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
      Color color;

      final startTime = event.startTime;
      final endTime = event.endTime;
      final dur = endTime.difference(startTime).inSeconds;
      final begin = startTime.difference(now.beginOfDay()).inSeconds;

      bool isPassedEvent = endTime.isBefore(now);
      bool isFuture = startTime.isAfter(now);
      double r;
      double scale = 1.0;
      var strokeWidth = 0.3 * radius;
      if (isPassedEvent) {
        scale = (1 - now.difference(endTime).inMinutes / (12 * 60));
        r = 0.4 * scale * radius;
        strokeWidth = 0.1 * radius;
      } else if (isFuture) {
        scale = (1 - startTime.difference(now).inMinutes / (12 * 60));
        r = 0.6 * scale * radius;
        strokeWidth = 0.2 * radius;
      } else {
        r = 0.6 * scale * radius;
        strokeWidth = 0.3 * radius;
      }
      color = Color.lerp(context.neutral100, event.name.nameToColor(), scale)!;
      final startAngle =
          Utils.degreesToRadians(begin % fullSeconds * oneSec) - 0.5 * pi;
      final sweepAngle = Utils.degreesToRadians(dur * oneSec);
      if (dur > 300) {
        final rect2 = Rect.fromCircle(center: center, radius: r);
        paint.color = color.withOpacity((0.3 * scale).clamp(0.05, 0.5));
        paint.strokeWidth = strokeWidth;
        canvas.drawArc(rect2, startAngle, sweepAngle, false, paint);
      } else {
        r *= 1.7;
      }
      var x = centerX + r * cos(startAngle + sweepAngle * 0.5);
      var y = centerX + r * sin(startAngle + sweepAngle * 0.5);
      final tOffset = Offset(x, y);
      final pointPainter = Paint()..color = color;

      canvas.drawCircle(tOffset, 4 * scale, pointPainter);

      final textSpan = TextSpan(
        text: event.name,
        style: AppFonts.bSuperSmall.copyWith(color: context.neutral1100),
      );
      final textPainter = TextPainter(
        text: textSpan,
        maxLines: 1,
        textScaleFactor: scale,
        textDirection: TextDirection.rtl,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: 70,
      );
      final xCenter = tOffset.dx + 6 * scale;
      final yCenter = tOffset.dy - textPainter.height / 2;
      textPainter.paint(canvas, Offset(xCenter, yCenter));
    }
  }

  @override
  bool shouldRepaint(EventsPainter oldDelegate) {
    return listEquals(oldDelegate.events, events);
  }
}
