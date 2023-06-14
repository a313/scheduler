// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Timetable _$$_TimetableFromJson(Map<String, dynamic> json) => _$_Timetable(
      begin: const TimeOfDayConverter().fromJson(json['begin'] as String),
      end: const TimeOfDayConverter().fromJson(json['end'] as String),
      dayInWeek: json['dayInWeek'] as int,
    );

Map<String, dynamic> _$$_TimetableToJson(_$_Timetable instance) =>
    <String, dynamic>{
      'begin': const TimeOfDayConverter().toJson(instance.begin),
      'end': const TimeOfDayConverter().toJson(instance.end),
      'dayInWeek': instance.dayInWeek,
    };
