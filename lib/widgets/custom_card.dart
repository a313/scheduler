import 'package:flutter/material.dart';
import 'package:aio/core/utils/util.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.shadowColor,
    this.color,
  });
  final Widget child;
  final Color? color;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? context.neutral100,
        borderRadius: borRad12,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? context.neutral200,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
