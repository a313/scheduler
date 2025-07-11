import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/presentation/schedules/components/swipe_schedule_cell.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';
import 'package:aio/widgets/custom_divider.dart';

import 'schedules_controller.dart';

class SchedulesPage extends GetView<SchedulesController> {
  const SchedulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar(
        title: 'Schedules'.tr,
        fab: FloatingActionButton(
          heroTag: runtimeType,
          onPressed: controller.addSchedule,
          backgroundColor: context.primaryDark,
          child: Icon(
            Icons.add,
            color: context.neutral100,
          ),
        ),
        body: GetBuilder<SchedulesController>(
          builder: (controller) {
            final data = controller.data;
            if (data.isEmpty) {
              return Center(
                child: Text('Not exist schedule'.tr),
              );
            }
            return ListView.separated(
              itemCount: data.length,
              separatorBuilder: (_, __) => const CustomDivider(),
              itemBuilder: (context, index) {
                final schedule = data[index];
                return SwipeScheduleCell(
                  data: schedule,
                  actions: [
                    SwipeAction(
                        title: 'Delete'.tr,
                        onTap: (b) => controller.deleteSchedule(data[index], b))
                  ],
                  onTapped: controller.onTappedSchedule,
                );
              },
            );
          },
        ));
  }
}
