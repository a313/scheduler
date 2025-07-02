// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoInfo {

 String? get creator; List<Mp3>? get mp4; List<Mp3>? get mp3; String? get error;
/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoInfoCopyWith<VideoInfo> get copyWith => _$VideoInfoCopyWithImpl<VideoInfo>(this as VideoInfo, _$identity);

  /// Serializes this VideoInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoInfo&&(identical(other.creator, creator) || other.creator == creator)&&const DeepCollectionEquality().equals(other.mp4, mp4)&&const DeepCollectionEquality().equals(other.mp3, mp3)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,creator,const DeepCollectionEquality().hash(mp4),const DeepCollectionEquality().hash(mp3),error);

@override
String toString() {
  return 'VideoInfo(creator: $creator, mp4: $mp4, mp3: $mp3, error: $error)';
}


}

/// @nodoc
abstract mixin class $VideoInfoCopyWith<$Res>  {
  factory $VideoInfoCopyWith(VideoInfo value, $Res Function(VideoInfo) _then) = _$VideoInfoCopyWithImpl;
@useResult
$Res call({
 String? creator, List<Mp3>? mp4, List<Mp3>? mp3, String? error
});




}
/// @nodoc
class _$VideoInfoCopyWithImpl<$Res>
    implements $VideoInfoCopyWith<$Res> {
  _$VideoInfoCopyWithImpl(this._self, this._then);

  final VideoInfo _self;
  final $Res Function(VideoInfo) _then;

/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? creator = freezed,Object? mp4 = freezed,Object? mp3 = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as String?,mp4: freezed == mp4 ? _self.mp4 : mp4 // ignore: cast_nullable_to_non_nullable
as List<Mp3>?,mp3: freezed == mp3 ? _self.mp3 : mp3 // ignore: cast_nullable_to_non_nullable
as List<Mp3>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VideoInfo implements VideoInfo {
  const _VideoInfo({this.creator, final  List<Mp3>? mp4, final  List<Mp3>? mp3, this.error}): _mp4 = mp4,_mp3 = mp3;
  factory _VideoInfo.fromJson(Map<String, dynamic> json) => _$VideoInfoFromJson(json);

@override final  String? creator;
 final  List<Mp3>? _mp4;
@override List<Mp3>? get mp4 {
  final value = _mp4;
  if (value == null) return null;
  if (_mp4 is EqualUnmodifiableListView) return _mp4;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Mp3>? _mp3;
@override List<Mp3>? get mp3 {
  final value = _mp3;
  if (value == null) return null;
  if (_mp3 is EqualUnmodifiableListView) return _mp3;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? error;

/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoInfoCopyWith<_VideoInfo> get copyWith => __$VideoInfoCopyWithImpl<_VideoInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoInfo&&(identical(other.creator, creator) || other.creator == creator)&&const DeepCollectionEquality().equals(other._mp4, _mp4)&&const DeepCollectionEquality().equals(other._mp3, _mp3)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,creator,const DeepCollectionEquality().hash(_mp4),const DeepCollectionEquality().hash(_mp3),error);

@override
String toString() {
  return 'VideoInfo(creator: $creator, mp4: $mp4, mp3: $mp3, error: $error)';
}


}

/// @nodoc
abstract mixin class _$VideoInfoCopyWith<$Res> implements $VideoInfoCopyWith<$Res> {
  factory _$VideoInfoCopyWith(_VideoInfo value, $Res Function(_VideoInfo) _then) = __$VideoInfoCopyWithImpl;
@override @useResult
$Res call({
 String? creator, List<Mp3>? mp4, List<Mp3>? mp3, String? error
});




}
/// @nodoc
class __$VideoInfoCopyWithImpl<$Res>
    implements _$VideoInfoCopyWith<$Res> {
  __$VideoInfoCopyWithImpl(this._self, this._then);

  final _VideoInfo _self;
  final $Res Function(_VideoInfo) _then;

/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? creator = freezed,Object? mp4 = freezed,Object? mp3 = freezed,Object? error = freezed,}) {
  return _then(_VideoInfo(
creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as String?,mp4: freezed == mp4 ? _self._mp4 : mp4 // ignore: cast_nullable_to_non_nullable
as List<Mp3>?,mp3: freezed == mp3 ? _self._mp3 : mp3 // ignore: cast_nullable_to_non_nullable
as List<Mp3>?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Mp3 {

 String get mimeType; String? get qualityLabel; int get bitrate; int? get audioBitrate; int get itag; Range get initRange; Range get indexRange; String get lastModified; String get contentLength; String get quality; ProjectionType get projectionType; int get averageBitrate; String? get audioQuality; String get approxDurationMs; String? get audioSampleRate; int? get audioChannels; double? get loudnessDb; String get url; bool get hasVideo; bool get hasAudio; Container get container; String get codecs; String? get videoCodec; String? get audioCodec; bool get isLive; bool get isHls; bool get isDashMpd; bool? get highReplication; int? get width; int? get height; int? get fps; ColorInfo? get colorInfo;
/// Create a copy of Mp3
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Mp3CopyWith<Mp3> get copyWith => _$Mp3CopyWithImpl<Mp3>(this as Mp3, _$identity);

  /// Serializes this Mp3 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Mp3&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.qualityLabel, qualityLabel) || other.qualityLabel == qualityLabel)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.audioBitrate, audioBitrate) || other.audioBitrate == audioBitrate)&&(identical(other.itag, itag) || other.itag == itag)&&(identical(other.initRange, initRange) || other.initRange == initRange)&&(identical(other.indexRange, indexRange) || other.indexRange == indexRange)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.contentLength, contentLength) || other.contentLength == contentLength)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.projectionType, projectionType) || other.projectionType == projectionType)&&(identical(other.averageBitrate, averageBitrate) || other.averageBitrate == averageBitrate)&&(identical(other.audioQuality, audioQuality) || other.audioQuality == audioQuality)&&(identical(other.approxDurationMs, approxDurationMs) || other.approxDurationMs == approxDurationMs)&&(identical(other.audioSampleRate, audioSampleRate) || other.audioSampleRate == audioSampleRate)&&(identical(other.audioChannels, audioChannels) || other.audioChannels == audioChannels)&&(identical(other.loudnessDb, loudnessDb) || other.loudnessDb == loudnessDb)&&(identical(other.url, url) || other.url == url)&&(identical(other.hasVideo, hasVideo) || other.hasVideo == hasVideo)&&(identical(other.hasAudio, hasAudio) || other.hasAudio == hasAudio)&&(identical(other.container, container) || other.container == container)&&(identical(other.codecs, codecs) || other.codecs == codecs)&&(identical(other.videoCodec, videoCodec) || other.videoCodec == videoCodec)&&(identical(other.audioCodec, audioCodec) || other.audioCodec == audioCodec)&&(identical(other.isLive, isLive) || other.isLive == isLive)&&(identical(other.isHls, isHls) || other.isHls == isHls)&&(identical(other.isDashMpd, isDashMpd) || other.isDashMpd == isDashMpd)&&(identical(other.highReplication, highReplication) || other.highReplication == highReplication)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.fps, fps) || other.fps == fps)&&(identical(other.colorInfo, colorInfo) || other.colorInfo == colorInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,mimeType,qualityLabel,bitrate,audioBitrate,itag,initRange,indexRange,lastModified,contentLength,quality,projectionType,averageBitrate,audioQuality,approxDurationMs,audioSampleRate,audioChannels,loudnessDb,url,hasVideo,hasAudio,container,codecs,videoCodec,audioCodec,isLive,isHls,isDashMpd,highReplication,width,height,fps,colorInfo]);

@override
String toString() {
  return 'Mp3(mimeType: $mimeType, qualityLabel: $qualityLabel, bitrate: $bitrate, audioBitrate: $audioBitrate, itag: $itag, initRange: $initRange, indexRange: $indexRange, lastModified: $lastModified, contentLength: $contentLength, quality: $quality, projectionType: $projectionType, averageBitrate: $averageBitrate, audioQuality: $audioQuality, approxDurationMs: $approxDurationMs, audioSampleRate: $audioSampleRate, audioChannels: $audioChannels, loudnessDb: $loudnessDb, url: $url, hasVideo: $hasVideo, hasAudio: $hasAudio, container: $container, codecs: $codecs, videoCodec: $videoCodec, audioCodec: $audioCodec, isLive: $isLive, isHls: $isHls, isDashMpd: $isDashMpd, highReplication: $highReplication, width: $width, height: $height, fps: $fps, colorInfo: $colorInfo)';
}


}

/// @nodoc
abstract mixin class $Mp3CopyWith<$Res>  {
  factory $Mp3CopyWith(Mp3 value, $Res Function(Mp3) _then) = _$Mp3CopyWithImpl;
@useResult
$Res call({
 String mimeType, String? qualityLabel, int bitrate, int? audioBitrate, int itag, Range initRange, Range indexRange, String lastModified, String contentLength, String quality, ProjectionType projectionType, int averageBitrate, String? audioQuality, String approxDurationMs, String? audioSampleRate, int? audioChannels, double? loudnessDb, String url, bool hasVideo, bool hasAudio, Container container, String codecs, String? videoCodec, String? audioCodec, bool isLive, bool isHls, bool isDashMpd, bool? highReplication, int? width, int? height, int? fps, ColorInfo? colorInfo
});


$RangeCopyWith<$Res> get initRange;$RangeCopyWith<$Res> get indexRange;$ColorInfoCopyWith<$Res>? get colorInfo;

}
/// @nodoc
class _$Mp3CopyWithImpl<$Res>
    implements $Mp3CopyWith<$Res> {
  _$Mp3CopyWithImpl(this._self, this._then);

  final Mp3 _self;
  final $Res Function(Mp3) _then;

/// Create a copy of Mp3
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mimeType = null,Object? qualityLabel = freezed,Object? bitrate = null,Object? audioBitrate = freezed,Object? itag = null,Object? initRange = null,Object? indexRange = null,Object? lastModified = null,Object? contentLength = null,Object? quality = null,Object? projectionType = null,Object? averageBitrate = null,Object? audioQuality = freezed,Object? approxDurationMs = null,Object? audioSampleRate = freezed,Object? audioChannels = freezed,Object? loudnessDb = freezed,Object? url = null,Object? hasVideo = null,Object? hasAudio = null,Object? container = null,Object? codecs = null,Object? videoCodec = freezed,Object? audioCodec = freezed,Object? isLive = null,Object? isHls = null,Object? isDashMpd = null,Object? highReplication = freezed,Object? width = freezed,Object? height = freezed,Object? fps = freezed,Object? colorInfo = freezed,}) {
  return _then(_self.copyWith(
mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,qualityLabel: freezed == qualityLabel ? _self.qualityLabel : qualityLabel // ignore: cast_nullable_to_non_nullable
as String?,bitrate: null == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int,audioBitrate: freezed == audioBitrate ? _self.audioBitrate : audioBitrate // ignore: cast_nullable_to_non_nullable
as int?,itag: null == itag ? _self.itag : itag // ignore: cast_nullable_to_non_nullable
as int,initRange: null == initRange ? _self.initRange : initRange // ignore: cast_nullable_to_non_nullable
as Range,indexRange: null == indexRange ? _self.indexRange : indexRange // ignore: cast_nullable_to_non_nullable
as Range,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as String,contentLength: null == contentLength ? _self.contentLength : contentLength // ignore: cast_nullable_to_non_nullable
as String,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String,projectionType: null == projectionType ? _self.projectionType : projectionType // ignore: cast_nullable_to_non_nullable
as ProjectionType,averageBitrate: null == averageBitrate ? _self.averageBitrate : averageBitrate // ignore: cast_nullable_to_non_nullable
as int,audioQuality: freezed == audioQuality ? _self.audioQuality : audioQuality // ignore: cast_nullable_to_non_nullable
as String?,approxDurationMs: null == approxDurationMs ? _self.approxDurationMs : approxDurationMs // ignore: cast_nullable_to_non_nullable
as String,audioSampleRate: freezed == audioSampleRate ? _self.audioSampleRate : audioSampleRate // ignore: cast_nullable_to_non_nullable
as String?,audioChannels: freezed == audioChannels ? _self.audioChannels : audioChannels // ignore: cast_nullable_to_non_nullable
as int?,loudnessDb: freezed == loudnessDb ? _self.loudnessDb : loudnessDb // ignore: cast_nullable_to_non_nullable
as double?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,hasVideo: null == hasVideo ? _self.hasVideo : hasVideo // ignore: cast_nullable_to_non_nullable
as bool,hasAudio: null == hasAudio ? _self.hasAudio : hasAudio // ignore: cast_nullable_to_non_nullable
as bool,container: null == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as Container,codecs: null == codecs ? _self.codecs : codecs // ignore: cast_nullable_to_non_nullable
as String,videoCodec: freezed == videoCodec ? _self.videoCodec : videoCodec // ignore: cast_nullable_to_non_nullable
as String?,audioCodec: freezed == audioCodec ? _self.audioCodec : audioCodec // ignore: cast_nullable_to_non_nullable
as String?,isLive: null == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool,isHls: null == isHls ? _self.isHls : isHls // ignore: cast_nullable_to_non_nullable
as bool,isDashMpd: null == isDashMpd ? _self.isDashMpd : isDashMpd // ignore: cast_nullable_to_non_nullable
as bool,highReplication: freezed == highReplication ? _self.highReplication : highReplication // ignore: cast_nullable_to_non_nullable
as bool?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,fps: freezed == fps ? _self.fps : fps // ignore: cast_nullable_to_non_nullable
as int?,colorInfo: freezed == colorInfo ? _self.colorInfo : colorInfo // ignore: cast_nullable_to_non_nullable
as ColorInfo?,
  ));
}
/// Create a copy of Mp3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RangeCopyWith<$Res> get initRange {
  
  return $RangeCopyWith<$Res>(_self.initRange, (value) {
    return _then(_self.copyWith(initRange: value));
  });
}/// Create a copy of Mp3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RangeCopyWith<$Res> get indexRange {
  
  return $RangeCopyWith<$Res>(_self.indexRange, (value) {
    return _then(_self.copyWith(indexRange: value));
  });
}/// Create a copy of Mp3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorInfoCopyWith<$Res>? get colorInfo {
    if (_self.colorInfo == null) {
    return null;
  }

  return $ColorInfoCopyWith<$Res>(_self.colorInfo!, (value) {
    return _then(_self.copyWith(colorInfo: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Mp3 implements Mp3 {
  const _Mp3({required this.mimeType, required this.qualityLabel, required this.bitrate, this.audioBitrate, required this.itag, required this.initRange, required this.indexRange, required this.lastModified, required this.contentLength, required this.quality, required this.projectionType, required this.averageBitrate, this.audioQuality, required this.approxDurationMs, this.audioSampleRate, this.audioChannels, this.loudnessDb, required this.url, required this.hasVideo, required this.hasAudio, required this.container, required this.codecs, required this.videoCodec, required this.audioCodec, required this.isLive, required this.isHls, required this.isDashMpd, this.highReplication, this.width, this.height, this.fps, this.colorInfo});
  factory _Mp3.fromJson(Map<String, dynamic> json) => _$Mp3FromJson(json);

@override final  String mimeType;
@override final  String? qualityLabel;
@override final  int bitrate;
@override final  int? audioBitrate;
@override final  int itag;
@override final  Range initRange;
@override final  Range indexRange;
@override final  String lastModified;
@override final  String contentLength;
@override final  String quality;
@override final  ProjectionType projectionType;
@override final  int averageBitrate;
@override final  String? audioQuality;
@override final  String approxDurationMs;
@override final  String? audioSampleRate;
@override final  int? audioChannels;
@override final  double? loudnessDb;
@override final  String url;
@override final  bool hasVideo;
@override final  bool hasAudio;
@override final  Container container;
@override final  String codecs;
@override final  String? videoCodec;
@override final  String? audioCodec;
@override final  bool isLive;
@override final  bool isHls;
@override final  bool isDashMpd;
@override final  bool? highReplication;
@override final  int? width;
@override final  int? height;
@override final  int? fps;
@override final  ColorInfo? colorInfo;

/// Create a copy of Mp3
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Mp3CopyWith<_Mp3> get copyWith => __$Mp3CopyWithImpl<_Mp3>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Mp3ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Mp3&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.qualityLabel, qualityLabel) || other.qualityLabel == qualityLabel)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.audioBitrate, audioBitrate) || other.audioBitrate == audioBitrate)&&(identical(other.itag, itag) || other.itag == itag)&&(identical(other.initRange, initRange) || other.initRange == initRange)&&(identical(other.indexRange, indexRange) || other.indexRange == indexRange)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.contentLength, contentLength) || other.contentLength == contentLength)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.projectionType, projectionType) || other.projectionType == projectionType)&&(identical(other.averageBitrate, averageBitrate) || other.averageBitrate == averageBitrate)&&(identical(other.audioQuality, audioQuality) || other.audioQuality == audioQuality)&&(identical(other.approxDurationMs, approxDurationMs) || other.approxDurationMs == approxDurationMs)&&(identical(other.audioSampleRate, audioSampleRate) || other.audioSampleRate == audioSampleRate)&&(identical(other.audioChannels, audioChannels) || other.audioChannels == audioChannels)&&(identical(other.loudnessDb, loudnessDb) || other.loudnessDb == loudnessDb)&&(identical(other.url, url) || other.url == url)&&(identical(other.hasVideo, hasVideo) || other.hasVideo == hasVideo)&&(identical(other.hasAudio, hasAudio) || other.hasAudio == hasAudio)&&(identical(other.container, container) || other.container == container)&&(identical(other.codecs, codecs) || other.codecs == codecs)&&(identical(other.videoCodec, videoCodec) || other.videoCodec == videoCodec)&&(identical(other.audioCodec, audioCodec) || other.audioCodec == audioCodec)&&(identical(other.isLive, isLive) || other.isLive == isLive)&&(identical(other.isHls, isHls) || other.isHls == isHls)&&(identical(other.isDashMpd, isDashMpd) || other.isDashMpd == isDashMpd)&&(identical(other.highReplication, highReplication) || other.highReplication == highReplication)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.fps, fps) || other.fps == fps)&&(identical(other.colorInfo, colorInfo) || other.colorInfo == colorInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,mimeType,qualityLabel,bitrate,audioBitrate,itag,initRange,indexRange,lastModified,contentLength,quality,projectionType,averageBitrate,audioQuality,approxDurationMs,audioSampleRate,audioChannels,loudnessDb,url,hasVideo,hasAudio,container,codecs,videoCodec,audioCodec,isLive,isHls,isDashMpd,highReplication,width,height,fps,colorInfo]);

