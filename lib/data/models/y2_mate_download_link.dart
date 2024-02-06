// To parse this JSON data, do
//
//     final y2MateDownloadLink = y2MateDownloadLinkFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'y2_mate_download_link.freezed.dart';
part 'y2_mate_download_link.g.dart';

Y2MateDownloadLink y2MateDownloadLinkFromJson(String str) =>
    Y2MateDownloadLink.fromJson(json.decode(str));

String y2MateDownloadLinkToJson(Y2MateDownloadLink data) =>
    json.encode(data.toJson());

@freezed
class Y2MateDownloadLink with _$Y2MateDownloadLink {
  const factory Y2MateDownloadLink({
    required String status,
    required String mess,
    @JsonKey(name: 'c_status') required String cStatus,
    required String vid,
    required String title,
    required String ftype,
    required String fquality,
    required String dlink,
  }) = _Y2MateDownloadLink;

  factory Y2MateDownloadLink.fromJson(Map<String, dynamic> json) =>
      _$Y2MateDownloadLinkFromJson(json);
}
