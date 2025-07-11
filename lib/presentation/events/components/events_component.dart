import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/weatherbit.dart';
import 'package:aio/presentation/events/components/event_header.dart';
import 'package:aio/presentation/events/components/event_item.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:aio/widgets/custom_divider.dart';

import '../../../data/models/event.dart';

class EventsComponent extends StatelessWidget {
  const EventsComponent({
    super.key,
    required this.time,
    required this.data,
    this.onTapped,
    this.onTappedEdit,
    required this.weather,
  });
  final DateTime time;
  final List<Event> data;
  final WeatherInfo? weather;
  final Function(Event event)? onTapped;
  final Function(Event event)? onTappedEdit;

  @override
  Widget build(BuildContext context) {
    final length = data.length;
    if (length == 0) {
      return SliverStickyHeader.builder(
        controller: StickyHeaderController(),
        builder: (context, state) => EventHeader(time: time, weather: weather),
        sliver: SliverToBoxAdapter(
          child: Padding(
            padding: padSymHor14Ver08,
            child: Text(
              'No events'.tr,
              style: AppFonts.bSmall.copyWith(color: context.neutral800),
            ),
          ),
        ),
      );
    } else {
      return SliverStickyHeader.builder(
        builder: (context, state) => EventHeader(time: time),
        sliver: SliverList.separated(
          itemCount: length,
          itemBuilder: (context, index) => EventItem(
            time: time,
            data: data[index],
            onTapped: onTapped,
            onTappedEdit: onTappedEdit,
          ),
          separatorBuilder: (context, index) => const CustomDivider(),
        ),
      );
    }
  }
}