@override
String toString() {
  return 'Mp3(mimeType: $mimeType, qualityLabel: $qualityLabel, bitrate: $bitrate, audioBitrate: $audioBitrate, itag: $itag, initRange: $initRange, indexRange: $indexRange, lastModified: $lastModified, contentLength: $contentLength, quality: $quality, projectionType: $projectionType, averageBitrate: $averageBitrate, audioQuality: $audioQuality, approxDurationMs: $approxDurationMs, audioSampleRate: $audioSampleRate, audioChannels: $audioChannels, loudnessDb: $loudnessDb, url: $url, hasVideo: $hasVideo, hasAudio: $hasAudio, container: $container, codecs: $codecs, videoCodec: $videoCodec, audioCodec: $audioCodec, isLive: $isLive, isHls: $isHls, isDashMpd: $isDashMpd, highReplication: $highReplication, width: $width, height: $height, fps: $fps, colorInfo: $colorInfo)';
}


}

/// @nodoc
abstract mixin class _$Mp3CopyWith<$Res> implements $Mp3CopyWith<$Res> {
  factory _$Mp3CopyWith(_Mp3 value, $Res Function(_Mp3) _then) = __$Mp3CopyWithImpl;
@override @useResult
$Res call({
 String mimeType, String? qualityLabel, int bitrate, int? audioBitrate, int itag, Range initRange, Range indexRange, String lastModified, String contentLength, String quality, ProjectionType projectionType, int averageBitrate, String? audioQuality, String approxDurationMs, String? audioSampleRate, int? audioChannels, double? loudnessDb, String url, bool hasVideo, bool hasAudio, Container container, String codecs, String? videoCodec, String? audioCodec, bool isLive, bool isHls, bool isDashMpd, bool? highReplication, int? width, int? height, int? fps, ColorInfo? colorInfo
});


@override $RangeCopyWith<$Res> get initRange;@override $RangeCopyWith<$Res> get indexRange;@override $ColorInfoCopyWith<$Res>? get colorInfo;

}
/// @nodoc
class __$Mp3CopyWithImpl<$Res>
    implements _$Mp3CopyWith<$Res> {
  __$Mp3CopyWithImpl(this._self, this._then);

  final _Mp3 _self;
  final $Res Function(_Mp3) _then;

/// Create a copy of Mp3
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mimeType = null,Object? qualityLabel = freezed,Object? bitrate = null,Object? audioBitrate = freezed,Object? itag = null,Object? initRange = null,Object? indexRange = null,Object? lastModified = null,Object? contentLength = null,Object? quality = null,Object? projectionType = null,Object? averageBitrate = null,Object? audioQuality = freezed,Object? approxDurationMs = null,Object? audioSampleRate = freezed,Object? audioChannels = freezed,Object? loudnessDb = freezed,Object? url = null,Object? hasVideo = null,Object? hasAudio = null,Object? container = null,Object? codecs = null,Object? videoCodec = freezed,Object? audioCodec = freezed,Object? isLive = null,Object? isHls = null,Object? isDashMpd = null,Object? highReplication = freezed,Object? width = freezed,Object? height = freezed,Object? fps = freezed,Object? colorInfo = freezed,}) {
  return _then(_Mp3(
mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,qualityLabel: freezed == qualityLabel ? _self.qualityLabel : qualityLabel // ignore: cast_nullable_to_non_nullable
as String?,bitrate: null == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int,audioBitrate: freezed == audioBitrate ? _self.audioBitrate : audioBitrate // ignore: cast_nullable_to_non_nullable
as int?,itag: null == itag ? _self.itag : itag // ignore: cast_nullable_to_non_nullable
as int,initRange: null == initRange ? _self.initRange : initRange // ignore: cast_nullable_to_non_nullable
as Range,indexRange: null == indexRange ? _self.indexRange : indexRange // ignore: cast_nullable_to_non_nullable
as Range,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as String,contentLength: null == contentLength ? _self.contentLength : contentLength // ignore: cast_nullable_to_non_nullable
as String,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String,projectionType: null == projectionType ? _self.projectionType : projectionType // ignore: cast_nullable_to_non_nullable
as ProjectionType,averageBitrate: null == averageBitrate ? _self.averageBitrate : averageBitrate // ignore: cast_nullable_to_non_nullable
as int,audioQuality: freezed == audioQuality ? _self.audioQuality : audioQuality // ignore: cast_nullable_to_non_nullable
as String?,approxDurationMs: null == approxDurationMs ? _self.approxDurationMs : approxDurationMs // ignore: cast_nullable_to_non_nullable
as String,audioSampleRate: freezed == audioSampleRate ? _self.audioSampleRate : audioSampleRate // ignore: cast_nullable_to_non_nullable
as String?,audioChannels: freezed == audioChannels ? _self.audioChannels : audioChannels // ignore: cast_nullable_to_non_nullable
as int?,loudnessDb: freezed == loudnessDb ? _self.loudnessDb : loudnessDb // ignore: cast_nullable_to_non_nullable
as double?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,hasVideo: null == hasVideo ? _self.hasVideo : hasVideo // ignore: cast_nullable_to_non_nullable
as bool,hasAudio: null == hasAudio ? _self.hasAudio : hasAudio // ignore: cast_nullable_to_non_nullable
as bool,container: null == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as Container,codecs: null == codecs ? _self.codecs : codecs // ignore: cast_nullable_to_non_nullable
as String,videoCodec: freezed == videoCodec ? _self.videoCodec : videoCodec // ignore: cast_nullable_to_non_nullable
as String?,audioCodec: freezed == audioCodec ? _self.audioCodec : audioCodec // ignore: cast_nullable_to_non_nullable
as String?,isLive: null == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool,isHls: null == isHls ? _self.isHls : isHls // ignore: cast_nullable_to_non_nullable
as bool,isDashMpd: null == isDashMpd ? _self.isDashMpd : isDashMpd // ignore: cast_nullable_to_non_nullable
as bool,highReplication: freezed == highReplication ? _self.highReplication : highReplication // ignore: cast_nullable_to_non_nullable
as bool?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,fps: freezed == fps ? _self.fps : fps // ignore: cast_nullable_to_non_nullable
as int?,colorInfo: freezed == colorInfo ? _self.colorInfo : colorInfo // ignore: cast_nullable_to_non_nullable
as ColorInfo?,
  ));
}

