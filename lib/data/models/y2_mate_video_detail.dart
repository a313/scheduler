import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'y2_mate_video_detail.freezed.dart';
part 'y2_mate_video_detail.g.dart';

Y2MateVideoDetail y2MateVideoDetailFromJson(String str) =>
    Y2MateVideoDetail.fromJson(json.decode(str));

String y2MateVideoDetailToJson(Y2MateVideoDetail data) =>
    json.encode(data.toJson());

extension Y2MateExt on Y2MateVideoDetail {
  bool get isSuccess => status == 'ok';
  bool get isError => status == 'error';
  String get thumbnailUrl => 'https://i.ytimg.com/vi/$vid/0.jpg';
}

@freezed
class Y2MateVideoDetail with _$Y2MateVideoDetail {
  const factory Y2MateVideoDetail({
    required String status,
    required String mess,
    required String page,
    required String vid,
    required String extractor,
    required String title,
    required int t,
    required String a,
    required Links links,
  }) = _Y2MateVideoDetail;

  factory Y2MateVideoDetail.fromJson(Map<String, dynamic> json) =>
      _$Y2MateVideoDetailFromJson(json);

  factory Y2MateVideoDetail.error(String message) => Y2MateVideoDetail(
      status: 'error',
      mess: message,
      page: 'detail',
      vid: '',
      extractor: '',
      title: '',
      t: 0,
      a: '',
      links: const Links());
}

@freezed
class Links with _$Links {
  const factory Links({
    Map<String, ItemDetail>? mp4,
    Map<String, ItemDetail>? mp3,
    Map<String, ItemDetail>? other,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class ItemDetail with _$ItemDetail {
  const factory ItemDetail({
    required String size,
    required String f,
    required String q,
    required String qText,
    required String k,
  }) = _ItemDetail;

  factory ItemDetail.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailFromJson(json);
}
