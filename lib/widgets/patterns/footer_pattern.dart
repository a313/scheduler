import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

class FooterPattern extends StatelessWidget {
  const FooterPattern({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Container(
        padding: EdgeInsets.fromLTRB(
            16.0, 7.0, 16.0, max(12.0, context.viewPadding.bottom + 2.0)),
        decoration: BoxDecoration(color: context.neutral100, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            spreadRadius: 4,
          ),
        ]),
        child: child,
      ),
    );
  }
}
