// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reminder _$ReminderFromJson(Map<String, dynamic> json) => _Reminder(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      createDate: const DateTimeConverter()
          .fromJson((json['createDate'] as num).toInt()),
      remindDate: const DateTimeConverter()
          .fromJson((json['remindDate'] as num).toInt()),
      alert: $enumDecode(_$AlertTypeEnumMap, json['alert']),
      repeat: $enumDecode(_$RepeatTypeEnumMap, json['repeat']),
      interval: (json['interval'] as num?)?.toInt() ?? 1,
      time: _$JsonConverterFromJson<String, TimeOfDay>(
          json['time'], const TimeOfDayConverter().fromJson),
      softIndex: (json['softIndex'] as num?)?.toInt() ?? -1,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ReminderToJson(_Reminder instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createDate': const DateTimeConverter().toJson(instance.createDate),
      'remindDate': const DateTimeConverter().toJson(instance.remindDate),
      'alert': _$AlertTypeEnumMap[instance.alert]!,
      'repeat': _$RepeatTypeEnumMap[instance.repeat]!,
      'interval': instance.interval,
      'time': _$JsonConverterToJson<String, TimeOfDay>(
          instance.time, const TimeOfDayConverter().toJson),
      'softIndex': instance.softIndex,
      'image': instance.image,
    };

const _$AlertTypeEnumMap = {
  AlertType.None: 'None',
  AlertType.AtTime: 'AtTime',
  AlertType.Before5Min: 'Before5Min',
  AlertType.Before15Min: 'Before15Min',
  AlertType.Before30Min: 'Before30Min',
  AlertType.Before1Hour: 'Before1Hour',
  AlertType.Before2Hour: 'Before2Hour',
  AlertType.Before1Day: 'Before1Day',
  AlertType.Before1Week: 'Before1Week',
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
