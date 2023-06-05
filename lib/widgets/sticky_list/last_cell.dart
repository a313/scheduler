import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

class LastCell extends StatelessWidget {
  const LastCell({
    Key? key,
    required this.child,
    this.onTapped,
    this.backgroundColor,
  }) : super(key: key);
  final Widget child;
  final Function()? onTapped;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      behavior: HitTestBehavior.translucent,
      child: Container(
          padding: padAll16,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              color: backgroundColor ?? context.neutral100),
          child: child),
    );
  }
}
