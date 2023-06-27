import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduler/core/utils/util.dart';

import '../../core/converters.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

@unfreezed
class Reminder with _$Reminder {
  const Reminder._();

  factory Reminder(
      {int? id,
      required String name,
      @DateTimeConverter() required DateTime createDate,
      @DateTimeConverter() required DateTime remindDate,
      required AlertType alert,
      required RepeatType repeat,
      @Default(1) int interval,
      @TimeOfDayConverter() TimeOfDay? time,
      @Default(-1) int softIndex,
      String? image}) = _Reminder;

  factory Reminder.fromJson(Map<String, Object?> json) =>
      _$ReminderFromJson(json);

  static List<Reminder> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => Reminder.fromJson(e)).toList();

  static Reminder init() => Reminder(
        name: '',
        createDate: DateTime.now().dateWithoutTime(),
        remindDate: DateTime.now().dateWithoutTime(),
        softIndex: -1,
        interval: 1,
        time: TimeOfDay.now(),
        repeat: RepeatType.None,
        alert: AlertType.None,
      );

  bool isUnequalRepeatTime(Reminder reminder) {
    return repeat != reminder.repeat ||
        interval != reminder.interval ||
        time != reminder.time ||
        alert != reminder.alert;
  }
}
