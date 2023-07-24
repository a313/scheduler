import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class ClockBackgroundPainter extends CustomPainter {
  final BuildContext context;

  ClockBackgroundPainter(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = context.neutral100;
    canvas.drawCircle(center, radius, fillBrush);

    var outlineBrush = Paint()
      ..color = context.neutral1100
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, radius, outlineBrush);

    var outerCircleRadius = radius - 4;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 6) {
      const rad = pi / 180;
      final angle = i * rad - 0.5 * pi;
      var x1 = centerX + outerCircleRadius * cos(angle);
      var y1 = centerX + outerCircleRadius * sin(angle);
      var x2 = centerX + innerCircleRadius * cos(angle);
      var y2 = centerX + innerCircleRadius * sin(angle);
      if (i % 30 == 0) {
        var dashBrush = Paint()
          ..color = context.neutral1000
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.square
          ..strokeWidth = 3;
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
        var hour = i ~/ 30;
        if (hour == 0) hour = 12;
        final textSpan = TextSpan(
          text: '$hour',
          style: AppFonts.bLarge.copyWith(
            color: context.neutral1100,
            fontSize: 30,
          ),
        );
        final textPainter = TextPainter(
          text: textSpan,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        );
        textPainter.layout(
          minWidth: 0,
          maxWidth: size.width,
        );
        var x3 = centerX + (radius - 36) * cos(angle);
        var y3 = centerX + (radius - 36) * sin(angle);
        final tOffset = Offset(x3, y3);
        final xCenter = tOffset.dx - textPainter.width / 2;
        final yCenter = tOffset.dy - textPainter.height / 2;
        textPainter.paint(canvas, Offset(xCenter, yCenter));
      } else {
        var dashBrush = Paint()
          ..color = context.neutral1000
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.square
          ..strokeWidth = 0.8;
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
