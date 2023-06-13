import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/class_room/edit_timetable/edit_timetable_controller.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import '../../../widgets/base/base_button.dart';

class EditTimetablePage extends GetView<EditTimetableController> {
  const EditTimetablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEdit = controller.initData != null;
    return BaseScafoldAppBar(
        title: isEdit ? "Sửa thông tin" : "Thêm mới",
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: padAll16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SelectDayOfWeek(),
                    sizedBoxH24,
                    Text('Thời gian', style: AppFonts.bLarge),
                    sizedBoxH16,
                    SizedBox(
                        height: 150,
                        child: Row(
                          children: [
                            Expanded(
                              child: CupertinoDatePicker(
                                use24hFormat: true,
                                initialDateTime: DateTime.now(),
                                mode: CupertinoDatePickerMode.time,
                                onDateTimeChanged: controller.onChangedBegin,
                              ),
                            ),
                            const Text('đến'),
                            Expanded(
                              child: CupertinoDatePicker(
                                use24hFormat: true,
                                initialDateTime: DateTime.now(),
                                mode: CupertinoDatePickerMode.time,
                                onDateTimeChanged: controller.onChangedEnd,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: padAll16,
              child: BaseButton.largePrimary(
                title: isEdit ? "Cập nhật" : "Thêm mới",
                onPressed: controller.onInsertOrUpdate,
              ),
            )
          ],
        ));
  }
}

class SelectDayOfWeek extends StatefulWidget {
  const SelectDayOfWeek({
    super.key,
  });

  @override
  State<SelectDayOfWeek> createState() => _SelectDayOfWeekState();
}

class _SelectDayOfWeekState extends State<SelectDayOfWeek> {
  late int? selected;
  @override
  void initState() {
    selected = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double size = (min(Get.width, Get.height) - 32) / 4;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ngày', style: AppFonts.bLarge),
        Wrap(
          children: [
            SizedBox(
              width: size,
              child: RadioListTile<int>(
                title: const Text('T2'),
                value: 2,
                groupValue: selected,
                dense: true,
                contentPadding: EdgeInsets.zero,
                onChanged: onChanged,
              ),
            ),
            SizedBox(
              width: size,
              child: RadioListTile<int>(
                title: const Text('T3'),
                value: 3,
                groupValue: selected,
                dense: true,
                contentPadding: EdgeInsets.zero,
                onChanged: onChanged,
              ),
            ),
            SizedBox(
              width: size,
              child: RadioListTile<int>(
                title: const Text('T4'),
                value: 4,
                groupValue: selected,
                dense: true,
                contentPadding: EdgeInsets.zero,
                onChanged: onChanged,
              ),
            ),
            SizedBox(
              width: size,
              child: RadioListTile<int>(
                title: const Text('T5'),
                value: 5,
                groupValue: selected,
                dense: true,
                contentPadding: EdgeInsets.zero,
                onChanged: onChanged,
              ),
            ),
            SizedBox(
              width: size,
              child: RadioListTile<int>(
                title: const Text('T6'),
                value: 6,
                groupValue: selected,
                dense: true,
                contentPadding: EdgeInsets.zero,
                onChanged: onChanged,
              ),
            ),
            SizedBox(
              width: size,
              child: RadioListTile<int>(
                title: const Text('T7'),
                value: 7,
                groupValue: selected,
                dense: true,
                contentPadding: EdgeInsets.zero,
                onChanged: onChanged,
              ),
            ),
            SizedBox(
              width: size,
              child: RadioListTile<int>(
                  title: const Text('CN'),
                  value: 0,
                  groupValue: selected,
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  onChanged: onChanged),
            ),
          ],
        ),
      ],
    );
  }

  void onChanged(int? value) {
    setState(() {
      selected = value;
    });
  }
}
