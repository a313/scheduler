import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/custom_divider.dart';

import 'schedules_controller.dart';

class SchedulesPage extends GetView<SchedulesController> {
  const SchedulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Schedules',
        body: GetBuilder<SchedulesController>(
          builder: (controller) {
            final data = controller.data;
            if (data.isEmpty) {
              return const Center(
                child: Text('Not exist schedule'),
              );
            }
            return ListView.separated(
              itemCount: data.length,
              separatorBuilder: (_, __) => const CustomDivider(),
              itemBuilder: (context, index) {
                final schedule = data[index];
                return ListTile(
                  title: Text(schedule.name),
                );
              },
            );
          },
        ));
  }
}
