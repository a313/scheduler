import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  ColoredBox coloredBox({Color? color}) {
    return ColoredBox(
      color: color ?? Colors.red.withOpacity(0.5),
      child: this,
    );
  }

  Expanded expanded({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }

  SizedBox size({double? w, double? h}) {
    return SizedBox(width: w, height: h, child: this);
  }
}
