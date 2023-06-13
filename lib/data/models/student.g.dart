// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Student _$$_StudentFromJson(Map<String, dynamic> json) => _$_Student(
      id: json['id'] as int?,
      name: json['name'] as String,
      classId: const ListIntConverter().fromJson(json['classId'] as String),
      beginStudy: DateTime.parse(json['beginStudy'] as String),
      isFollow: const BoolConverter().fromJson(json['isFollow'] as int),
      isSpecial: const BoolConverter().fromJson(json['isSpecial'] as int),
      fee: json['fee'] as int,
      phones: const ListStringConverter().fromJson(json['phones'] as String),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_StudentToJson(_$_Student instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'classId': const ListIntConverter().toJson(instance.classId),
      'beginStudy': instance.beginStudy.toIso8601String(),
      'isFollow': const BoolConverter().toJson(instance.isFollow),
      'isSpecial': const BoolConverter().toJson(instance.isSpecial),
      'fee': instance.fee,
      'phones': const ListStringConverter().toJson(instance.phones),
      'image': instance.image,
    };
