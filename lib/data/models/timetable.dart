import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/converters.dart';

part 'timetable.freezed.dart';
part 'timetable.g.dart';

@unfreezed
class Timetable with _$Timetable {
  const Timetable._();
  factory Timetable({
    int? id,
    int? classId,
    @TimeOfDayConverter() required TimeOfDay begin,
    @TimeOfDayConverter() required TimeOfDay end,
    required int dayInWeek,
  }) = _Timetable;

  factory Timetable.fromJson(Map<String, Object?> json) =>
      _$TimetableFromJson(json);

  static List<Timetable> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => Timetable.fromJson(e)).toList();

  factory Timetable.init() => Timetable(
      begin: const TimeOfDay(hour: 07, minute: 00),
      end: const TimeOfDay(hour: 09, minute: 00),
      dayInWeek: -1);
}
