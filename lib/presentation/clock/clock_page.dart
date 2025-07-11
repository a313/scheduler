import 'dart:math';

import 'package:aio/core/utils/util.dart';
import 'package:aio/presentation/clock/clock_controller.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';
import 'package:aio/widgets/painter/clock_background_painter.dart';
import 'package:aio/widgets/painter/clock_time_painter.dart';
import 'package:aio/widgets/painter/events_painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClockPage extends StatelessWidget {
  const ClockPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = min(context.width, context.height) * 0.9;
    return BaseScaffoldAppBar(
        title: 'Clock'.tr,
        body: GetBuilder<ClockController>(
          init: ClockController(),
          builder: (controller) {
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
                        events: controller.events,
                      ),
                      foregroundPainter: ClockTimePainter(
                        context: context,
                        time: controller.currentTime,
                      ),
                    ),
                  ),
                ),
                sizedBoxH16,
                Text(
                  controller.currentTime.toStringFormat('HH:mm:ss'),
                  style: AppFonts.bLarge,
                )
              ],
            );
          },
        ));
  }
}
