import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';

import '../../core/utils/util.dart';
import 'components/background.dart';
import 'components/event_chart.dart';
import 'components/header.dart';
import 'timetables_controller.dart';

class TimetablesPage extends GetView<TimetablesController> {
  const TimetablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.autoScroll();
    return BaseScaffoldAppBar(
        titleWidget:
            Text(controller.currentTime.value.toStringFormat('LLLL yyyy')),
        centerTitle: false,
        fab: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: _Button(
                onPressed: controller.prevWeek,
                backgroundColor: context.primaryDark,
                child: const Icon(Icons.keyboard_arrow_left),
              ),
            ),
            sizedBoxW02,
            SizedBox(
              height: 30,
              child: _Button(
                  onPressed: controller.curWeek,
                  backgroundColor: context.primaryDark,
                  child: Text(
                    'Today'.tr,
                    style: AppFonts.h300,
                  ).paddingSymmetric(horizontal: 4)),
            ),
            sizedBoxW02,
            SizedBox(
              width: 30,
              height: 30,
              child: _Button(
                onPressed: controller.nextWeek,
                backgroundColor: context.primaryDark,
                child: const Icon(Icons.keyboard_arrow_right),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Obx(() => Header(time: controller.currentTime.value)),
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

class _Button extends StatelessWidget {
  const _Button(
      {required this.child,
      required this.onPressed,
      required this.backgroundColor});
  final Widget child;
  final void Function() onPressed;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.all(2),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
