import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/schedule.dart';
import 'package:aio/presentation/class_room/edit_timetable/edit_timetable_controller.dart';
import 'package:aio/presentation/schedules/components/selectable_schedule_item.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:aio/widgets/base/base_button.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';
import 'package:aio/widgets/base/base_select_field.dart';
import 'package:aio/widgets/shimmer/shimmer_table.dart';

import 'components/select_day_of_week.dart';

class EditTimetablePage extends GetView<EditTimetableController> {
  const EditTimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isEdit = controller.initData != null;
    return BaseScaffoldAppBar(
        title: isEdit ? 'Edit Timetable'.tr : 'Add Timetable'.tr,
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
                            labelText: 'Pick Schedule'.tr,
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
                          Text('Time Range'.tr, style: AppFonts.bLarge),
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
                                Text('to'.tr),
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
            title: isEdit ? 'Update'.tr : 'Add'.tr,
            onPressed: controller.onUpdate,
          )
        ]));
  }
}