/// Create a copy of Mp3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RangeCopyWith<$Res> get initRange {
  
  return $RangeCopyWith<$Res>(_self.initRange, (value) {
    return _then(_self.copyWith(initRange: value));
  });
}/// Create a copy of Mp3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RangeCopyWith<$Res> get indexRange {
  
  return $RangeCopyWith<$Res>(_self.indexRange, (value) {
    return _then(_self.copyWith(indexRange: value));
  });
}/// Create a copy of Mp3
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ColorInfoCopyWith<$Res>? get colorInfo {
    if (_self.colorInfo == null) {
    return null;
  }

  return $ColorInfoCopyWith<$Res>(_self.colorInfo!, (value) {
    return _then(_self.copyWith(colorInfo: value));
  });
}
}


/// @nodoc
mixin _$ColorInfo {

 Primaries get primaries; TransferCharacteristics get transferCharacteristics; MatrixCoefficients get matrixCoefficients;
/// Create a copy of ColorInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorInfoCopyWith<ColorInfo> get copyWith => _$ColorInfoCopyWithImpl<ColorInfo>(this as ColorInfo, _$identity);

  /// Serializes this ColorInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorInfo&&(identical(other.primaries, primaries) || other.primaries == primaries)&&(identical(other.transferCharacteristics, transferCharacteristics) || other.transferCharacteristics == transferCharacteristics)&&(identical(other.matrixCoefficients, matrixCoefficients) || other.matrixCoefficients == matrixCoefficients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primaries,transferCharacteristics,matrixCoefficients);

@override
String toString() {
  return 'ColorInfo(primaries: $primaries, transferCharacteristics: $transferCharacteristics, matrixCoefficients: $matrixCoefficients)';
}


}

