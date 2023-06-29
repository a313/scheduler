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
        title: 'Timetable'.tr,
        fab: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: controller.prevWeek,
              mini: true,
              backgroundColor: context.funcIcterine,
              child: Icon(
                Icons.keyboard_arrow_left,
                color: context.neutral100,
              ),
            ),
            FloatingActionButton(
              onPressed: controller.curWeek,
              mini: true,
              backgroundColor: context.primaryDark,
              child: Icon(
                Icons.find_replace,
                color: context.neutral100,
              ),
            ),
            FloatingActionButton(
              onPressed: controller.nextWeek,
              mini: true,
              backgroundColor: context.funcCornflowerBlue,
              child: Icon(
                Icons.keyboard_arrow_right,
                color: context.neutral100,
              ),
            ),
          ],
        ),
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
                              (state) => EventChart(
                                    events: state!,
                                    onTapped: controller.onTappedEvent,
                                  ),
                              onLoading: const SizedBox(),
                              onEmpty: Center(child: Text('No data'.tr)))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
