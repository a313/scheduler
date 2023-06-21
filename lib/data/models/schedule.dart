import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/converters.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@unfreezed
class Schedule with _$Schedule {
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
}
