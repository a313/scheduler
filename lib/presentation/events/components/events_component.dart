import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/events/components/event_header.dart';
import 'package:scheduler/presentation/events/components/event_item.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/custom_divider.dart';

import '../../../data/models/event.dart';

class EventsComponent extends StatelessWidget {
  const EventsComponent({
    super.key,
    required this.time,
    required this.data,
    this.onTapped,
    this.onTappedEdit,
    // this.headerKey,
  });
  final DateTime time;
  final List<Event> data;
  // final dynamic headerKey;
  final Function(Event event)? onTapped;
  final Function(Event event)? onTappedEdit;

  @override
  Widget build(BuildContext context) {
    final length = data.length;
    if (length == 0) {
      return SliverStickyHeader.builder(
        controller: StickyHeaderController(),
        builder: (context, state) => EventHeader(time: time),
        sliver: SliverToBoxAdapter(
          child: Padding(
            padding: padSymHor14Ver08,
            child: Text(
              'No events',
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
            key: ValueKey(data[index]),
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
