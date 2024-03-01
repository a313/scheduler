// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimetableImpl _$$TimetableImplFromJson(Map<String, dynamic> json) =>
    _$TimetableImpl(
      begin: const TimeOfDayConverter().fromJson(json['begin'] as String),
      end: const TimeOfDayConverter().fromJson(json['end'] as String),
      dayInWeek: json['dayInWeek'] as int,
    );

Map<String, dynamic> _$$TimetableImplToJson(_$TimetableImpl instance) =>
    <String, dynamic>{
      'begin': const TimeOfDayConverter().toJson(instance.begin),
      'end': const TimeOfDayConverter().toJson(instance.end),
      'dayInWeek': instance.dayInWeek,
    };
