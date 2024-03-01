// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      id: json['id'] as int?,
      parentId: json['parentId'] as int?,
      name: json['name'] as String,
      startTime: const DateTimeConverter().fromJson(json['startTime'] as int),
      endTime: const DateTimeConverter().fromJson(json['endTime'] as int),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      alert: $enumDecode(_$AlertTypeEnumMap, json['alert']),
      repeat: $enumDecode(_$RepeatTypeEnumMap, json['repeat']),
      location: json['location'] as String?,
      classId: json['classId'] as int?,
      invitedIds: json['invitedIds'] == null
          ? const []
          : const ListIntConverter().fromJson(json['invitedIds'] as String),
      joinedIds: json['joinedIds'] == null
          ? const []
          : const ListIntConverter().fromJson(json['joinedIds'] as String),
      isActive: json['isActive'] == null
          ? true
          : const BoolConverter().fromJson(json['isActive'] as int),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'name': instance.name,
      'startTime': const DateTimeConverter().toJson(instance.startTime),
      'endTime': const DateTimeConverter().toJson(instance.endTime),
      'type': _$EventTypeEnumMap[instance.type]!,
      'alert': _$AlertTypeEnumMap[instance.alert]!,
      'repeat': _$RepeatTypeEnumMap[instance.repeat]!,
      'location': instance.location,
      'classId': instance.classId,
      'invitedIds': const ListIntConverter().toJson(instance.invitedIds),
      'joinedIds': const ListIntConverter().toJson(instance.joinedIds),
      'isActive': const BoolConverter().toJson(instance.isActive),
      'note': instance.note,
    };

const _$EventTypeEnumMap = {
  EventType.Origin: 'Origin',
  EventType.Modified: 'Modified',
  EventType.GeneradeClass: 'GeneradeClass',
  EventType.GeneradeReminder: 'GeneradeReminder',
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
