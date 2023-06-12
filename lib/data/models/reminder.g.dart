// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reminder _$$_ReminderFromJson(Map<String, dynamic> json) => _$_Reminder(
      id: json['id'] as int?,
      name: json['name'] as String,
      createDate: DateTime.parse(json['createDate'] as String),
      softIndex: json['softIndex'] as int? ?? -1,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_ReminderToJson(_$_Reminder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createDate': instance.createDate.toIso8601String(),
      'softIndex': instance.softIndex,
      'image': instance.image,
    };
