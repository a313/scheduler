import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/weatherbit.dart';
import 'package:scheduler/theme/app_fonts.dart';

class EventHeader extends StatelessWidget {
  const EventHeader({super.key, required this.time, this.weather});
  final DateTime time;
  final Datum? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: context.neutral300,
        border: Border(
          bottom: BorderSide(
            color: context.neutral400,
            width: .5,
          ),
        ),
      ),
      child: Row(
        children: [
          sizedBoxW14,
          _Prefix(time: time),
          Expanded(child: Text(time.toStringFormat(DateFormater.EEEEddMMyyyy))),
          _WeatherWidget(weather)
        ],
      ),
    );
  }
}

class _WeatherWidget extends StatelessWidget {
  const _WeatherWidget(this.data);
  final Datum? data;
  @override
  Widget build(BuildContext context) {
    if (data == null || data?.weather == null) return const SizedBox();

    return Row(
      children: [
        Image.asset(
          getPath(data!.weather!.icon),
          height: 20,
        ),
        sizedBoxW04,
        Text(
            '${data!.maxTemp?.round() ?? '-'}°/${data!.minTemp?.round() ?? '-'}°')
      ],
    ).paddingOnly(right: 12);
  }

  String getPath(String? icon) {
    switch (icon) {
      case 't01d':
      case 't02d':
      case 't03d':
        return 'assets/png/weather/80030_tstorm_partly_cloudy_small.png';
      case 't01n':
      case 't02n':
      case 't03n':
        return 'assets/png/weather/80011_tstorm_mostly_clear_small.png';
      case 't04d':
      case 't05d':
        return 'assets/png/weather/80000_tstorm_small.png';
      case 't04n':
      case 't05n':
        return 'assets/png/weather/80021_tstorm_mostly_cloudy_small.png';
      case 'd01d':
      case 'd02d':
      case 'd03d':
        return 'assets/png/weather/40000_drizzle_small.png';
      case 'd01n':
      case 'd02n':
      case 'd03n':
        return 'assets/png/weather/42041_drizzle_partly_cloudy_small.png';
      case 'r01d':
        return 'assets/png/weather/80030_tstorm_partly_cloudy_small.png';
      case 'r01n':
        return 'assets/png/weather/42131_rain_light_mostly_clear_small.png';
      case 'r02d':
        return 'assets/png/weather/40010_rain_small.png';
      case 'r02n':
        return 'assets/png/weather/42081_rain_partly_cloudy_small.png';
      case 'r03d':
        return 'assets/png/weather/42111_rain_heavy_mostly_clear_small.png';
      case 'r03n':
        return 'assets/png/weather/80011_tstorm_mostly_clear_small.png';
      case 'f01d':
        return 'assets/png/weather/62010_freezing_rain_heavy_small.png';
      case 'f01n':
        return 'assets/png/weather/62021_freezing_rain_heavy_partly_cloudy_small.png';
      case 'r04d':
      case 'r05d':
      case 'r06d':
        return 'assets/png/weather/62020_freezing_rain_heavy_partly_cloudy_small.png';
      case 'r04n':
      case 'r05n':
      case 'r06n':
        return 'assets/png/weather/62020_freezing_rain_heavy_partly_cloudy_small.png';
      case 's01d':
        return 'assets/png/weather/51000_snow_light_small.png';
      case 's01n':
        return 'assets/png/weather/51021_snow_light_mostly_clear_small.png';
      case 's02d':
        return 'assets/png/weather/50000_snow_small.png';
      case 's02n':
        return 'assets/png/weather/51051_snow_mostly_clear_small.png';
      case 's03d':
        return 'assets/png/weather/51010_snow_heavy_small.png';
      case 's03n':
        return 'assets/png/weather/51191_snow_heavy_mostly_clear_small.png';
      case 's04d':
      case 's05d':
      case 's06d':
        return 'assets/png/weather/51050_snow_mostly_clear_small.png';
      case 's04n':
      case 's05n':
      case 's06n':
        return 'assets/png/weather/51051_snow_mostly_clear_small.png';
      case 'a01d':
      case 'a02d':
      case 'a03d':
      case 'a04d':
        return 'assets/png/weather/11020_mostly_cloudy_small.png';
      case 'a01n':
      case 'a02n':
      case 'a03n':
      case 'a04n':
        return 'assets/png/weather/11021_mostly_cloudy_small.png';
      case 'a05d':
      case 'a06d':
        return 'assets/png/weather/21060_fog_mostly_clear_small.png';
      case 'a05n':
      case 'a06n':
        return 'assets/png/weather/21061_fog_mostly_clear_small.png';
      case 'c01d':
        return 'assets/png/weather/10000_clear_small.png';
      case 'c01n':
        return 'assets/png/weather/10001_clear_small.png';
      case 'c02d':
        return 'assets/png/weather/11000_mostly_clear_small.png';
      case 'c02n':
        return 'assets/png/weather/11001_mostly_clear_small.png';
      case 'c03d':
        return 'assets/png/weather/11010_partly_cloudy_small.png';
      case 'c03n':
        return 'assets/png/weather/11011_partly_cloudy_small.png';
      case 'c04d':
        return 'assets/png/weather/10010_cloudy_small.png';
      case 'c04n':
        return 'assets/png/weather/10010_cloudy_small.png';
      default:
        return 'assets/png/weather/10000_clear_small.png';
    }
  }
}

class _Prefix extends StatelessWidget {
  const _Prefix({
    required this.time,
  });
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    if (time.isToday()) {
      return Text(
        'Today'.tr,
        style: AppFonts.h300,
      ).paddingOnly(right: 8);
    } else if (time.isTomorrow()) {
      return Text(
        'Tomorrow'.tr,
        style: AppFonts.h300,
      ).paddingOnly(right: 8);
    } else if (time.isYesterday()) {
      return Text(
        'Yesterday'.tr,
        style: AppFonts.h300,
      ).paddingOnly(right: 8);
    }
    return const SizedBox();
  }
}
