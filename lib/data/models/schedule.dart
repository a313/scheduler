import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/converters.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@unfreezed
sealed class Schedule with _$Schedule {
  const Schedule._();
  factory Schedule({
    int? id,
    required String name,
    @TimeOfDayConverter() required TimeOfDay begin,
    @TimeOfDayConverter() required TimeOfDay end,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, Object?> json) =>
      _$ScheduleFromJson(json);

  static List<Schedule> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => Schedule.fromJson(e)).toList();

  static init() => Schedule(
      name: '',
      begin: const TimeOfDay(hour: 9, minute: 30),
      end: const TimeOfDay(hour: 10, minute: 30));

  bool get isValid => begin.isAfter(end);
}
