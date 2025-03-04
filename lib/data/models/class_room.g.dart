// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassRoomImpl _$$ClassRoomImplFromJson(Map<String, dynamic> json) =>
    _$ClassRoomImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      createDate: const DateTimeConverter()
          .fromJson((json['createDate'] as num).toInt()),
      openDate:
          const DateTimeConverter().fromJson((json['openDate'] as num).toInt()),
      tuition: (json['tuition'] as num).toInt(),
      alert: $enumDecodeNullable(_$AlertTypeEnumMap, json['alert']) ??
          AlertType.None,
      location: json['location'] as String?,
      timetables: json['timetables'] == null
          ? const []
          : const ListTimetableConverter()
              .fromJson(json['timetables'] as String),
      isOpen: const BoolConverter().fromJson((json['isOpen'] as num).toInt()),
      softIndex: (json['softIndex'] as num?)?.toInt() ?? -1,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$ClassRoomImplToJson(_$ClassRoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createDate': const DateTimeConverter().toJson(instance.createDate),
      'openDate': const DateTimeConverter().toJson(instance.openDate),
      'tuition': instance.tuition,
      'alert': _$AlertTypeEnumMap[instance.alert]!,
      'location': instance.location,
      'timetables': const ListTimetableConverter().toJson(instance.timetables),
      'isOpen': const BoolConverter().toJson(instance.isOpen),
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
