// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'y2_mate_video_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Y2MateVideoDetail _$Y2MateVideoDetailFromJson(Map<String, dynamic> json) =>
    _Y2MateVideoDetail(
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

Map<String, dynamic> _$Y2MateVideoDetailToJson(_Y2MateVideoDetail instance) =>
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

_Links _$LinksFromJson(Map<String, dynamic> json) => _Links(
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

Map<String, dynamic> _$LinksToJson(_Links instance) => <String, dynamic>{
  'mp4': instance.mp4,
  'mp3': instance.mp3,
  'other': instance.other,
};

_ItemDetail _$ItemDetailFromJson(Map<String, dynamic> json) => _ItemDetail(
  size: json['size'] as String,
  f: json['f'] as String,
  q: json['q'] as String,
  k: json['k'] as String,
);

Map<String, dynamic> _$ItemDetailToJson(_ItemDetail instance) =>
    <String, dynamic>{
      'size': instance.size,
      'f': instance.f,
      'q': instance.q,
      'k': instance.k,
    };
