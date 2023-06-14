import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/date_format.dart';

extension DateExtension on DateTime {
  String toStringFormat(String format) {
    return DateFormat(format, "vi").format(toLocal());
  }

  String toUTCFormat() {
    return '${DateFormat(DateFormater.UTC).format(toUtc())}Z';
  }

  DateTime dateWithoutTime() {
    return DateTime.utc(year, month, day);
  }

  DateTime dateWithoutDay() {
    return DateTime.utc(year, month);
  }

  /// 13:00 ngày 21
  String toEdString() {
    return "${DateFormat("HH:mm").format(this)} ngày ${DateFormat("dd").format(this)}";
  }

  String toTimeDateString() {
    return DateFormat(DateFormater.hhmmDDMMYYYY).format(this);
  }

  bool isBetween(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end.add(const Duration(seconds: 1)));
  }
}

extension TimeOfDayExt on TimeOfDay {
  String get formated {
    String addLeadingZeroIfNeeded(int value) {
      if (value < 10) {
        return '0$value';
      }
      return value.toString();
    }

    final String hourLabel = addLeadingZeroIfNeeded(hour);
    final String minuteLabel = addLeadingZeroIfNeeded(minute);

    return '$hourLabel:$minuteLabel';
  }
}
