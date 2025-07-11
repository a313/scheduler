import 'package:flutter/material.dart';
import 'package:aio/core/utils/util.dart';

class FirstCell extends StatelessWidget {
  const FirstCell({
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
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            color: backgroundColor ?? context.neutral100),
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
