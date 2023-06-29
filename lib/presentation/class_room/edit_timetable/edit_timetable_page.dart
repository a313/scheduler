import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/schedule.dart';
import 'package:scheduler/presentation/class_room/edit_timetable/edit_timetable_controller.dart';
import 'package:scheduler/presentation/schedules/components/selectable_schedule_item.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_button.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/base/base_select_field.dart';
import 'package:scheduler/widgets/shimmer/shimmer_table.dart';

import 'components/select_day_of_week.dart';

class EditTimetablePage extends GetView<EditTimetableController> {
  const EditTimetablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEdit = controller.initData != null;
    return BaseScafoldAppBar(
        title: isEdit ? "Edit Timetable" : "Add Timetable",
        body: Column(children: [
          Expanded(
              child: SingleChildScrollView(
                  padding: padAll16,
                  child: controller.obx((state) {
                    final data = controller.data;
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectDayOfWeek(
                              initDate: data.dayInWeek,
                              onChanged: controller.onChangedDate),
                          sizedBoxH24,
                          BaseSelectField<Schedule>(
                            key: UniqueKey(),
                            isMultiSelect: false,
                            onSelected: controller.onSelected,
                            labelText: 'Pick Schedule',
                            options: state!,
                            initValue: controller.initSchedule,
                            itemBuilder: (context, data) =>
                                SelectableStudentCell(
                                    data: data, didSelect: false),
                            selectedBuilder: (context, data) =>
                                SelectableStudentCell(
                                    data: data, didSelect: true),
                            valueBuilder: (values) {
                              if (values == null || values.isEmpty) {
                                return "";
                              }
                              return values.map((e) => e.name).join(", ");
                            },
                          ),
                          const Text('Time Range', style: AppFonts.bLarge),
                          sizedBoxH16,
                          SizedBox(
                            key: UniqueKey(),
                            height: 150,
                            child: Row(
                              children: [
                                Expanded(
                                  child: CupertinoDatePicker(
                                    use24hFormat: true,
                                    initialDateTime: DateTime(2020, 1, 1,
                                        data.begin.hour, data.begin.minute),
                                    mode: CupertinoDatePickerMode.time,
                                    onDateTimeChanged:
                                        controller.onChangedBegin,
                                  ),
                                ),
                                const Text('to'),
                                Expanded(
                                  child: CupertinoDatePicker(
                                    use24hFormat: true,
                                    initialDateTime: DateTime(2020, 1, 1,
                                        data.end.hour, data.end.minute),
                                    mode: CupertinoDatePickerMode.time,
                                    onDateTimeChanged: controller.onChangedEnd,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]);
                  }, onLoading: const ShimmerTable()))),
          BaseButton.fixBottom(
            title: isEdit ? "Update" : "Add",
            onPressed: controller.onUpdate,
          )
        ]));
  }
}
