// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StudentModel _$$_StudentModelFromJson(Map<String, dynamic> json) =>
    _$_StudentModel(
      json['id'] as int,
      json['name'] as String,
      (json['classIds'] as List<dynamic>).map((e) => e as int).toList(),
      DateTime.parse(json['beginStudy'] as String),
      DateTime.parse(json['lastCharge'] as String),
      json['phones'] as String,
      json['isSpecial'] as bool,
      json['fee'] as int?,
      json['isFollow'] as bool,
      json['image'] as String?,
    );

Map<String, dynamic> _$$_StudentModelToJson(_$_StudentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'classIds': instance.classIds,
      'beginStudy': instance.beginStudy.toIso8601String(),
      'lastCharge': instance.lastCharge.toIso8601String(),
      'phones': instance.phones,
      'isSpecial': instance.isSpecial,
      'fee': instance.fee,
      'isFollow': instance.isFollow,
      'image': instance.image,
    };
