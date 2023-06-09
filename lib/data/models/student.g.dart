// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Student _$$_StudentFromJson(Map<String, dynamic> json) => _$_Student(
      id: json['id'] as int?,
      name: json['name'] as String,
      classId: (json['classId'] as List<dynamic>).map((e) => e as int).toList(),
      beginStudy: DateTime.parse(json['beginStudy'] as String),
      isFollow: json['isFollow'] as bool,
      isSpecial: json['isSpecial'] as bool,
      fee: json['fee'] as int,
      phones:
          (json['phones'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_StudentToJson(_$_Student instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'classId': instance.classId,
      'beginStudy': instance.beginStudy.toIso8601String(),
      'isFollow': instance.isFollow,
      'isSpecial': instance.isSpecial,
      'fee': instance.fee,
      'phones': instance.phones,
      'image': instance.image,
    };
