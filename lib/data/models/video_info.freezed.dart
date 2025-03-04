// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoInfo _$VideoInfoFromJson(Map<String, dynamic> json) {
  return _VideoInfo.fromJson(json);
}

/// @nodoc
mixin _$VideoInfo {
  String? get creator => throw _privateConstructorUsedError;
  List<Mp3>? get mp4 => throw _privateConstructorUsedError;
  List<Mp3>? get mp3 => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this VideoInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoInfoCopyWith<VideoInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoInfoCopyWith<$Res> {
  factory $VideoInfoCopyWith(VideoInfo value, $Res Function(VideoInfo) then) =
      _$VideoInfoCopyWithImpl<$Res, VideoInfo>;
  @useResult
  $Res call({String? creator, List<Mp3>? mp4, List<Mp3>? mp3, String? error});
}

/// @nodoc
class _$VideoInfoCopyWithImpl<$Res, $Val extends VideoInfo>
    implements $VideoInfoCopyWith<$Res> {
  _$VideoInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creator = freezed,
    Object? mp4 = freezed,
    Object? mp3 = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String?,
      mp4: freezed == mp4
          ? _value.mp4
          : mp4 // ignore: cast_nullable_to_non_nullable
              as List<Mp3>?,
      mp3: freezed == mp3
          ? _value.mp3
          : mp3 // ignore: cast_nullable_to_non_nullable
              as List<Mp3>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoInfoImplCopyWith<$Res>
    implements $VideoInfoCopyWith<$Res> {
  factory _$$VideoInfoImplCopyWith(
          _$VideoInfoImpl value, $Res Function(_$VideoInfoImpl) then) =
      __$$VideoInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? creator, List<Mp3>? mp4, List<Mp3>? mp3, String? error});
}

