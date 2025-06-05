import 'package:flutter/material.dart';
import 'package:aio/core/utils/util.dart';

import '../theme/app_fonts.dart';

class RatioField<T> extends StatelessWidget {
  const RatioField({
    super.key,
    required this.value,
    this.groupValue,
    required this.onChanged,
    required this.title,
  });
  final String title;
  final T value;
  final T? groupValue;
  final Function(T value) onChanged;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onChanged(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isSelected
              ? Icon(
                  Icons.check_box,
                  color: context.primaryDark,
                )
              : const Icon(Icons.check_box_outline_blank),
          sizedBoxW10,
          Text(
            title,
            style: AppFonts.bMedium,
          )
        ],
      ),
    );
  }
}
