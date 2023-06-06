import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  ColoredBox debugColor({Color? color}) {
    return ColoredBox(
      color: color ?? Colors.red.withOpacity(0.5),
      child: this,
    );
  }
}
