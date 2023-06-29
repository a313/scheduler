import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/reminder/components/swipe_reminder_cell.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/custom_divider.dart';
import 'package:scheduler/widgets/shimmer/shimmer_list.dart';

import 'reminder_controller.dart';

class ReminderPage extends GetView<ReminderController> {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      fab: FloatingActionButton(
        onPressed: controller.addReminder,
        backgroundColor: context.primaryDark,
        child: Icon(
          Icons.add,
          color: context.neutral100,
        ),
      ),
      actions: [
        TextButton(
          onPressed: controller.onTappedFilter,
          child: Text(
            'Filter'.tr,
            style: AppFonts.bSmall,
          ),
        )
      ],
      title: 'Reminders'.tr,
      body: controller.obx(
        (state) => ListView.separated(
            itemCount: state!.length,
            separatorBuilder: (context, index) => const CustomDivider(),
            itemBuilder: (context, index) {
              return SwipeReminderCell(
                data: state[index],
                actions: [
                  SwipeAction(
                      title: 'Delete'.tr,
                      onTap: (b) => controller.deleteReminder(state[index], b))
                ],
                onTapped: controller.onTappedReminder,
              );
            }),
        onLoading: const Padding(padding: padAll16, child: ShimmerListWidget()),
        onEmpty: Center(
          child: Text('Not exist reminder'.tr),
        ),
      ),
    );
  }
}
