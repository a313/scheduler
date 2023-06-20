import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/class_room/edit_timetable/edit_timetable_controller.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import '../../../widgets/base/base_button.dart';
import 'components/select_day_of_week.dart';

class EditTimetablePage extends GetView<EditTimetableController> {
  const EditTimetablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEdit = controller.initData != null;
    return BaseScafoldAppBar(
        title: isEdit ? "Edit schedule" : "Add schedule",
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: padAll16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectDayOfWeek(onChanged: controller.onChangedDate),
                    sizedBoxH24,
                    const Text('Time', style: AppFonts.bLarge),
                    sizedBoxH16,
                    SizedBox(
                        height: 150,
                        child: Row(
                          children: [
                            Expanded(
                              child: CupertinoDatePicker(
                                use24hFormat: true,
                                initialDateTime: DateTime(
                                    2020,
                                    1,
                                    1,
                                    controller.data.begin.hour,
                                    controller.data.begin.minute),
                                mode: CupertinoDatePickerMode.time,
                                onDateTimeChanged: controller.onChangedBegin,
                              ),
                            ),
                            const Text('to'),
                            Expanded(
                              child: CupertinoDatePicker(
                                use24hFormat: true,
                                initialDateTime: DateTime(
                                    2020,
                                    1,
                                    1,
                                    controller.data.end.hour,
                                    controller.data.end.minute),
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
                title: isEdit ? "Update" : "Add",
                onPressed: controller.onUpdate,
              ),
            )
          ],
        ));
  }
}
