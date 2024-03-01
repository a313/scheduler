// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleImpl _$$ScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleImpl(
      id: json['id'] as int?,
      name: json['name'] as String,
      begin: const TimeOfDayConverter().fromJson(json['begin'] as String),
      end: const TimeOfDayConverter().fromJson(json['end'] as String),
    );

Map<String, dynamic> _$$ScheduleImplToJson(_$ScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'begin': const TimeOfDayConverter().toJson(instance.begin),
      'end': const TimeOfDayConverter().toJson(instance.end),
    };
