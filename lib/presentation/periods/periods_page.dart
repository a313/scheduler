import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/painter/clock_time_painter.dart';

import '../../widgets/painter/clock_background_painter.dart';
import 'periods_controller.dart';

class PeriodsPage extends GetView<PeriodsController> {
  const PeriodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Periods'.tr,
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: ClockBackgroundPainter(context),
              foregroundPainter: ClockTimePainter(context),
              // child: CustomPaint(
              //   painter: ClockPainter(),
              // ),
            ),
          ),
        ));
  }
}
