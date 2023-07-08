import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_state_widget.dart';

class EventChart extends StatelessWidget {
  const EventChart({
    super.key,
    required this.events,
    this.onTapped,
  });
  final List<Event> events;
  final Function(Event event)? onTapped;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final w = constraints.maxWidth;
      final h = constraints.maxHeight;
      final itemW = w / 7;

      Positioned genPosition(DateTime time, Duration duration, Event parent) {
        var itemH = duration.inSeconds / 86400 * h;
        final y = (time.weekday - 1) * itemW;
        final x = (time.difference(time.beginOfDay()).inSeconds / 86400) * h;
        if (duration.inMinutes < 15) itemH = 36;

        return Positioned(
          top: x,
          left: y,
          width: itemW,
          height: itemH,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onTapped?.call(parent),
            child: _EventItem(parent),
          ),
        );
      }

      List<Positioned> manyDayPos = [];
      final manyDayEvents = events.where(
          (e) => e.startTime.dateWithoutTime() != e.endTime.dateWithoutTime());

      for (var e in manyDayEvents) {
        final days =
            e.endTime.beginOfDay().difference(e.startTime.beginOfDay()).inDays;
        var start = e.startTime;
        for (var i = 0; i <= days; i++) {
          var endOfDay = start.endOfDay();
          if (endOfDay.isAfter(e.endTime)) {
            endOfDay = e.endTime;
          }

          final dur = endOfDay.difference(start);
          manyDayPos.add(genPosition(start, dur, e));
          start = start.beginOfDay().add(const Duration(days: 1));
        }
      }
      final oneEvents = events.where(
          (e) => e.startTime.dateWithoutTime() == e.endTime.dateWithoutTime());
      final oneDayWidget = List.generate(
        oneEvents.length,
        (index) {
          final event = oneEvents.elementAt(index);
          return genPosition(event.startTime, event.duration, event);
        },
      );
      return Stack(children: [
        ...manyDayPos,
        // ...oneDayWidget,
      ]);
    });
  }
}

class _EventItem extends StatelessWidget {
  const _EventItem(
    this.event,
  );

  final Event event;

  @override
  Widget build(BuildContext context) {
    final color = getColor(context, getState(event));
    final minDif = event.duration.inMinutes;
    return Opacity(
      opacity: event.isActive ? 1 : 0.2,
      child: ABWidget(
        isShowA: minDif < 15,
        widgetA: (context) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 4,
                height: 4,
                margin: const EdgeInsets.only(top: 6, left: 2),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: color)),
            sizedBoxW04,
            Expanded(
              child: Text(
                event.name * 10,
                maxLines: 2,
                style: AppFonts.bSuperSmall,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        widgetB: (context) => DottedBorder(
          color: color,
          radius: const Radius.circular(4),
          padding: padZero,
          borderType: BorderType.RRect,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: borRad02,
                color: event.name.nameToColor().withOpacity(0.2)),
            padding: const EdgeInsets.all(4),
            child: Text(
              event.name,
              maxLines: 3,
              style: AppFonts.bSuperSmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }

  int getState(Event event) {
    final now = DateTime.now();
    if (now.isAfter(event.endTime)) return -1;
    if (now.isBetween(event.startTime, event.endTime)) return 0;
    if (now.isBefore(event.startTime)) return 1;
    return -1;
  }

  Color getColor(BuildContext context, int state) {
    switch (state) {
      case -1:
        return context.disableColor;
      case 0:
        return context.primaryDark;
      default:
        return context.funcCornflowerBlue;
    }
  }
}
