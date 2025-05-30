// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Event _$EventFromJson(Map<String, dynamic> json) => _Event(
      id: (json['id'] as num?)?.toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      name: json['name'] as String,
      startTime: const DateTimeConverter()
          .fromJson((json['startTime'] as num).toInt()),
      endTime:
          const DateTimeConverter().fromJson((json['endTime'] as num).toInt()),
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      alert: $enumDecode(_$AlertTypeEnumMap, json['alert']),
      repeat: $enumDecode(_$RepeatTypeEnumMap, json['repeat']),
      location: json['location'] as String?,
      classId: (json['classId'] as num?)?.toInt(),
      invitedIds: json['invitedIds'] == null
          ? const []
          : const ListIntConverter().fromJson(json['invitedIds'] as String),
      joinedIds: json['joinedIds'] == null
          ? const []
          : const ListIntConverter().fromJson(json['joinedIds'] as String),
      isActive: json['isActive'] == null
          ? true
          : const BoolConverter().fromJson((json['isActive'] as num).toInt()),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$EventToJson(_Event instance) => <String, dynamic>{
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
