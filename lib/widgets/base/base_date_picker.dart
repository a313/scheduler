import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aio/core/utils/util.dart';

import '../../core/state_management/base_common_widget.dart';
import '../bottomsheets/date_picker_bottomsheet.dart';
import 'base_input.dart';

class BaseDatePicker extends StatelessWidget with BaseCommonWidgets {
  const BaseDatePicker({
    super.key,
    required this.title,
    this.isRequired = false,
    this.initDate,
    required this.onSelected,
    this.validMode,
    this.enabled = true,
    this.validator,
    this.minDate,
    this.maxDate,
    this.canReturnNull = false,
    this.mode = CupertinoDatePickerMode.date,
  });
  final String title;
  final bool isRequired;
  final DateTime? initDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final Function(DateTime? date) onSelected;
  final AutovalidateMode? validMode;
  final bool enabled;

  final bool canReturnNull;
  final CupertinoDatePickerMode mode;
  final String? Function(DateTime?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
        initialValue: initDate,
        autovalidateMode: validMode,
        validator: validator,
        builder: (form) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onSelectDate(form),
            child: IgnorePointer(
              ignoring: true,
              child: BaseTextField(
                key: ValueKey(form.value),
                validMode: AutovalidateMode.disabled,
                errorText: form.errorText,
                initialValue: form.value?.toStringFormat(DateFormater.ddMMYYYY),
                suffix: const IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: null,
                ),
                labelText: title,
                enabled: enabled,
              ),
            ),
          );
        });
  }

  void onSelectDate(FormFieldState<DateTime> form) {
    if (!enabled) return;
    bottomSheet(DatePickerBottomsheet(
      title: title,
      onSelected: (date) {
        form.didChange(date);
        onSelected(date);
      },
      minDate: minDate,
      maxDate: maxDate,
      canReturnNull: canReturnNull,
      initDate: initDate,
      mode: mode,
    ));
  }
}
