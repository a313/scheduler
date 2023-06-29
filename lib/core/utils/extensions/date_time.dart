import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/date_format.dart';

extension DateExtension on DateTime {
  String toStringFormat(String format) {
    return DateFormat(format).format(toLocal());
  }

  DateTime dateWithoutSecond() {
    return DateTime(year, month, day, hour, minute);
  }

  DateTime dateWithoutTime() {
    return DateTime(year, month, day);
  }

  DateTime dateWithoutMinute() {
    return DateTime(year, month, day, hour);
  }

  DateTime dateWithoutDay() {
    return DateTime(year, month);
  }

  /// 13:00 ngày 21
  String toEdString() {
    return "${DateFormat("HH:mm").format(this)} ngày ${DateFormat("dd").format(this)}";
  }

  String toTimeDateString() {
    return DateFormat(DateFormater.hhmmDDMMYYYY).format(this);
  }

  bool isBetween(DateTime start, DateTime end) {
    final after = isAfter(start);
    final befor = isBefore(end.add(const Duration(seconds: 1)));
    return after && befor;
  }

  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool isTomorrow() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day + 1;
  }

  bool isYesterday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day - 1;
  }

  String getPassedTime() {
    final now = DateTime.now().dateWithoutTime();
    var result = '';
    final y = now.year - year;
    final m = now.month - month;
    final d = now.day - day;
    if (y > 0) {
      result += "$y years ";
    }
    if (m > 0) {
      result += "$m months ";
    }
    if (d > 0) {
      result += "$d days";
    }

    if (result.isEmpty) return "Just created";
    return result;
  }

  DateTime getStartOfWeek() {
    final difference = weekday - DateTime.monday;
    final startOfWeek = subtract(Duration(days: difference));
    return startOfWeek;
  }

  DateTime getEndOfWeek() {
    final difference = DateTime.sunday - weekday;
    final endOfWeek = add(Duration(days: difference));
    return endOfWeek;
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

  bool isAfter(TimeOfDay obj) {
    if (hour < obj.hour) return true;
    if (hour == obj.hour && minute <= obj.minute) return true;
    return false;
  }

  bool isBefore(TimeOfDay obj) {
    if (hour > obj.hour) return true;
    if (hour == obj.hour && minute >= obj.minute) return true;
    return false;
  }
}
