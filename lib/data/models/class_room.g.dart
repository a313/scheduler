// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClassRoom _$$_ClassRoomFromJson(Map<String, dynamic> json) => _$_ClassRoom(
      id: json['id'] as int?,
      name: json['name'] as String,
      createDate: const DateTimeConverter().fromJson(json['createDate'] as int),
      tuition: json['tuition'] as int,
      location: json['location'] as String?,
      timetables: json['timetables'] == null
          ? const []
          : const ListTimetableConverter()
              .fromJson(json['timetables'] as String),
      isOpen: const BoolConverter().fromJson(json['isOpen'] as int),
      softIndex: json['softIndex'] as int? ?? -1,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_ClassRoomToJson(_$_ClassRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createDate': const DateTimeConverter().toJson(instance.createDate),
      'tuition': instance.tuition,
      'location': instance.location,
      'timetables': const ListTimetableConverter().toJson(instance.timetables),
      'isOpen': const BoolConverter().toJson(instance.isOpen),
      'softIndex': instance.softIndex,
      'image': instance.image,
    };
