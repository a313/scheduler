// To parse this JSON data, do
//
//     final videoInfo = videoInfoFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_info.freezed.dart';
part 'video_info.g.dart';

VideoInfo videoInfoFromJson(String str) => VideoInfo.fromJson(json.decode(str));

String videoInfoToJson(VideoInfo data) => json.encode(data.toJson());

@freezed
class VideoInfo with _$VideoInfo {
  const factory VideoInfo({
    String? creator,
    List<Mp3>? mp4,
    List<Mp3>? mp3,
    String? error,
  }) = _VideoInfo;

  factory VideoInfo.fromJson(Map<String, dynamic> json) =>
      _$VideoInfoFromJson(json);

  factory VideoInfo.error(String error) => VideoInfo(error: error);
}

@freezed
class Mp3 with _$Mp3 {
  const factory Mp3({
    required String mimeType,
    required String? qualityLabel,
    required int bitrate,
    int? audioBitrate,
    required int itag,
    required Range initRange,
    required Range indexRange,
    required String lastModified,
    required String contentLength,
    required String quality,
    required ProjectionType projectionType,
    required int averageBitrate,
    String? audioQuality,
    required String approxDurationMs,
    String? audioSampleRate,
    int? audioChannels,
    double? loudnessDb,
    required String url,
    required bool hasVideo,
    required bool hasAudio,
    required Container container,
    required String codecs,
    required String? videoCodec,
    required String? audioCodec,
    required bool isLive,
    required bool isHls,
    required bool isDashMpd,
    bool? highReplication,
    int? width,
    int? height,
    int? fps,
    ColorInfo? colorInfo,
  }) = _Mp3;

  factory Mp3.fromJson(Map<String, dynamic> json) => _$Mp3FromJson(json);
}

@freezed
class ColorInfo with _$ColorInfo {
  const factory ColorInfo({
    required Primaries primaries,
    required TransferCharacteristics transferCharacteristics,
    required MatrixCoefficients matrixCoefficients,
  }) = _ColorInfo;

  factory ColorInfo.fromJson(Map<String, dynamic> json) =>
      _$ColorInfoFromJson(json);
}

enum MatrixCoefficients { COLOR_MATRIX_COEFFICIENTS_BT709 }

final matrixCoefficientsValues = EnumValues({
  "COLOR_MATRIX_COEFFICIENTS_BT709":
      MatrixCoefficients.COLOR_MATRIX_COEFFICIENTS_BT709
});

enum Primaries { COLOR_PRIMARIES_BT709 }

final primariesValues =
    EnumValues({"COLOR_PRIMARIES_BT709": Primaries.COLOR_PRIMARIES_BT709});

enum TransferCharacteristics { COLOR_TRANSFER_CHARACTERISTICS_BT709 }

final transferCharacteristicsValues = EnumValues({
  "COLOR_TRANSFER_CHARACTERISTICS_BT709":
      TransferCharacteristics.COLOR_TRANSFER_CHARACTERISTICS_BT709
});

enum Container { MP4, WEBM }

final containerValues =
    EnumValues({"mp4": Container.MP4, "webm": Container.WEBM});

@freezed
class Range with _$Range {
  const factory Range({
    required String start,
    required String end,
  }) = _Range;

  factory Range.fromJson(Map<String, dynamic> json) => _$RangeFromJson(json);
}

enum ProjectionType { RECTANGULAR }

final projectionTypeValues =
    EnumValues({"RECTANGULAR": ProjectionType.RECTANGULAR});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
