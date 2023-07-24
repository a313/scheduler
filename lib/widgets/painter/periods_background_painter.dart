import 'dart:math';

import 'package:flutter/material.dart';

class PeriodsBackgroundPainter extends CustomPainter {
  final BuildContext context;
  final int period;

  PeriodsBackgroundPainter({required this.context, required this.period});
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
      final startAngle = pieceAngle * i * rad - 0.5 * pi;
      final rect2 = Rect.fromCircle(center: center, radius: 0.85 * radius);
      final paint = Paint()
        ..color = Colors.blue
        ..strokeWidth = 0.3 * radius
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(
          rect2, startAngle, degreesToRadians(pieceAngle), false, paint);

      var x1 = centerX + radius * 0.7 * cos(startAngle);
      var y1 = centerX + radius * 0.7 * sin(startAngle);
      var x2 = centerX + radius * cos(startAngle);
      var y2 = centerX + radius * sin(startAngle);

      canvas.drawLine(Offset(x2, y2), Offset(x1, y1), borderPaint);
    }

    canvas.drawCircle(center, radius, borderPaint);
    canvas.drawCircle(center, radius * 0.7, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  double degreesToRadians(double degrees) {
    return degrees * pi / 180.0;
  }

  double radiansToDegrees(double radians) {
    return radians * 180 / pi;
  }
}
