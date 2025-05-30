// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Student _$StudentFromJson(Map<String, dynamic> json) => _Student(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      classId: const ListIntConverter().fromJson(json['classId'] as String),
      beginStudy: const DateTimeConverter()
          .fromJson((json['beginStudy'] as num).toInt()),
      isFollow:
          const BoolConverter().fromJson((json['isFollow'] as num).toInt()),
      isSpecial:
          const BoolConverter().fromJson((json['isSpecial'] as num).toInt()),
      fee: (json['fee'] as num).toInt(),
      phones: const ListStringConverter().fromJson(json['phones'] as String),
      lastCharge: _$JsonConverterFromJson<int, DateTime>(
          json['lastCharge'], const DateTimeConverter().fromJson),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$StudentToJson(_Student instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'classId': const ListIntConverter().toJson(instance.classId),
      'beginStudy': const DateTimeConverter().toJson(instance.beginStudy),
      'isFollow': const BoolConverter().toJson(instance.isFollow),
      'isSpecial': const BoolConverter().toJson(instance.isSpecial),
      'fee': instance.fee,
      'phones': const ListStringConverter().toJson(instance.phones),
      'lastCharge': _$JsonConverterToJson<int, DateTime>(
          instance.lastCharge, const DateTimeConverter().toJson),
      'image': instance.image,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
