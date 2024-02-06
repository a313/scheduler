import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

class AloneCell extends StatelessWidget {
  const AloneCell({
    super.key,
    required this.child,
    this.onTapped,
    this.backgroundColor,
  });
  final Widget child;
  final Function()? onTapped;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: backgroundColor ?? context.neutral100),
        child: child,
      ),
    );
  }
}
