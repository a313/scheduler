import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/weatherbit.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/custom_divider.dart';
import 'package:scheduler/widgets/shimmer/shimmer_list.dart';

import 'weather_controller.dart';

class WeatherPage extends GetView<WeatherController> {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Weather'.tr,
      body: GetBuilder<WeatherController>(
        builder: (controller) {
          final data = controller.currentWeather?.data?.first;
          final summary = controller.summary;
          if (data == null || summary == null) return const ShimmerListWidget();
          return SingleChildScrollView(
            child: Column(
              children: [
                sizedBoxH16,
                Text(
                  data.cityName ?? EMPTY_FIELD,
                  style: AppFonts.bLarge,
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
                Container(
                  margin: padAll12,
                  padding: padAll12,
                  decoration: BoxDecoration(
                      borderRadius: borRad08, color: context.neutral200),
                  child: Column(
                    children: [
                      Padding(
                        padding: padSymHor12,
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month, size: 16),
                            sizedBoxW04,
                            Text('${summary.data?.length}- DAY FORECAST'),
                          ],
                        ),
                      ),
                      sizedBoxH06,
                      const CustomDivider(),
                      ...List.generate(summary.data!.length, (index) {
                        final info = summary.data![index];

                        return ForecastCell(
                          info: info,
                          lowestTemp: 5,
                          highestTemp: 40,
                        );
                      })
                        ..addSeparated(
                          separated: (index) => const CustomDivider(),
                        )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ForecastCell extends StatelessWidget {
  const ForecastCell({
    super.key,
    required this.info,
    required this.lowestTemp,
    required this.highestTemp,
  });

  final WeatherInfo info;
  final num lowestTemp;
  final num highestTemp;

  @override
  Widget build(BuildContext context) {
    final date = info.date;
    final dateStr = date.isToday() ? 'Today'.tr : date.weekday.getDayOfWeek;
    return Row(
      children: [
        Expanded(child: Text(dateStr)),
        Expanded(
            child: Image.asset(
          Utils.getPath(info.weather?.icon),
          height: 26,
        )),
        Expanded(
            flex: 4,
            child: TempProgressBar(
              minTemp: info.minTemp ?? 0,
              maxTemp: info.maxTemp ?? 0,
              lowestTemp: lowestTemp,
              highestTemp: highestTemp,
            ))
      ],
    );
  }
}

class TempProgressBar extends StatelessWidget {
  const TempProgressBar({
    super.key,
    required this.minTemp,
    required this.maxTemp,
    required this.lowestTemp,
    required this.highestTemp,
    this.currentTemp,
  });

  final num minTemp;
  final num maxTemp;
  final num lowestTemp;
  final num highestTemp;
  final num? currentTemp;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${minTemp.toStringAsFixed(0)}$CELSIUS',
          style: AppFonts.bMedium.copyWith(color: context.neutral800),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              width: double.infinity,
              height: 8,
              margin: padSymHor06,
              decoration: BoxDecoration(
                  borderRadius: borRad16, color: context.neutral400),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: borRad16,
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          minTemp.celsiusToColor(),
                          maxTemp.celsiusToColor(),
                        ],
                      ))),
            ),
          ),
        ),
        Text(
          '${maxTemp.toStringAsFixed(0)}$CELSIUS',
          style: AppFonts.bMedium,
        )
      ],
    );
  }
}
