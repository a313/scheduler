// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['id'] as int?,
      name: json['name'] as String,
      startTime: const DateTimeConverter().fromJson(json['startTime'] as int),
      endTime: const DateTimeConverter().fromJson(json['endTime'] as int),
      alert: $enumDecode(_$AlertTypeEnumMap, json['alert']),
      repeat: $enumDecode(_$RepeatTypeEnumMap, json['repeat']),
      location: json['location'] as String?,
      classIds: json['classIds'] == null
          ? const []
          : const ListIntConverter().fromJson(json['classIds'] as String),
      invitedIds: json['invitedIds'] == null
          ? const []
          : const ListIntConverter().fromJson(json['invitedIds'] as String),
      joinedIds: json['joinedIds'] == null
          ? const []
          : const ListIntConverter().fromJson(json['joinedIds'] as String),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startTime': const DateTimeConverter().toJson(instance.startTime),
      'endTime': const DateTimeConverter().toJson(instance.endTime),
      'alert': _$AlertTypeEnumMap[instance.alert]!,
      'repeat': _$RepeatTypeEnumMap[instance.repeat]!,
      'location': instance.location,
      'classIds': const ListIntConverter().toJson(instance.classIds),
      'invitedIds': const ListIntConverter().toJson(instance.invitedIds),
      'joinedIds': const ListIntConverter().toJson(instance.joinedIds),
      'note': instance.note,
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
