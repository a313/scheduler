import 'package:flutter/material.dart';

import '../../../core/utils/util.dart';
import '../../../data/models/weatherbit.dart';
import '../../../widgets/custom_divider.dart';
import 'forecast_cell.dart';

class ForecastTable extends StatelessWidget {
  const ForecastTable({
    super.key,
    required this.summary,
    required this.data,
    required this.lowest,
    required this.heightest,
  });

  final Forecast summary;
  final WeatherInfo data;
  final num lowest;
  final num heightest;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padAll12,
      padding: padAll12,
      decoration:
          BoxDecoration(borderRadius: borRad08, color: context.neutral200),
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
            num? current;
            if (index == 0) {
              current = data.temp;
            }
            return ForecastCell(
              info: info,
              lowestTemp: lowest,
              highestTemp: heightest,
              current: current,
            );
          })
            ..addSeparated(
              separated: (index) => const CustomDivider(),
            )
        ],
      ),
    );
  }
}
