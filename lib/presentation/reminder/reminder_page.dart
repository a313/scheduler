import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/presentation/reminder/components/swipe_reminder_cell.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';
import 'package:aio/widgets/custom_divider.dart';
import 'package:aio/widgets/shimmer/shimmer_list.dart';

import 'reminder_controller.dart';

class ReminderPage extends GetView<ReminderController> {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar(
      fab: FloatingActionButton(
        heroTag: runtimeType,
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
