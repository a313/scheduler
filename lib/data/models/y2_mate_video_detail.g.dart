// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'y2_mate_video_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Y2MateVideoDetailImpl _$$Y2MateVideoDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$Y2MateVideoDetailImpl(
      status: json['status'] as String,
      mess: json['mess'] as String,
      page: json['page'] as String,
      vid: json['vid'] as String,
      extractor: json['extractor'] as String,
      title: json['title'] as String,
      t: (json['t'] as num).toInt(),
      a: json['a'] as String,
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$Y2MateVideoDetailImplToJson(
        _$Y2MateVideoDetailImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'mess': instance.mess,
      'page': instance.page,
      'vid': instance.vid,
      'extractor': instance.extractor,
      'title': instance.title,
      't': instance.t,
      'a': instance.a,
      'links': instance.links,
    };

_$LinksImpl _$$LinksImplFromJson(Map<String, dynamic> json) => _$LinksImpl(
      mp4: (json['mp4'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, ItemDetail.fromJson(e as Map<String, dynamic>)),
      ),
      mp3: (json['mp3'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, ItemDetail.fromJson(e as Map<String, dynamic>)),
      ),
      other: (json['other'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, ItemDetail.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$LinksImplToJson(_$LinksImpl instance) =>
    <String, dynamic>{
      'mp4': instance.mp4,
      'mp3': instance.mp3,
      'other': instance.other,
    };

_$ItemDetailImpl _$$ItemDetailImplFromJson(Map<String, dynamic> json) =>
    _$ItemDetailImpl(
      size: json['size'] as String,
      f: json['f'] as String,
      q: json['q'] as String,
      k: json['k'] as String,
    );

Map<String, dynamic> _$$ItemDetailImplToJson(_$ItemDetailImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'f': instance.f,
      'q': instance.q,
      'k': instance.k,
    };
