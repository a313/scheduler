// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Timetable _$$_TimetableFromJson(Map<String, dynamic> json) => _$_Timetable(
      id: json['id'] as int?,
      classId: json['classId'] as int?,
      begin: const TimeOfDayConverter().fromJson(json['begin'] as String),
      end: const TimeOfDayConverter().fromJson(json['end'] as String),
      dayInWeek: json['dayInWeek'] as int,
    );

Map<String, dynamic> _$$_TimetableToJson(_$_Timetable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'classId': instance.classId,
      'begin': const TimeOfDayConverter().toJson(instance.begin),
      'end': const TimeOfDayConverter().toJson(instance.end),
      'dayInWeek': instance.dayInWeek,
    };
