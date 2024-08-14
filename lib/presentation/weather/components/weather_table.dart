import 'package:flutter/material.dart';
import 'package:aio/widgets/custom_divider.dart';

import '../../../core/utils/util.dart';
import '../../../data/models/weatherbit.dart';
import '../../../widgets/table/custom_cell.dart';

class WeatherTable extends StatelessWidget {
  const WeatherTable({
    super.key,
    required this.data,
  });

  final WeatherInfo data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padAll12,
      padding: padAll12,
      decoration:
          BoxDecoration(borderRadius: borRad08, color: context.neutral200),
      child: Column(
        children: [
          CustomCell(
            title: "UV Index",
            content: '${data.uv}',
          ),
          CustomCell(
            title: "Sunrise time",
            content: data.sunriseTime.toLocal().toStringFormat('HH:mm'),
          ),
          CustomCell(
            title: "Sunset time ",
            content: data.sunsetTime.toLocal().toStringFormat('HH:mm'),
          ),
          CustomCell(
            title: "Feels Like",
            content: '${data.appTemp}$CELSIUS',
          ),
          CustomCell(
            title: 'Humidity',
            content: '${data.rh}%',
          ),
          CustomCell(
            title: 'Dew point',
            content: '${data.dewpt}$C_SHORT',
          ),
          CustomCell(
            title: 'Cloud coverage',
            content: '${data.clouds}%',
          ),
          CustomCell(
            title: 'Wind speed',
            content: '${data.windSpd} m/s',
          ),
          CustomCell(
            title: 'Air Quality Index',
            content: '${data.aqi}',
          ),
          CustomCell(
            title: 'Visibility',
            content: '${data.vis} km',
          ),
          CustomCell(
            title: 'Pressure',
            content: '${data.pres} mb',
          ),
        ]..addSeparated(
            separated: (index) => const Padding(
              padding: padSymVer04,
              child: CustomDivider(),
            ),
          ),
      ),
    );
  }
}
