import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/presentation/timetables/components/header.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import '../../core/utils/util.dart';
import 'components/background.dart';
import 'components/event_chart.dart';
import 'timetables_controller.dart';

class TimetablesPage extends GetView<TimetablesController> {
  const TimetablesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.autoScroll();
    return BaseScafoldAppBar(
        title: 'Timetable',
        body: Column(
          children: [
            const Header(),
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: SizedBox(
                  height: R1H * 24 + R1H / 2,
                  child: Stack(
                    children: [
                      const Positioned.fill(child: Background(R1H)),
                      Positioned.fill(
                          top: R1H / 2,
                          left: C1W,
                          child: controller.obx(
                              (state) => EventChart(events: state!),
                              onLoading: const SizedBox(),
                              onEmpty: const Center(child: Text('No data')))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
