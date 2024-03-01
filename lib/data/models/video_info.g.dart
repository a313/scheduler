// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoInfoImpl _$$VideoInfoImplFromJson(Map<String, dynamic> json) =>
    _$VideoInfoImpl(
      creator: json['creator'] as String?,
      mp4: (json['mp4'] as List<dynamic>?)
          ?.map((e) => Mp3.fromJson(e as Map<String, dynamic>))
          .toList(),
      mp3: (json['mp3'] as List<dynamic>?)
          ?.map((e) => Mp3.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$VideoInfoImplToJson(_$VideoInfoImpl instance) =>
    <String, dynamic>{
      'creator': instance.creator,
      'mp4': instance.mp4,
      'mp3': instance.mp3,
      'error': instance.error,
    };

_$Mp3Impl _$$Mp3ImplFromJson(Map<String, dynamic> json) => _$Mp3Impl(
      mimeType: json['mimeType'] as String,
      qualityLabel: json['qualityLabel'] as String?,
      bitrate: json['bitrate'] as int,
      audioBitrate: json['audioBitrate'] as int?,
      itag: json['itag'] as int,
      initRange: Range.fromJson(json['initRange'] as Map<String, dynamic>),
      indexRange: Range.fromJson(json['indexRange'] as Map<String, dynamic>),
      lastModified: json['lastModified'] as String,
      contentLength: json['contentLength'] as String,
      quality: json['quality'] as String,
      projectionType:
          $enumDecode(_$ProjectionTypeEnumMap, json['projectionType']),
      averageBitrate: json['averageBitrate'] as int,
      audioQuality: json['audioQuality'] as String?,
      approxDurationMs: json['approxDurationMs'] as String,
      audioSampleRate: json['audioSampleRate'] as String?,
      audioChannels: json['audioChannels'] as int?,
      loudnessDb: (json['loudnessDb'] as num?)?.toDouble(),
      url: json['url'] as String,
      hasVideo: json['hasVideo'] as bool,
      hasAudio: json['hasAudio'] as bool,
      container: $enumDecode(_$ContainerEnumMap, json['container']),
      codecs: json['codecs'] as String,
      videoCodec: json['videoCodec'] as String?,
      audioCodec: json['audioCodec'] as String?,
      isLive: json['isLive'] as bool,
      isHls: json['isHls'] as bool,
      isDashMpd: json['isDashMpd'] as bool,
      highReplication: json['highReplication'] as bool?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      fps: json['fps'] as int?,
      colorInfo: json['colorInfo'] == null
          ? null
          : ColorInfo.fromJson(json['colorInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$Mp3ImplToJson(_$Mp3Impl instance) => <String, dynamic>{
      'mimeType': instance.mimeType,
      'qualityLabel': instance.qualityLabel,
      'bitrate': instance.bitrate,
      'audioBitrate': instance.audioBitrate,
      'itag': instance.itag,
      'initRange': instance.initRange,
      'indexRange': instance.indexRange,
      'lastModified': instance.lastModified,
      'contentLength': instance.contentLength,
      'quality': instance.quality,
      'projectionType': _$ProjectionTypeEnumMap[instance.projectionType]!,
      'averageBitrate': instance.averageBitrate,
      'audioQuality': instance.audioQuality,
      'approxDurationMs': instance.approxDurationMs,
      'audioSampleRate': instance.audioSampleRate,
      'audioChannels': instance.audioChannels,
      'loudnessDb': instance.loudnessDb,
      'url': instance.url,
      'hasVideo': instance.hasVideo,
      'hasAudio': instance.hasAudio,
      'container': _$ContainerEnumMap[instance.container]!,
      'codecs': instance.codecs,
      'videoCodec': instance.videoCodec,
      'audioCodec': instance.audioCodec,
      'isLive': instance.isLive,
      'isHls': instance.isHls,
      'isDashMpd': instance.isDashMpd,
      'highReplication': instance.highReplication,
      'width': instance.width,
      'height': instance.height,
      'fps': instance.fps,
      'colorInfo': instance.colorInfo,
    };

const _$ProjectionTypeEnumMap = {
  ProjectionType.RECTANGULAR: 'RECTANGULAR',
};

const _$ContainerEnumMap = {
  Container.MP4: 'MP4',
  Container.WEBM: 'WEBM',
};

_$ColorInfoImpl _$$ColorInfoImplFromJson(Map<String, dynamic> json) =>
    _$ColorInfoImpl(
      primaries: $enumDecode(_$PrimariesEnumMap, json['primaries']),
      transferCharacteristics: $enumDecode(
          _$TransferCharacteristicsEnumMap, json['transferCharacteristics']),
      matrixCoefficients:
          $enumDecode(_$MatrixCoefficientsEnumMap, json['matrixCoefficients']),
    );

Map<String, dynamic> _$$ColorInfoImplToJson(_$ColorInfoImpl instance) =>
    <String, dynamic>{
      'primaries': _$PrimariesEnumMap[instance.primaries]!,
      'transferCharacteristics':
          _$TransferCharacteristicsEnumMap[instance.transferCharacteristics]!,
      'matrixCoefficients':
          _$MatrixCoefficientsEnumMap[instance.matrixCoefficients]!,
    };

const _$PrimariesEnumMap = {
  Primaries.COLOR_PRIMARIES_BT709: 'COLOR_PRIMARIES_BT709',
};

const _$TransferCharacteristicsEnumMap = {
  TransferCharacteristics.COLOR_TRANSFER_CHARACTERISTICS_BT709:
      'COLOR_TRANSFER_CHARACTERISTICS_BT709',
};

const _$MatrixCoefficientsEnumMap = {
  MatrixCoefficients.COLOR_MATRIX_COEFFICIENTS_BT709:
      'COLOR_MATRIX_COEFFICIENTS_BT709',
};

_$RangeImpl _$$RangeImplFromJson(Map<String, dynamic> json) => _$RangeImpl(
      start: json['start'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$$RangeImplToJson(_$RangeImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
