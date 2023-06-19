import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../base/base_bottom_sheet.dart';
import '../base/base_button.dart';

class DatePickerBottomsheet extends StatefulWidget {
  const DatePickerBottomsheet({
    Key? key,
    required this.title,
    this.initDate,
    this.minDate,
    this.maxDate,
    this.mode = CupertinoDatePickerMode.date,
    required this.onSelected,
    this.canReturnNull = false,
  }) : super(key: key);
  final String title;
  final DateTime? initDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final CupertinoDatePickerMode mode;
  final Function(DateTime?) onSelected;
  final bool canReturnNull;

  @override
  State<DatePickerBottomsheet> createState() => _DatePickerBottomsheetState();
}

class _DatePickerBottomsheetState extends State<DatePickerBottomsheet> {
  late DateTime selectedDate;

  @override
  void initState() {
    selectedDate = widget.initDate ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
        title: widget.title,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: widget.initDate,
                  maximumDate: widget.maxDate,
                  minimumDate: widget.minDate,
                  mode: widget.mode,
                  use24hFormat: true,
                  onDateTimeChanged: onDateTimeChanged,
                )),
            Padding(
              padding: padSymHor16,
              child: BaseButton.largePrimary(
                  width: double.infinity,
                  title: 'Cập nhật',
                  onPressed: () {
                    Get.back();
                    widget.onSelected(selectedDate);
                  }),
            ),
            if (widget.canReturnNull)
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => widget.onSelected(null),
                child: Padding(
                  padding: padAll16,
                  child: Text(
                    'Không có thông tin',
                    style: AppFonts.h400.copyWith(color: context.primaryLight),
                  ),
                ),
              ),
            sizedBoxH16
          ],
        ));
  }

  void onDateTimeChanged(DateTime value) {
    selectedDate = value;
  }
}
