import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/reminder/components/reminder_item.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/custom_divider.dart';
import 'package:scheduler/widgets/custom_refresher.dart';
import 'package:scheduler/widgets/shimmer/shimmer_list.dart';

import 'reminder_controller.dart';

class ReminderPage extends GetView<ReminderController> {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      fab: FloatingActionButton(
        mini: true,
        onPressed: controller.addReminder,
        backgroundColor: context.funcBitterLemon,
        child: Icon(
          Icons.add,
          color: context.neutral100,
        ),
      ),
      actions: [
        TextButton(
          onPressed: controller.onTappedFilter,
          child: const Text(
            'Bộ lọc',
            style: AppFonts.bSmall,
          ),
        )
      ],
      title: 'Lời nhắc',
      body: controller.obx(
        (state) => CustomRefresher(
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          controller: controller.refreshController,
          child: ListView.separated(
              itemCount: state!.length,
              separatorBuilder: (context, index) => const CustomDivider(),
              itemBuilder: (context, index) {
                return ReminderItem(
                  data: state[index],
                  onEdit: controller.onEditReminder,
                  onTapped: controller.onTappedReminder,
                );
              }),
        ),
        onLoading: const Padding(padding: padAll16, child: ShimmerListWidget()),
        onEmpty: CustomRefresher(
          onRefresh: controller.onRefresh,
          onLoading: controller.onRefresh,
          controller: controller.emptyController,
          child: const Center(
            child: Text("Không có lời nhắc nào"),
          ),
        ),
      ),
    );
  }
}