/// @nodoc
class __$$VideoInfoImplCopyWithImpl<$Res>
    extends _$VideoInfoCopyWithImpl<$Res, _$VideoInfoImpl>
    implements _$$VideoInfoImplCopyWith<$Res> {
  __$$VideoInfoImplCopyWithImpl(
      _$VideoInfoImpl _value, $Res Function(_$VideoInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creator = freezed,
    Object? mp4 = freezed,
    Object? mp3 = freezed,
    Object? error = freezed,
  }) {
    return _then(_$VideoInfoImpl(
      creator: freezed == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String?,
      mp4: freezed == mp4
          ? _value._mp4
          : mp4 // ignore: cast_nullable_to_non_nullable
              as List<Mp3>?,
      mp3: freezed == mp3
          ? _value._mp3
          : mp3 // ignore: cast_nullable_to_non_nullable
              as List<Mp3>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoInfoImpl implements _VideoInfo {
  const _$VideoInfoImpl(
      {this.creator, final List<Mp3>? mp4, final List<Mp3>? mp3, this.error})
      : _mp4 = mp4,
        _mp3 = mp3;

  factory _$VideoInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoInfoImplFromJson(json);

  @override
  final String? creator;
  final List<Mp3>? _mp4;
  @override
  List<Mp3>? get mp4 {
    final value = _mp4;
    if (value == null) return null;
    if (_mp4 is EqualUnmodifiableListView) return _mp4;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Mp3>? _mp3;
  @override
  List<Mp3>? get mp3 {
    final value = _mp3;
    if (value == null) return null;
    if (_mp3 is EqualUnmodifiableListView) return _mp3;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'VideoInfo(creator: $creator, mp4: $mp4, mp3: $mp3, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoInfoImpl &&
            (identical(other.creator, creator) || other.creator == creator) &&
            const DeepCollectionEquality().equals(other._mp4, _mp4) &&
            const DeepCollectionEquality().equals(other._mp3, _mp3) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      creator,
      const DeepCollectionEquality().hash(_mp4),
      const DeepCollectionEquality().hash(_mp3),
      error);

  /// Create a copy of VideoInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoInfoImplCopyWith<_$VideoInfoImpl> get copyWith =>
      __$$VideoInfoImplCopyWithImpl<_$VideoInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoInfoImplToJson(
      this,
    );
  }
}

abstract class _VideoInfo implements VideoInfo {
  const factory _VideoInfo(
      {final String? creator,
      final List<Mp3>? mp4,
      final List<Mp3>? mp3,
      final String? error}) = _$VideoInfoImpl;

  factory _VideoInfo.fromJson(Map<String, dynamic> json) =
      _$VideoInfoImpl.fromJson;

  @override
  String? get creator;
  @override
  List<Mp3>? get mp4;
  @override
  List<Mp3>? get mp3;
  @override
  String? get error;

  /// Create a copy of VideoInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoInfoImplCopyWith<_$VideoInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Mp3 _$Mp3FromJson(Map<String, dynamic> json) {
  return _Mp3.fromJson(json);
}

/// @nodoc
mixin _$Mp3 {
  String get mimeType => throw _privateConstructorUsedError;
  String? get qualityLabel => throw _privateConstructorUsedError;
  int get bitrate => throw _privateConstructorUsedError;
  int? get audioBitrate => throw _privateConstructorUsedError;
  int get itag => throw _privateConstructorUsedError;
  Range get initRange => throw _privateConstructorUsedError;
  Range get indexRange => throw _privateConstructorUsedError;
  String get lastModified => throw _privateConstructorUsedError;
  String get contentLength => throw _privateConstructorUsedError;
  String get quality => throw _privateConstructorUsedError;
  ProjectionType get projectionType => throw _privateConstructorUsedError;
  int get averageBitrate => throw _privateConstructorUsedError;
  String? get audioQuality => throw _privateConstructorUsedError;
  String get approxDurationMs => throw _privateConstructorUsedError;
  String? get audioSampleRate => throw _privateConstructorUsedError;
  int? get audioChannels => throw _privateConstructorUsedError;
  double? get loudnessDb => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  bool get hasVideo => throw _privateConstructorUsedError;
  bool get hasAudio => throw _privateConstructorUsedError;
  Container get container => throw _privateConstructorUsedError;
  String get codecs => throw _privateConstructorUsedError;
  String? get videoCodec => throw _privateConstructorUsedError;
  String? get audioCodec => throw _privateConstructorUsedError;
  bool get isLive => throw _privateConstructorUsedError;
  bool get isHls => throw _privateConstructorUsedError;
  bool get isDashMpd => throw _privateConstructorUsedError;
  bool? get highReplication => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get fps => throw _privateConstructorUsedError;
  ColorInfo? get colorInfo => throw _privateConstructorUsedError;

  /// Serializes this Mp3 to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Mp3
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Mp3CopyWith<Mp3> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Mp3CopyWith<$Res> {
  factory $Mp3CopyWith(Mp3 value, $Res Function(Mp3) then) =
      _$Mp3CopyWithImpl<$Res, Mp3>;
  @useResult
  $Res call(
      {String mimeType,
      String? qualityLabel,
      int bitrate,
      int? audioBitrate,
      int itag,
      Range initRange,
      Range indexRange,
      String lastModified,
      String contentLength,
      String quality,
      ProjectionType projectionType,
      int averageBitrate,
      String? audioQuality,
      String approxDurationMs,
      String? audioSampleRate,
      int? audioChannels,
      double? loudnessDb,
      String url,
      bool hasVideo,
      bool hasAudio,
      Container container,
      String codecs,
      String? videoCodec,
      String? audioCodec,
      bool isLive,
      bool isHls,
      bool isDashMpd,
      bool? highReplication,
      int? width,
      int? height,
      int? fps,
      ColorInfo? colorInfo});

  $RangeCopyWith<$Res> get initRange;
  $RangeCopyWith<$Res> get indexRange;
  $ColorInfoCopyWith<$Res>? get colorInfo;
}

/// @nodoc
class _$Mp3CopyWithImpl<$Res, $Val extends Mp3> implements $Mp3CopyWith<$Res> {
  _$Mp3CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Mp3
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mimeType = null,
    Object? qualityLabel = freezed,
    Object? bitrate = null,
    Object? audioBitrate = freezed,
    Object? itag = null,
    Object? initRange = null,
    Object? indexRange = null,
    Object? lastModified = null,
    Object? contentLength = null,
    Object? quality = null,
    Object? projectionType = null,
    Object? averageBitrate = null,
    Object? audioQuality = freezed,
    Object? approxDurationMs = null,
    Object? audioSampleRate = freezed,
    Object? audioChannels = freezed,
    Object? loudnessDb = freezed,
    Object? url = null,
    Object? hasVideo = null,
    Object? hasAudio = null,
    Object? container = null,
    Object? codecs = null,
    Object? videoCodec = freezed,
    Object? audioCodec = freezed,
    Object? isLive = null,
    Object? isHls = null,
    Object? isDashMpd = null,
    Object? highReplication = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? fps = freezed,
    Object? colorInfo = freezed,
  }) {
    return _then(_value.copyWith(
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      qualityLabel: freezed == qualityLabel
          ? _value.qualityLabel
          : qualityLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      bitrate: null == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as int,
      audioBitrate: freezed == audioBitrate
          ? _value.audioBitrate
          : audioBitrate // ignore: cast_nullable_to_non_nullable
              as int?,
      itag: null == itag
          ? _value.itag
          : itag // ignore: cast_nullable_to_non_nullable
              as int,
      initRange: null == initRange
          ? _value.initRange
          : initRange // ignore: cast_nullable_to_non_nullable
              as Range,
      indexRange: null == indexRange
          ? _value.indexRange
          : indexRange // ignore: cast_nullable_to_non_nullable
              as Range,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as String,
      contentLength: null == contentLength
          ? _value.contentLength
          : contentLength // ignore: cast_nullable_to_non_nullable
              as String,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
      projectionType: null == projectionType
          ? _value.projectionType
          : projectionType // ignore: cast_nullable_to_non_nullable
              as ProjectionType,
      averageBitrate: null == averageBitrate
          ? _value.averageBitrate
          : averageBitrate // ignore: cast_nullable_to_non_nullable
              as int,
      audioQuality: freezed == audioQuality
          ? _value.audioQuality
          : audioQuality // ignore: cast_nullable_to_non_nullable
              as String?,
      approxDurationMs: null == approxDurationMs
          ? _value.approxDurationMs
          : approxDurationMs // ignore: cast_nullable_to_non_nullable
              as String,
      audioSampleRate: freezed == audioSampleRate
          ? _value.audioSampleRate
          : audioSampleRate // ignore: cast_nullable_to_non_nullable
              as String?,
      audioChannels: freezed == audioChannels
          ? _value.audioChannels
          : audioChannels // ignore: cast_nullable_to_non_nullable
              as int?,
      loudnessDb: freezed == loudnessDb
          ? _value.loudnessDb
          : loudnessDb // ignore: cast_nullable_to_non_nullable
              as double?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      hasVideo: null == hasVideo
          ? _value.hasVideo
          : hasVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      hasAudio: null == hasAudio
          ? _value.hasAudio
          : hasAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      container: null == container
          ? _value.container
          : container // ignore: cast_nullable_to_non_nullable
              as Container,
      codecs: null == codecs
          ? _value.codecs
          : codecs // ignore: cast_nullable_to_non_nullable
              as String,
      videoCodec: freezed == videoCodec
          ? _value.videoCodec
          : videoCodec // ignore: cast_nullable_to_non_nullable
              as String?,
      audioCodec: freezed == audioCodec
          ? _value.audioCodec
          : audioCodec // ignore: cast_nullable_to_non_nullable
              as String?,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      isHls: null == isHls
          ? _value.isHls
          : isHls // ignore: cast_nullable_to_non_nullable
              as bool,
      isDashMpd: null == isDashMpd
          ? _value.isDashMpd
          : isDashMpd // ignore: cast_nullable_to_non_nullable
              as bool,
      highReplication: freezed == highReplication
          ? _value.highReplication
          : highReplication // ignore: cast_nullable_to_non_nullable
              as bool?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      fps: freezed == fps
          ? _value.fps
          : fps // ignore: cast_nullable_to_non_nullable
              as int?,
      colorInfo: freezed == colorInfo
          ? _value.colorInfo
          : colorInfo // ignore: cast_nullable_to_non_nullable
              as ColorInfo?,
    ) as $Val);
  }

  /// Create a copy of Mp3
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeCopyWith<$Res> get initRange {
    return $RangeCopyWith<$Res>(_value.initRange, (value) {
      return _then(_value.copyWith(initRange: value) as $Val);
    });
  }

  /// Create a copy of Mp3
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RangeCopyWith<$Res> get indexRange {
    return $RangeCopyWith<$Res>(_value.indexRange, (value) {
      return _then(_value.copyWith(indexRange: value) as $Val);
    });
  }

  /// Create a copy of Mp3
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ColorInfoCopyWith<$Res>? get colorInfo {
    if (_value.colorInfo == null) {
      return null;
    }

    return $ColorInfoCopyWith<$Res>(_value.colorInfo!, (value) {
      return _then(_value.copyWith(colorInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$Mp3ImplCopyWith<$Res> implements $Mp3CopyWith<$Res> {
  factory _$$Mp3ImplCopyWith(_$Mp3Impl value, $Res Function(_$Mp3Impl) then) =
      __$$Mp3ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mimeType,
      String? qualityLabel,
      int bitrate,
      int? audioBitrate,
      int itag,
      Range initRange,
      Range indexRange,
      String lastModified,
      String contentLength,
      String quality,
      ProjectionType projectionType,
      int averageBitrate,
      String? audioQuality,
      String approxDurationMs,
      String? audioSampleRate,
      int? audioChannels,
      double? loudnessDb,
      String url,
      bool hasVideo,
      bool hasAudio,
      Container container,
      String codecs,
      String? videoCodec,
      String? audioCodec,
      bool isLive,
      bool isHls,
      bool isDashMpd,
      bool? highReplication,
      int? width,
      int? height,
      int? fps,
      ColorInfo? colorInfo});

  @override
  $RangeCopyWith<$Res> get initRange;
  @override
  $RangeCopyWith<$Res> get indexRange;
  @override
  $ColorInfoCopyWith<$Res>? get colorInfo;
}

/// @nodoc
class __$$Mp3ImplCopyWithImpl<$Res> extends _$Mp3CopyWithImpl<$Res, _$Mp3Impl>
    implements _$$Mp3ImplCopyWith<$Res> {
  __$$Mp3ImplCopyWithImpl(_$Mp3Impl _value, $Res Function(_$Mp3Impl) _then)
      : super(_value, _then);

  /// Create a copy of Mp3
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mimeType = null,
    Object? qualityLabel = freezed,
    Object? bitrate = null,
    Object? audioBitrate = freezed,
    Object? itag = null,
    Object? initRange = null,
    Object? indexRange = null,
    Object? lastModified = null,
    Object? contentLength = null,
    Object? quality = null,
    Object? projectionType = null,
    Object? averageBitrate = null,
    Object? audioQuality = freezed,
    Object? approxDurationMs = null,
    Object? audioSampleRate = freezed,
    Object? audioChannels = freezed,
    Object? loudnessDb = freezed,
    Object? url = null,
    Object? hasVideo = null,
    Object? hasAudio = null,
    Object? container = null,
    Object? codecs = null,
    Object? videoCodec = freezed,
    Object? audioCodec = freezed,
    Object? isLive = null,
    Object? isHls = null,
    Object? isDashMpd = null,
    Object? highReplication = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? fps = freezed,
    Object? colorInfo = freezed,
  }) {
    return _then(_$Mp3Impl(
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
      qualityLabel: freezed == qualityLabel
          ? _value.qualityLabel
          : qualityLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      bitrate: null == bitrate
          ? _value.bitrate
          : bitrate // ignore: cast_nullable_to_non_nullable
              as int,
      audioBitrate: freezed == audioBitrate
          ? _value.audioBitrate
          : audioBitrate // ignore: cast_nullable_to_non_nullable
              as int?,
      itag: null == itag
          ? _value.itag
          : itag // ignore: cast_nullable_to_non_nullable
              as int,
      initRange: null == initRange
          ? _value.initRange
          : initRange // ignore: cast_nullable_to_non_nullable
              as Range,
      indexRange: null == indexRange
          ? _value.indexRange
          : indexRange // ignore: cast_nullable_to_non_nullable
              as Range,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as String,
      contentLength: null == contentLength
          ? _value.contentLength
          : contentLength // ignore: cast_nullable_to_non_nullable
              as String,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
      projectionType: null == projectionType
          ? _value.projectionType
          : projectionType // ignore: cast_nullable_to_non_nullable
              as ProjectionType,
      averageBitrate: null == averageBitrate
          ? _value.averageBitrate
          : averageBitrate // ignore: cast_nullable_to_non_nullable
              as int,
      audioQuality: freezed == audioQuality
          ? _value.audioQuality
          : audioQuality // ignore: cast_nullable_to_non_nullable
              as String?,
      approxDurationMs: null == approxDurationMs
          ? _value.approxDurationMs
          : approxDurationMs // ignore: cast_nullable_to_non_nullable
              as String,
      audioSampleRate: freezed == audioSampleRate
          ? _value.audioSampleRate
          : audioSampleRate // ignore: cast_nullable_to_non_nullable
              as String?,
      audioChannels: freezed == audioChannels
          ? _value.audioChannels
          : audioChannels // ignore: cast_nullable_to_non_nullable
              as int?,
      loudnessDb: freezed == loudnessDb
          ? _value.loudnessDb
          : loudnessDb // ignore: cast_nullable_to_non_nullable
              as double?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      hasVideo: null == hasVideo
          ? _value.hasVideo
          : hasVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      hasAudio: null == hasAudio
          ? _value.hasAudio
          : hasAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      container: null == container
          ? _value.container
          : container // ignore: cast_nullable_to_non_nullable
              as Container,
      codecs: null == codecs
          ? _value.codecs
          : codecs // ignore: cast_nullable_to_non_nullable
              as String,
      videoCodec: freezed == videoCodec
          ? _value.videoCodec
          : videoCodec // ignore: cast_nullable_to_non_nullable
              as String?,
      audioCodec: freezed == audioCodec
          ? _value.audioCodec
          : audioCodec // ignore: cast_nullable_to_non_nullable
              as String?,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
      isHls: null == isHls
          ? _value.isHls
          : isHls // ignore: cast_nullable_to_non_nullable
              as bool,
      isDashMpd: null == isDashMpd
          ? _value.isDashMpd
          : isDashMpd // ignore: cast_nullable_to_non_nullable
              as bool,
      highReplication: freezed == highReplication
          ? _value.highReplication
          : highReplication // ignore: cast_nullable_to_non_nullable
              as bool?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      fps: freezed == fps
          ? _value.fps
          : fps // ignore: cast_nullable_to_non_nullable
              as int?,
      colorInfo: freezed == colorInfo
          ? _value.colorInfo
          : colorInfo // ignore: cast_nullable_to_non_nullable
              as ColorInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Mp3Impl implements _Mp3 {
  const _$Mp3Impl(
      {required this.mimeType,
      required this.qualityLabel,
      required this.bitrate,
      this.audioBitrate,
      required this.itag,
      required this.initRange,
      required this.indexRange,
      required this.lastModified,
      required this.contentLength,
      required this.quality,
      required this.projectionType,
      required this.averageBitrate,
      this.audioQuality,
      required this.approxDurationMs,
      this.audioSampleRate,
      this.audioChannels,
      this.loudnessDb,
      required this.url,
      required this.hasVideo,
      required this.hasAudio,
      required this.container,
      required this.codecs,
      required this.videoCodec,
      required this.audioCodec,
      required this.isLive,
      required this.isHls,
      required this.isDashMpd,
      this.highReplication,
      this.width,
      this.height,
      this.fps,
      this.colorInfo});

  factory _$Mp3Impl.fromJson(Map<String, dynamic> json) =>
      _$$Mp3ImplFromJson(json);

  @override
  final String mimeType;
  @override
  final String? qualityLabel;
  @override
  final int bitrate;
  @override
  final int? audioBitrate;
  @override
  final int itag;
  @override
  final Range initRange;
  @override
  final Range indexRange;
  @override
  final String lastModified;
  @override
  final String contentLength;
  @override
  final String quality;
  @override
  final ProjectionType projectionType;
  @override
  final int averageBitrate;
  @override
  final String? audioQuality;
  @override
  final String approxDurationMs;
  @override
  final String? audioSampleRate;
  @override
  final int? audioChannels;
  @override
  final double? loudnessDb;
  @override
  final String url;
  @override
  final bool hasVideo;
  @override
  final bool hasAudio;
  @override
  final Container container;
  @override
  final String codecs;
  @override
  final String? videoCodec;
  @override
  final String? audioCodec;
  @override
  final bool isLive;
  @override
  final bool isHls;
  @override
  final bool isDashMpd;
  @override
  final bool? highReplication;
  @override
  final int? width;
  @override
  final int? height;
  @override
  final int? fps;
  @override
  final ColorInfo? colorInfo;

  @override
  String toString() {
    return 'Mp3(mimeType: $mimeType, qualityLabel: $qualityLabel, bitrate: $bitrate, audioBitrate: $audioBitrate, itag: $itag, initRange: $initRange, indexRange: $indexRange, lastModified: $lastModified, contentLength: $contentLength, quality: $quality, projectionType: $projectionType, averageBitrate: $averageBitrate, audioQuality: $audioQuality, approxDurationMs: $approxDurationMs, audioSampleRate: $audioSampleRate, audioChannels: $audioChannels, loudnessDb: $loudnessDb, url: $url, hasVideo: $hasVideo, hasAudio: $hasAudio, container: $container, codecs: $codecs, videoCodec: $videoCodec, audioCodec: $audioCodec, isLive: $isLive, isHls: $isHls, isDashMpd: $isDashMpd, highReplication: $highReplication, width: $width, height: $height, fps: $fps, colorInfo: $colorInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Mp3Impl &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.qualityLabel, qualityLabel) ||
                other.qualityLabel == qualityLabel) &&
            (identical(other.bitrate, bitrate) || other.bitrate == bitrate) &&
            (identical(other.audioBitrate, audioBitrate) ||
                other.audioBitrate == audioBitrate) &&
            (identical(other.itag, itag) || other.itag == itag) &&
            (identical(other.initRange, initRange) ||
                other.initRange == initRange) &&
            (identical(other.indexRange, indexRange) ||
                other.indexRange == indexRange) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified) &&
            (identical(other.contentLength, contentLength) ||
                other.contentLength == contentLength) &&
            (identical(other.quality, quality) || other.quality == quality) &&
            (identical(other.projectionType, projectionType) ||
                other.projectionType == projectionType) &&
            (identical(other.averageBitrate, averageBitrate) ||
                other.averageBitrate == averageBitrate) &&
            (identical(other.audioQuality, audioQuality) ||
                other.audioQuality == audioQuality) &&
            (identical(other.approxDurationMs, approxDurationMs) ||
                other.approxDurationMs == approxDurationMs) &&
            (identical(other.audioSampleRate, audioSampleRate) ||
                other.audioSampleRate == audioSampleRate) &&
            (identical(other.audioChannels, audioChannels) ||
                other.audioChannels == audioChannels) &&
            (identical(other.loudnessDb, loudnessDb) ||
                other.loudnessDb == loudnessDb) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.hasVideo, hasVideo) ||
                other.hasVideo == hasVideo) &&
            (identical(other.hasAudio, hasAudio) ||
                other.hasAudio == hasAudio) &&
            (identical(other.container, container) ||
                other.container == container) &&
            (identical(other.codecs, codecs) || other.codecs == codecs) &&
            (identical(other.videoCodec, videoCodec) ||
                other.videoCodec == videoCodec) &&
            (identical(other.audioCodec, audioCodec) ||
                other.audioCodec == audioCodec) &&
            (identical(other.isLive, isLive) || other.isLive == isLive) &&
            (identical(other.isHls, isHls) || other.isHls == isHls) &&
            (identical(other.isDashMpd, isDashMpd) ||
                other.isDashMpd == isDashMpd) &&
            (identical(other.highReplication, highReplication) ||
                other.highReplication == highReplication) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.fps, fps) || other.fps == fps) &&
            (identical(other.colorInfo, colorInfo) ||
                other.colorInfo == colorInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        mimeType,
        qualityLabel,
        bitrate,
        audioBitrate,
        itag,
        initRange,
        indexRange,
        lastModified,
        contentLength,
        quality,
        projectionType,
        averageBitrate,
        audioQuality,
        approxDurationMs,
        audioSampleRate,
        audioChannels,
        loudnessDb,
        url,
        hasVideo,
        hasAudio,
        container,
        codecs,
        videoCodec,
        audioCodec,
        isLive,
        isHls,
        isDashMpd,
        highReplication,
        width,
        height,
        fps,
        colorInfo
      ]);

  /// Create a copy of Mp3
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Mp3ImplCopyWith<_$Mp3Impl> get copyWith =>
      __$$Mp3ImplCopyWithImpl<_$Mp3Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Mp3ImplToJson(
      this,
    );
  }
}

abstract class _Mp3 implements Mp3 {
  const factory _Mp3(
      {required final String mimeType,
      required final String? qualityLabel,
      required final int bitrate,
      final int? audioBitrate,
      required final int itag,
      required final Range initRange,
      required final Range indexRange,
      required final String lastModified,
      required final String contentLength,
      required final String quality,
      required final ProjectionType projectionType,
      required final int averageBitrate,
      final String? audioQuality,
      required final String approxDurationMs,
      final String? audioSampleRate,
      final int? audioChannels,
      final double? loudnessDb,
      required final String url,
      required final bool hasVideo,
      required final bool hasAudio,
      required final Container container,
      required final String codecs,
      required final String? videoCodec,
      required final String? audioCodec,
      required final bool isLive,
      required final bool isHls,
      required final bool isDashMpd,
      final bool? highReplication,
      final int? width,
      final int? height,
      final int? fps,
      final ColorInfo? colorInfo}) = _$Mp3Impl;

  factory _Mp3.fromJson(Map<String, dynamic> json) = _$Mp3Impl.fromJson;

  @override
  String get mimeType;
  @override
  String? get qualityLabel;
  @override
  int get bitrate;
  @override
  int? get audioBitrate;
  @override
  int get itag;
  @override
  Range get initRange;
  @override
  Range get indexRange;
  @override
  String get lastModified;
  @override
  String get contentLength;
  @override
  String get quality;
  @override
  ProjectionType get projectionType;
  @override
  int get averageBitrate;
  @override
  String? get audioQuality;
  @override
  String get approxDurationMs;
  @override
  String? get audioSampleRate;
  @override
  int? get audioChannels;
  @override
  double? get loudnessDb;
  @override
  String get url;
  @override
  bool get hasVideo;
  @override
  bool get hasAudio;
  @override
  Container get container;
  @override
  String get codecs;
  @override
  String? get videoCodec;
  @override
  String? get audioCodec;
  @override
  bool get isLive;
  @override
  bool get isHls;
  @override
  bool get isDashMpd;
  @override
  bool? get highReplication;
  @override
  int? get width;
  @override
  int? get height;
  @override
  int? get fps;
  @override
  ColorInfo? get colorInfo;

  /// Create a copy of Mp3
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Mp3ImplCopyWith<_$Mp3Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

ColorInfo _$ColorInfoFromJson(Map<String, dynamic> json) {
  return _ColorInfo.fromJson(json);
}

/// @nodoc
mixin _$ColorInfo {
  Primaries get primaries => throw _privateConstructorUsedError;
  TransferCharacteristics get transferCharacteristics =>
      throw _privateConstructorUsedError;
  MatrixCoefficients get matrixCoefficients =>
      throw _privateConstructorUsedError;

  /// Serializes this ColorInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ColorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorInfoCopyWith<ColorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorInfoCopyWith<$Res> {
  factory $ColorInfoCopyWith(ColorInfo value, $Res Function(ColorInfo) then) =
      _$ColorInfoCopyWithImpl<$Res, ColorInfo>;
  @useResult
  $Res call(
      {Primaries primaries,
      TransferCharacteristics transferCharacteristics,
      MatrixCoefficients matrixCoefficients});
}

/// @nodoc
class _$ColorInfoCopyWithImpl<$Res, $Val extends ColorInfo>
    implements $ColorInfoCopyWith<$Res> {
  _$ColorInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaries = null,
    Object? transferCharacteristics = null,
    Object? matrixCoefficients = null,
  }) {
    return _then(_value.copyWith(
      primaries: null == primaries
          ? _value.primaries
          : primaries // ignore: cast_nullable_to_non_nullable
              as Primaries,
      transferCharacteristics: null == transferCharacteristics
          ? _value.transferCharacteristics
          : transferCharacteristics // ignore: cast_nullable_to_non_nullable
              as TransferCharacteristics,
      matrixCoefficients: null == matrixCoefficients
          ? _value.matrixCoefficients
          : matrixCoefficients // ignore: cast_nullable_to_non_nullable
              as MatrixCoefficients,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorInfoImplCopyWith<$Res>
    implements $ColorInfoCopyWith<$Res> {
  factory _$$ColorInfoImplCopyWith(
          _$ColorInfoImpl value, $Res Function(_$ColorInfoImpl) then) =
      __$$ColorInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Primaries primaries,
      TransferCharacteristics transferCharacteristics,
      MatrixCoefficients matrixCoefficients});
}

/// @nodoc
class __$$ColorInfoImplCopyWithImpl<$Res>
    extends _$ColorInfoCopyWithImpl<$Res, _$ColorInfoImpl>
    implements _$$ColorInfoImplCopyWith<$Res> {
  __$$ColorInfoImplCopyWithImpl(
      _$ColorInfoImpl _value, $Res Function(_$ColorInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? primaries = null,
    Object? transferCharacteristics = null,
    Object? matrixCoefficients = null,
  }) {
    return _then(_$ColorInfoImpl(
      primaries: null == primaries
          ? _value.primaries
          : primaries // ignore: cast_nullable_to_non_nullable
              as Primaries,
      transferCharacteristics: null == transferCharacteristics
          ? _value.transferCharacteristics
          : transferCharacteristics // ignore: cast_nullable_to_non_nullable
              as TransferCharacteristics,
      matrixCoefficients: null == matrixCoefficients
          ? _value.matrixCoefficients
          : matrixCoefficients // ignore: cast_nullable_to_non_nullable
              as MatrixCoefficients,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ColorInfoImpl implements _ColorInfo {
  const _$ColorInfoImpl(
      {required this.primaries,
      required this.transferCharacteristics,
      required this.matrixCoefficients});

  factory _$ColorInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorInfoImplFromJson(json);

  @override
  final Primaries primaries;
  @override
  final TransferCharacteristics transferCharacteristics;
  @override
  final MatrixCoefficients matrixCoefficients;

  @override
  String toString() {
    return 'ColorInfo(primaries: $primaries, transferCharacteristics: $transferCharacteristics, matrixCoefficients: $matrixCoefficients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorInfoImpl &&
            (identical(other.primaries, primaries) ||
                other.primaries == primaries) &&
            (identical(
                    other.transferCharacteristics, transferCharacteristics) ||
                other.transferCharacteristics == transferCharacteristics) &&
            (identical(other.matrixCoefficients, matrixCoefficients) ||
                other.matrixCoefficients == matrixCoefficients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, primaries, transferCharacteristics, matrixCoefficients);

  /// Create a copy of ColorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorInfoImplCopyWith<_$ColorInfoImpl> get copyWith =>
      __$$ColorInfoImplCopyWithImpl<_$ColorInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorInfoImplToJson(
      this,
    );
  }
}

abstract class _ColorInfo implements ColorInfo {
  const factory _ColorInfo(
      {required final Primaries primaries,
      required final TransferCharacteristics transferCharacteristics,
      required final MatrixCoefficients matrixCoefficients}) = _$ColorInfoImpl;

  factory _ColorInfo.fromJson(Map<String, dynamic> json) =
      _$ColorInfoImpl.fromJson;

  @override
  Primaries get primaries;
  @override
  TransferCharacteristics get transferCharacteristics;
  @override
  MatrixCoefficients get matrixCoefficients;

  /// Create a copy of ColorInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorInfoImplCopyWith<_$ColorInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Range _$RangeFromJson(Map<String, dynamic> json) {
  return _Range.fromJson(json);
}

/// @nodoc
mixin _$Range {
  String get start => throw _privateConstructorUsedError;
  String get end => throw _privateConstructorUsedError;

  /// Serializes this Range to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Range
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RangeCopyWith<Range> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RangeCopyWith<$Res> {
  factory $RangeCopyWith(Range value, $Res Function(Range) then) =
      _$RangeCopyWithImpl<$Res, Range>;
  @useResult
  $Res call({String start, String end});
}

/// @nodoc
class _$RangeCopyWithImpl<$Res, $Val extends Range>
    implements $RangeCopyWith<$Res> {
  _$RangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Range
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RangeImplCopyWith<$Res> implements $RangeCopyWith<$Res> {
  factory _$$RangeImplCopyWith(
          _$RangeImpl value, $Res Function(_$RangeImpl) then) =
      __$$RangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String start, String end});
}

/// @nodoc
class __$$RangeImplCopyWithImpl<$Res>
    extends _$RangeCopyWithImpl<$Res, _$RangeImpl>
    implements _$$RangeImplCopyWith<$Res> {
  __$$RangeImplCopyWithImpl(
      _$RangeImpl _value, $Res Function(_$RangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Range
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$RangeImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RangeImpl implements _Range {
  const _$RangeImpl({required this.start, required this.end});

  factory _$RangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RangeImplFromJson(json);

  @override
  final String start;
  @override
  final String end;

  @override
  String toString() {
    return 'Range(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RangeImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  /// Create a copy of Range
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RangeImplCopyWith<_$RangeImpl> get copyWith =>
      __$$RangeImplCopyWithImpl<_$RangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RangeImplToJson(
      this,
    );
  }
}

abstract class _Range implements Range {
  const factory _Range(
      {required final String start, required final String end}) = _$RangeImpl;

  factory _Range.fromJson(Map<String, dynamic> json) = _$RangeImpl.fromJson;

  @override
  String get start;
  @override
  String get end;

  /// Create a copy of Range
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RangeImplCopyWith<_$RangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
