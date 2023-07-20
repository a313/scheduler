import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';

import '../../../data/models/weatherbit.dart';
import '../../../theme/app_fonts.dart';

class ForecastCell extends StatelessWidget {
  const ForecastCell({
    super.key,
    required this.info,
    required this.lowestTemp,
    required this.highestTemp,
    this.current,
  });

  final WeatherInfo info;
  final num lowestTemp;
  final num highestTemp;
  final num? current;

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
              currentTemp: current,
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
            builder: (context, constraints) {
              final mW = constraints.maxWidth;
              final rate = mW / (highestTemp - lowestTemp);
              final pL = (minTemp - lowestTemp) * rate;
              final pR = (highestTemp - maxTemp) * rate;
              return Container(
                width: double.infinity,
                height: 8,
                margin: padSymHor06,
                decoration: BoxDecoration(
                    borderRadius: borRad16, color: context.neutral400),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: pL, right: pR),
                      decoration: BoxDecoration(
                        borderRadius: borRad16,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            minTemp.celsiusToColor(),
                            maxTemp.celsiusToColor(),
                          ],
                        ),
                      ),
                    ),
                    if (currentTemp != null)
                      Container(
                        margin: EdgeInsets.only(
                            left: (currentTemp! - lowestTemp) * rate),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.neutral100,
                            border: Border.all(
                                color: context.funcRadicalRed, width: 1)),
                      )
                  ],
                ),
              );
            },
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
