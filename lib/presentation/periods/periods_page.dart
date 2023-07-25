import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/painter/clock_time_painter.dart';

import '../../widgets/painter/periods_background_painter.dart';
import 'periods_controller.dart';

class PeriodsPage extends GetView<PeriodsController> {
  const PeriodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = min(context.width, context.height) * 0.9;
    return BaseScafoldAppBar(
        title: 'Periods'.tr,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16, width: double.infinity),
            SizedBox(
              width: size,
              height: size,
              child: CustomPaint(
                painter: PeriodsBackgroundPainter(context: context, period: 28),
              ),
            ),
          ],
        ));
  }
}

//
class TimeComponent extends StatefulWidget {
  const TimeComponent({
    super.key,
  });

  @override
  State<TimeComponent> createState() => _TimeComponentState();
}

class _TimeComponentState extends State<TimeComponent> {
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ClockTimePainter(context: context, time: DateTime.now()),
    );
  }
}
