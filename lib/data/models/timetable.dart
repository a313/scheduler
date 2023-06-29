import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduler/core/utils/util.dart';

import '../../core/converters.dart';

part 'timetable.freezed.dart';
part 'timetable.g.dart';

@unfreezed
class Timetable with _$Timetable {
  const Timetable._();
  factory Timetable({
    @TimeOfDayConverter() required TimeOfDay begin,
    @TimeOfDayConverter() required TimeOfDay end,
    required int dayInWeek,
  }) = _Timetable;

  factory Timetable.fromJson(Map<String, Object?> json) =>
      _$TimetableFromJson(json);

  factory Timetable.init() => Timetable(
      begin: const TimeOfDay(hour: 07, minute: 00),
      end: const TimeOfDay(hour: 09, minute: 00),
      dayInWeek: -1);

  bool get isValid => begin.isAfter(end);
}
