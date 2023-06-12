// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClassRoom _$$_ClassRoomFromJson(Map<String, dynamic> json) => _$_ClassRoom(
      id: json['id'] as int?,
      name: json['name'] as String,
      createDate: DateTime.parse(json['createDate'] as String),
      tuition: json['tuition'] as int,
      isOpen: json['isOpen'] as bool,
      softIndex: json['softIndex'] as int? ?? -1,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_ClassRoomToJson(_$_ClassRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createDate': instance.createDate.toIso8601String(),
      'tuition': instance.tuition,
      'isOpen': instance.isOpen,
      'softIndex': instance.softIndex,
      'image': instance.image,
    };
