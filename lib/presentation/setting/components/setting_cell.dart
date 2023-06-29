import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

class SettingCell extends StatelessWidget {
  const SettingCell({
    super.key,
    required this.prefix,
    required this.label,
    this.content,
    this.onTap,
    this.suffix,
  });
  final Widget prefix;
  final String label;
  final String? content;
  final Function()? onTap;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: [
          prefix,
          sizedBoxW08,
          Expanded(child: Text(label)),
          if (content != null) Text(content!),
          suffix ??
              Icon(
                Icons.keyboard_arrow_right,
                color: context.neutral800,
              ),
        ],
      ),
    );
  }
}
