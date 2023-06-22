// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reminder _$$_ReminderFromJson(Map<String, dynamic> json) => _$_Reminder(
      id: json['id'] as int?,
      name: json['name'] as String,
      createDate: const DateTimeConverter().fromJson(json['createDate'] as int),
      remindDate: const DateTimeConverter().fromJson(json['remindDate'] as int),
      repeat: $enumDecode(_$RepeatTypeEnumMap, json['repeat']),
      interval: json['interval'] as int? ?? 1,
      alertTime: _$JsonConverterFromJson<String, TimeOfDay>(
          json['alertTime'], const TimeOfDayConverter().fromJson),
      softIndex: json['softIndex'] as int? ?? -1,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_ReminderToJson(_$_Reminder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createDate': const DateTimeConverter().toJson(instance.createDate),
      'remindDate': const DateTimeConverter().toJson(instance.remindDate),
      'repeat': _$RepeatTypeEnumMap[instance.repeat]!,
      'interval': instance.interval,
      'alertTime': _$JsonConverterToJson<String, TimeOfDay>(
          instance.alertTime, const TimeOfDayConverter().toJson),
      'softIndex': instance.softIndex,
      'image': instance.image,
    };

const _$RepeatTypeEnumMap = {
  RepeatType.None: 'None',
  RepeatType.Daily: 'Daily',
  RepeatType.Weekly: 'Weekly',
  RepeatType.Monthly: 'Monthly',
  RepeatType.Yearly: 'Yearly',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
