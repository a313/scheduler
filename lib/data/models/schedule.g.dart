// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Schedule _$$_ScheduleFromJson(Map<String, dynamic> json) => _$_Schedule(
      id: json['id'] as int?,
      name: json['name'] as String,
      begin: const TimeOfDayConverter().fromJson(json['begin'] as String),
      end: const TimeOfDayConverter().fromJson(json['end'] as String),
    );

Map<String, dynamic> _$$_ScheduleToJson(_$_Schedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'begin': const TimeOfDayConverter().toJson(instance.begin),
      'end': const TimeOfDayConverter().toJson(instance.end),
    };
