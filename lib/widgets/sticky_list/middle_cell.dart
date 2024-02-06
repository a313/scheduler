import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

class MiddleCell extends StatelessWidget {
  const MiddleCell({
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
        padding: padSymHor16,
        color: backgroundColor ?? context.neutral100,
        child: Column(
          children: [
            sizedBoxH16,
            child,
            sizedBoxH16,
            Divider(height: 1, color: context.neutral300),
          ],
        ),
      ),
    );
  }
}
