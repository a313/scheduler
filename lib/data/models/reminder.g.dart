// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reminder _$$_ReminderFromJson(Map<String, dynamic> json) => _$_Reminder(
      id: json['id'] as int?,
      name: json['name'] as String,
      createDate: const DateTimeConverter().fromJson(json['createDate'] as int),
      alert: $enumDecode(_$AlertTypeEnumMap, json['alert']),
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
      'alert': _$AlertTypeEnumMap[instance.alert]!,
      'alertTime': _$JsonConverterToJson<String, TimeOfDay>(
          instance.alertTime, const TimeOfDayConverter().toJson),
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
