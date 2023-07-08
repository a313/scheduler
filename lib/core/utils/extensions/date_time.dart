import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/date_format.dart';

extension DateExtension on DateTime {
  String toStringFormat(String format) {
    return DateFormat(format, (Get.locale ?? Get.fallbackLocale)!.toString())
        .format(toLocal());
  }

  DateTime dateWithoutSecond() {
    return DateTime(year, month, day, hour, minute);
  }

  DateTime dateWithoutTime() {
    return DateTime(year, month, day);
  }

  DateTime beginOfDay() {
    return DateTime(year, month, day);
  }

  DateTime endOfDay() {
    return DateTime(year, month, day, 23, 59, 59);
  }

  DateTime dateWithoutMinute() {
    return DateTime(year, month, day, hour);
  }

  DateTime dateWithoutDay() {
    return DateTime(year, month);
  }

  /// 13:00 ngày 21
  String toEdString() {
    return '${DateFormat('HH:mm').format(this)} ngày ${DateFormat('dd').format(this)}';
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
    final tmp = subtract(const Duration(days: 1));
    return tmp.isToday();
  }

  bool isYesterday() {
    final tmp = add(const Duration(days: 1));
    return tmp.isToday();
  }

  int get daysInMonth {
    return DateTime(year, month + 1, 1)
        .difference(DateTime(year, month, 1))
        .inDays;
  }

  String getDiffTime(DateTime to) {
    if (dateWithoutTime().isAtSameMomentAs(to.dateWithoutTime())) {
      return 'Just created'.tr;
    }

    var from = this;
    String result;
    int y = 0;
    int m = 0;
    int d = 0;
    if (to.isBefore(from)) {
      final tmp = from;
      from = to;
      to = tmp;
      result = "${'Remain'.tr}: ";
    } else {
      result = "${'Passed'.tr}: ";
    }
    final dInM = from.daysInMonth;
    int mF = from.month;
    int yF = from.year;
    if (to.day < from.day) {
      d = dInM + to.day - from.day;
      mF += 1;
    } else {
      d = to.day - from.day;
    }

    if (to.month < mF) {
      m = 12 + to.month - mF;
      yF += 1;
    } else {
      m = to.month - mF;
    }
    y = to.year - yF;

    if (y > 0) {
      result += '$y ${'years'.tr} ';
    }
    if (m > 0) {
      result += '$m ${'months'.tr} ';
    }
    if (d > 0) {
      result += '$d ${'days'.tr} ';
    }

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
