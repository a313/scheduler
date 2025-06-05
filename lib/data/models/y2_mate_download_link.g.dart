// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'y2_mate_download_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Y2MateDownloadLink _$Y2MateDownloadLinkFromJson(Map<String, dynamic> json) =>
    _Y2MateDownloadLink(
      status: json['status'] as String,
      mess: json['mess'] as String,
      cStatus: json['c_status'] as String,
      vid: json['vid'] as String,
      title: json['title'] as String,
      ftype: json['ftype'] as String,
      fquality: json['fquality'] as String,
      dlink: json['dlink'] as String,
    );

Map<String, dynamic> _$Y2MateDownloadLinkToJson(_Y2MateDownloadLink instance) =>
    <String, dynamic>{
      'status': instance.status,
      'mess': instance.mess,
      'c_status': instance.cStatus,
      'vid': instance.vid,
      'title': instance.title,
      'ftype': instance.ftype,
      'fquality': instance.fquality,
      'dlink': instance.dlink,
    };
