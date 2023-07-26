import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/clock/clock_controller.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/painter/clock_background_painter.dart';
import 'package:scheduler/widgets/painter/clock_time_painter.dart';
import 'package:scheduler/widgets/painter/events_painter.dart';

class ClockPage extends StatelessWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = min(context.width, context.height) * 0.9;
    return BaseScafoldAppBar(
        title: 'Clock'.tr,
        body: GetBuilder<ClockController>(
          init: ClockController(),
          builder: (_) {
            return Column(
              children: [
                const SizedBox(height: 16, width: double.infinity),
                SizedBox(
                  width: size,
                  height: size,
                  child: CustomPaint(
                    painter: ClockBackgroundPainter(context),
                    child: CustomPaint(
                      painter: EventsPainter(
                        context: context,
                        events: _.events,
                      ),
                      foregroundPainter: ClockTimePainter(
                        context: context,
                        time: _.currentTime,
                      ),
                    ),
                  ),
                ),
                sizedBoxH16,
                Text(
                  _.currentTime.toStringFormat('HH:mm:ss'),
                  style: AppFonts.bLarge,
                )
              ],
            );
          },
        ));
  }
}
