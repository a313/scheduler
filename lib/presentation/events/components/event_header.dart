import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/weatherbit.dart';
import 'package:aio/theme/app_fonts.dart';

class EventHeader extends StatelessWidget {
  const EventHeader({super.key, required this.time, this.weather});
  final DateTime time;
  final WeatherInfo? weather;

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
  final WeatherInfo? data;
  @override
  Widget build(BuildContext context) {
    if (data == null || data?.weather == null) return const SizedBox();

    return Row(
      children: [
        Image.asset(
          Utils.getPath(data!.weather!.icon),
          height: 20,
        ),
        sizedBoxW04,
        Text(
            '${data!.maxTemp?.round() ?? '-'}°/${data!.minTemp?.round() ?? '-'}°')
      ],
    ).paddingOnly(right: 12);
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
        '${'Today'.tr},',
        style: AppFonts.h300,
      ).paddingOnly(right: 8);
    } else if (time.isTomorrow()) {
      return Text(
        '${'Tomorrow'.tr},',
        style: AppFonts.h300,
      ).paddingOnly(right: 8);
    } else if (time.isYesterday()) {
      return Text(
        '${'Yesterday'.tr},',
        style: AppFonts.h300,
      ).paddingOnly(right: 8);
    }
    return const SizedBox();
  }
}
