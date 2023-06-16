import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarComponent extends StatefulWidget {
  const CalendarComponent({
    super.key,
    required this.focusedDay,
    required this.onDaySelected,
  });
  final DateTime focusedDay;

  final Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;

  @override
  State<CalendarComponent> createState() => _CalendarComponentState();
}

class _CalendarComponentState extends State<CalendarComponent> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    final currentDay = DateTime.now();
    final firstDay = DateTime(currentDay.year - 1);
    final lastDay = DateTime(currentDay.year + 1, 12, 31);
    return Column(
      children: [
        TableCalendar(
          focusedDay: widget.focusedDay,
          firstDay: firstDay,
          lastDay: lastDay,
          calendarFormat: _calendarFormat,
          currentDay: DateTime.now(),
          selectedDayPredicate: (day) => isSameDay(widget.focusedDay, day),
          onDaySelected: widget.onDaySelected,
          availableCalendarFormats: const {
            CalendarFormat.month: '',
            CalendarFormat.week: '',
          },
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            leftChevronVisible: false,
            rightChevronVisible: false,
            titleTextStyle: AppFonts.h500,
            headerMargin: padAll12,
          ),
          calendarStyle: CalendarStyle(
              defaultTextStyle: AppFonts.bSmall,
              selectedTextStyle:
                  AppFonts.bSmall.copyWith(color: context.neutral100),
              selectedDecoration: BoxDecoration(
                  color: context.primaryDark, shape: BoxShape.circle),
              todayTextStyle: AppFonts.bSmall,
              todayDecoration: BoxDecoration(
                  color: context.neutral300, shape: BoxShape.circle)),
        ).debugColor(color: context.neutral100),
        GestureDetector(
            onTap: changeCalenderFormat,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: context.neutral100,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Icon(_calendarFormat == CalendarFormat.week
                  ? Icons.arrow_drop_down
                  : Icons.arrow_drop_up),
            )),
      ],
    );
  }

  String getStringByIndex(int index) {
    switch (index) {
      case 0:
        return "Mo";
      case 1:
        return "Tu";
      case 2:
        return "We";
      case 3:
        return "Th";
      case 4:
        return "Fr";
      case 5:
        return "Sa";
      case 6:
        return "Su";

      default:
        return "|";
    }
  }

  void changeCalenderFormat() {
    setState(() {
      _calendarFormat = _calendarFormat == CalendarFormat.month
          ? CalendarFormat.week
          : CalendarFormat.month;
    });
  }
}
