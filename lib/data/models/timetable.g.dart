// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Timetable _$TimetableFromJson(Map<String, dynamic> json) => _Timetable(
  begin: const TimeOfDayConverter().fromJson(json['begin'] as String),
  end: const TimeOfDayConverter().fromJson(json['end'] as String),
  dayInWeek: (json['dayInWeek'] as num).toInt(),
);

Map<String, dynamic> _$TimetableToJson(_Timetable instance) =>
    <String, dynamic>{
      'begin': const TimeOfDayConverter().toJson(instance.begin),
      'end': const TimeOfDayConverter().toJson(instance.end),
      'dayInWeek': instance.dayInWeek,
    };
