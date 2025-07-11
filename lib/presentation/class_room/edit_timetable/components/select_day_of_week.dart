import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/widgets/ratio_field.dart';

import '../../../../theme/app_fonts.dart';

class SelectDayOfWeek extends StatefulWidget {
  const SelectDayOfWeek({
    super.key,
    required this.onChanged,
    this.initDate,
  });
  final int? initDate;
  final Function(int day) onChanged;

  @override
  State<SelectDayOfWeek> createState() => _SelectDayOfWeekState();
}

class _SelectDayOfWeekState extends State<SelectDayOfWeek> {
  late int? selected;
  @override
  void initState() {
    selected = widget.initDate ?? -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date'.tr, style: AppFonts.bLarge),
        sizedBoxH08,
        Wrap(
          runSpacing: 16,
          spacing: 8,
          children: [
            RatioField<int>(
              title: 1.getDayOfWeek,
              value: 1,
              groupValue: selected,
              onChanged: onChanged,
            ),
            RatioField<int>(
              title: 2.getDayOfWeek,
              value: 2,
              groupValue: selected,
              onChanged: onChanged,
            ),
            RatioField<int>(
              title: 3.getDayOfWeek,
              value: 3,
              groupValue: selected,
              onChanged: onChanged,
            ),
            RatioField<int>(
              title: 4.getDayOfWeek,
              value: 4,
              groupValue: selected,
              onChanged: onChanged,
            ),
            RatioField<int>(
              title: 5.getDayOfWeek,
              value: 5,
              groupValue: selected,
              onChanged: onChanged,
            ),
            RatioField<int>(
              title: 6.getDayOfWeek,
              value: 6,
              groupValue: selected,
              onChanged: onChanged,
            ),
            RatioField<int>(
              title: 7.getDayOfWeek,
              value: 7,
              groupValue: selected,
              onChanged: onChanged,
            ),
          ],
        ),
      ],
    );
  }

  void onChanged(int? value) {
    setState(() {
      selected = value;
      if (value != null) {
        widget.onChanged(value);
      }
    });
  }
}
