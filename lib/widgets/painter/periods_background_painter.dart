import 'dart:math';

import 'package:flutter/material.dart';

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
    final borderPaint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    for (double i = 0; i < period; i++) {
      final angle = pieceAngle * i * rad - 0.5 * pi;
      final rect2 = Rect.fromCircle(center: center, radius: 0.85 * radius);
      final paint = Paint()
        ..color = Colors.blue
        ..strokeWidth = 0.3 * radius
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(rect2, angle, degreesToRadians(pieceAngle), false, paint);

      var x1 = centerX + radius * 0.7 * cos(angle);
      var y1 = centerX + radius * 0.7 * sin(angle);
      var x2 = centerX + radius * cos(angle);
      var y2 = centerX + radius * sin(angle);

      canvas.drawLine(Offset(x2, y2), Offset(x1, y1), borderPaint);
    }

    canvas.drawCircle(center, radius, borderPaint);
    canvas.drawCircle(center, radius * 0.7, borderPaint);

    ///draw time
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.indigoAccent
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;
    final fullSeconds = period * 24 * 60 * 60;
    final passTime = DateTime.now().difference(begin).inSeconds;

    final dv = passTime ~/ fullSeconds;

    final timeAngle = degreesToRadians(360 / dv);

    final p = Path();
    var x = centerX + 12 * cos(timeAngle - 0.5 * pi);
    var y = centerY + 12 * sin(timeAngle + 0.5 * pi);
    p.moveTo(x, y);
    x = centerX + radius * 0.8 * cos(timeAngle);
    y = centerX + radius * 0.8 * sin(timeAngle);
    p.lineTo(x, y);
    x = centerX + 12 * cos(timeAngle + 0.5 * pi);
    y = centerY + 12 * sin(timeAngle - 0.5 * pi);
    p.lineTo(x, y);
    x = centerX + 12 * cos(timeAngle - pi);
    y = centerY + 12 * sin(timeAngle + pi);
    p.lineTo(x, y);

    p.close();
    canvas.drawPath(p, paint);
  }

  @override
  bool shouldRepaint(PeriodsBackgroundPainter oldDelegate) {
    return oldDelegate.begin != begin || oldDelegate.period != period;
  }

  double degreesToRadians(double degrees) {
    return degrees * pi / 180.0;
  }

  double radiansToDegrees(double radians) {
    return radians * 180 / pi;
  }
}
