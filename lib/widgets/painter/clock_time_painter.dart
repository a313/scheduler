import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

class ClockTimePainter extends CustomPainter {
  final BuildContext context;
  final DateTime time;
  ClockTimePainter({required this.context, required this.time});

  //60 sec - 360, 1 sec - 6degree
  //12 hours  - 360, 1 hour - 30degrees, 1 min - 0.5degrees

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    const rad = (pi / 180);

    var secHandBrush = Paint()
      ..color = context.funcRadicalRed
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    var hourHandBrush = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    final hourAngle = (time.hour * 30 + time.minute * 0.5) * rad - 0.5 * pi;

    var hourHandX = centerX + radius * 0.4 * cos(hourAngle);
    var hourHandY = centerX + radius * 0.4 * sin(hourAngle);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    final minAngle = time.minute * 6 * rad - 0.5 * pi;
    var minHandBrush = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;
    var minHandX = centerX + radius * 0.6 * cos(minAngle);
    var minHandY = centerX + radius * 0.6 * sin(minAngle);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var centerFillBrush = Paint();
    canvas.drawCircle(center, 6, centerFillBrush);

    final secAngle = time.second * 6 * rad - 0.5 * pi;
    var secHandX = centerX + radius * 0.85 * cos(secAngle);
    var secHandY = centerX + radius * 0.85 * sin(secAngle);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    canvas.drawCircle(center, 4, secHandBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
