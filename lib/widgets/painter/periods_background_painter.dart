import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class PeriodsBackgroundPainter extends CustomPainter {
  final BuildContext context;
  final int period;
  DateTime begin;

  PeriodsBackgroundPainter({
    required this.context,
    required this.period,
    required this.begin,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    const rad = pi / 180;
    final pieceAngle = 360 / period;
    const arrWidth = 12;
    final borderPaint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < period; i++) {
      final angle = pieceAngle * i * rad - 0.5 * pi;
      final sweepAngle = Utils.degreesToRadians(pieceAngle);
      final rect2 = Rect.fromCircle(center: center, radius: 0.85 * radius);
      final color = getColorByIndex(i + 1);
      final paint = Paint()
        ..color = color
        ..strokeWidth = 0.3 * radius
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(rect2, angle, sweepAngle, false, paint);

      var x1 = centerX + radius * 0.7 * cos(angle);
      var y1 = centerX + radius * 0.7 * sin(angle);
      var x2 = centerX + radius * cos(angle);
      var y2 = centerX + radius * sin(angle);
      var x3 = centerX + radius * 0.85 * cos(angle + sweepAngle * 0.5);
      var y3 = centerX + radius * 0.85 * sin(angle + sweepAngle * 0.5);
      canvas.drawLine(Offset(x2, y2), Offset(x1, y1), borderPaint);

      final textSpan = TextSpan(
        text: '${i + 1}',
        style: AppFonts.bSuperSmall.copyWith(color: context.neutral100),
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
      final tOffset =
          Offset(x3 - textPainter.width / 2, y3 - textPainter.height / 2);
      textPainter.paint(canvas, tOffset);
    }

    canvas.drawCircle(center, radius, borderPaint);
    canvas.drawCircle(center, radius * 0.7, borderPaint);

    ///draw time
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.indigoAccent
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    final border = Paint()
      ..strokeWidth = 1
      ..color = context.neutral1100
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final fullMin = period * 24 * 60;

    final minPerDeg = 360.0 / fullMin;
    final passTime = DateTime.now().difference(begin).inMinutes;

    var timeDeg = passTime * minPerDeg - 90;

    final p = Path();
    var x = centerX + radius * 0.8 * cos(Utils.degreesToRadians(timeDeg));
    var y = centerY + radius * 0.8 * sin(Utils.degreesToRadians(timeDeg));
    p.moveTo(x, y);

    x = centerX + arrWidth * cos(Utils.degreesToRadians(timeDeg - 90));
    y = centerY + arrWidth * sin(Utils.degreesToRadians(timeDeg - 90));
    p.lineTo(x, y);

    x = centerX + arrWidth * cos(Utils.degreesToRadians(timeDeg + 180));
    y = centerY + arrWidth * sin(Utils.degreesToRadians(timeDeg + 180));
    p.lineTo(x, y);

    x = centerX + arrWidth * cos(Utils.degreesToRadians(timeDeg + 90));
    y = centerY + arrWidth * sin(Utils.degreesToRadians(timeDeg + 90));
    p.lineTo(x, y);
    p.close();

    canvas.drawPath(p, paint);
    canvas.drawPath(p, border);
  }

  @override
  bool shouldRepaint(PeriodsBackgroundPainter oldDelegate) {
    return oldDelegate.begin != begin || oldDelegate.period != period;
  }

  Color getColorByIndex(int i) {
    if (i == 14) return context.funcRadicalRed;
    if (i <= 7) {
      return context.funcRadicalRed;
    } else if (i <= 11) {
      return const Color.fromARGB(255, 239, 173, 51);
    } else if (i <= 18) {
      return context.primaryLight;
    }
    return context.funcCornflowerBlue;
  }
}