/// @nodoc
abstract mixin class $ColorInfoCopyWith<$Res>  {
  factory $ColorInfoCopyWith(ColorInfo value, $Res Function(ColorInfo) _then) = _$ColorInfoCopyWithImpl;
@useResult
$Res call({
 Primaries primaries, TransferCharacteristics transferCharacteristics, MatrixCoefficients matrixCoefficients
});




}
/// @nodoc
class _$ColorInfoCopyWithImpl<$Res>
    implements $ColorInfoCopyWith<$Res> {
  _$ColorInfoCopyWithImpl(this._self, this._then);

  final ColorInfo _self;
  final $Res Function(ColorInfo) _then;

/// Create a copy of ColorInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primaries = null,Object? transferCharacteristics = null,Object? matrixCoefficients = null,}) {
  return _then(_self.copyWith(
primaries: null == primaries ? _self.primaries : primaries // ignore: cast_nullable_to_non_nullable
as Primaries,transferCharacteristics: null == transferCharacteristics ? _self.transferCharacteristics : transferCharacteristics // ignore: cast_nullable_to_non_nullable
as TransferCharacteristics,matrixCoefficients: null == matrixCoefficients ? _self.matrixCoefficients : matrixCoefficients // ignore: cast_nullable_to_non_nullable
as MatrixCoefficients,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ColorInfo implements ColorInfo {
  const _ColorInfo({required this.primaries, required this.transferCharacteristics, required this.matrixCoefficients});
  factory _ColorInfo.fromJson(Map<String, dynamic> json) => _$ColorInfoFromJson(json);

@override final  Primaries primaries;
@override final  TransferCharacteristics transferCharacteristics;
@override final  MatrixCoefficients matrixCoefficients;

/// Create a copy of ColorInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorInfoCopyWith<_ColorInfo> get copyWith => __$ColorInfoCopyWithImpl<_ColorInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColorInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorInfo&&(identical(other.primaries, primaries) || other.primaries == primaries)&&(identical(other.transferCharacteristics, transferCharacteristics) || other.transferCharacteristics == transferCharacteristics)&&(identical(other.matrixCoefficients, matrixCoefficients) || other.matrixCoefficients == matrixCoefficients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primaries,transferCharacteristics,matrixCoefficients);

@override
String toString() {
  return 'ColorInfo(primaries: $primaries, transferCharacteristics: $transferCharacteristics, matrixCoefficients: $matrixCoefficients)';
}


}

/// @nodoc
abstract mixin class _$ColorInfoCopyWith<$Res> implements $ColorInfoCopyWith<$Res> {
  factory _$ColorInfoCopyWith(_ColorInfo value, $Res Function(_ColorInfo) _then) = __$ColorInfoCopyWithImpl;
@override @useResult
$Res call({
 Primaries primaries, TransferCharacteristics transferCharacteristics, MatrixCoefficients matrixCoefficients
});




}
/// @nodoc
class __$ColorInfoCopyWithImpl<$Res>
    implements _$ColorInfoCopyWith<$Res> {
  __$ColorInfoCopyWithImpl(this._self, this._then);

  final _ColorInfo _self;
  final $Res Function(_ColorInfo) _then;

/// Create a copy of ColorInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primaries = null,Object? transferCharacteristics = null,Object? matrixCoefficients = null,}) {
  return _then(_ColorInfo(
primaries: null == primaries ? _self.primaries : primaries // ignore: cast_nullable_to_non_nullable
as Primaries,transferCharacteristics: null == transferCharacteristics ? _self.transferCharacteristics : transferCharacteristics // ignore: cast_nullable_to_non_nullable
as TransferCharacteristics,matrixCoefficients: null == matrixCoefficients ? _self.matrixCoefficients : matrixCoefficients // ignore: cast_nullable_to_non_nullable
as MatrixCoefficients,
  ));
}


}


/// @nodoc
mixin _$Range {

 String get start; String get end;
/// Create a copy of Range
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RangeCopyWith<Range> get copyWith => _$RangeCopyWithImpl<Range>(this as Range, _$identity);

  /// Serializes this Range to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Range&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'Range(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $RangeCopyWith<$Res>  {
  factory $RangeCopyWith(Range value, $Res Function(Range) _then) = _$RangeCopyWithImpl;
@useResult
$Res call({
 String start, String end
});




}
/// @nodoc
class _$RangeCopyWithImpl<$Res>
    implements $RangeCopyWith<$Res> {
  _$RangeCopyWithImpl(this._self, this._then);

  final Range _self;
  final $Res Function(Range) _then;

/// Create a copy of Range
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Range implements Range {
  const _Range({required this.start, required this.end});
  factory _Range.fromJson(Map<String, dynamic> json) => _$RangeFromJson(json);

@override final  String start;
@override final  String end;

/// Create a copy of Range
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RangeCopyWith<_Range> get copyWith => __$RangeCopyWithImpl<_Range>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RangeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Range&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'Range(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$RangeCopyWith<$Res> implements $RangeCopyWith<$Res> {
  factory _$RangeCopyWith(_Range value, $Res Function(_Range) _then) = __$RangeCopyWithImpl;
@override @useResult
$Res call({
 String start, String end
});




}
/// @nodoc
class __$RangeCopyWithImpl<$Res>
    implements _$RangeCopyWith<$Res> {
  __$RangeCopyWithImpl(this._self, this._then);

  final _Range _self;
  final $Res Function(_Range) _then;

/// Create a copy of Range
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_Range(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
