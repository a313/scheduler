import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/shimmer/shimmer_list.dart';

import 'components/forecast_table.dart';
import 'components/weather_table.dart';
import 'weather_controller.dart';

class WeatherPage extends GetView<WeatherController> {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar(
      title: 'Weather'.tr,
      body: GetBuilder<WeatherController>(
        builder: (controller) {
          final data = controller.currentWeather?.data?.first;
          final summary = controller.summary;
          if (data == null || summary == null) {
            return const Padding(
              padding: padAll16,
              child: ShimmerListWidget(),
            );
          }
          num lowest = 999;
          num heightest = -999;
          summary.data?.forEach((element) {
            if (element.maxTemp! >= heightest) {
              heightest = element.maxTemp!;
            }

            if (element.minTemp! <= lowest) {
              lowest = element.minTemp!;
            }
          });
          return SingleChildScrollView(
            child: Column(
              children: [
                sizedBoxH16,
                Text(
                  data.cityName ?? EMPTY_FIELD,
                  style: AppFonts.h600,
                ),
                sizedBoxH12,
                Text(
                  'Update at: ${DateTime.fromMillisecondsSinceEpoch(data.ts!.toInt() * 1000).toStringFormat(DateFormater.ddMMYYYYhhmm)}',
                  style: AppFonts.bSmall.copyWith(color: context.neutral900),
                ),
                sizedBoxH16,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            Utils.getPath(data.weather!.icon!, isSmall: false),
                            height: 70,
                          ),
                          Text(data.weather!.description!),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          sizedBoxH10,
                          Text(
                            data.temp!.toStringAsFixed(1) + CELSIUS,
                            style: AppFonts.h700,
                          ),
                          sizedBoxH16,
                          Text(
                            'H:${summary.data?.first.maxTemp}$CELSIUS - L:${summary.data?.first.minTemp}$CELSIUS',
                            style: AppFonts.h300,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                WeatherTable(data: data),
                ForecastTable(
                    summary: summary,
                    data: data,
                    lowest: lowest,
                    heightest: heightest),
              ],
            ),
          );
        },
      ),
    );
  }
}
