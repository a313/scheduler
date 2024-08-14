// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteImpl _$$NoteImplFromJson(Map<String, dynamic> json) => _$NoteImpl(
      id: json['id'] as int?,
      createDate: const DateTimeConverter().fromJson(json['createDate'] as int),
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$NoteImplToJson(_$NoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createDate': const DateTimeConverter().toJson(instance.createDate),
      'data': instance.data,
    };
