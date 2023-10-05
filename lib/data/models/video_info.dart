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
    Info? info,
    String? dlVideo,
    String? dlAudio,
    String? error,
  }) = _VideoInfo;

  factory VideoInfo.fromJson(Map<String, dynamic> json) =>
      _$VideoInfoFromJson(json);

  factory VideoInfo.error(String error) => VideoInfo(error: error);
}

@freezed
class Info with _$Info {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory Info({
    required String title,
    required String description,
    required String lengthSeconds,
    required String ownerProfileUrl,
    required String externalChannelId,
    required bool isFamilySafe,
    required List<String> availableCountries,
    required bool isUnlisted,
    required bool hasYpcMetadata,
    required String viewCount,
    required String category,
    required DateTime publishDate,
    required String ownerChannelName,
    required DateTime uploadDate,
    required String videoId,
    required List<String> keywords,
    required String channelId,
    required bool isOwnerViewing,
    required bool isCrawlable,
    required bool allowRatings,
    required Author author,
    required bool isPrivate,
    required bool isUnpluggedCorpus,
    required bool isLiveContent,
    required Media media,
    required dynamic likes,
    required dynamic dislikes,
    @JsonKey(name: 'age_restricted') required bool ageRestricted,
    @JsonKey(name: 'video_url') required String videoUrl,
    required List<Storyboard> storyboards,
    required List<dynamic> chapters,
    required List<InfoThumbnail> thumbnails,
  }) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}

@freezed
class Author with _$Author {
  const factory Author({
    required String id,
    required String name,
    required String user,
    required String channelUrl,
    required String externalChannelUrl,
    required String userUrl,
    required List<AuthorThumbnail> thumbnails,
    required bool verified,
    required int subscriberCount,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}

@freezed
class AuthorThumbnail with _$AuthorThumbnail {
  const factory AuthorThumbnail({
    required String url,
    required int width,
    required int height,
  }) = _AuthorThumbnail;

  factory AuthorThumbnail.fromJson(Map<String, dynamic> json) =>
      _$AuthorThumbnailFromJson(json);
}

@freezed
class Media with _$Media {
  const factory Media() = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}

@freezed
class Storyboard with _$Storyboard {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory Storyboard({
    required String templateUrl,
    required int thumbnailWidth,
    required int thumbnailHeight,
    required int thumbnailCount,
    required int interval,
    required int columns,
    required int rows,
    required int storyboardCount,
  }) = _Storyboard;

  factory Storyboard.fromJson(Map<String, dynamic> json) =>
      _$StoryboardFromJson(json);
}

@freezed
class InfoThumbnail with _$InfoThumbnail {
  const factory InfoThumbnail({
    required String url,
    required int width,
    required int height,
  }) = _InfoThumbnail;

  factory InfoThumbnail.fromJson(Map<String, dynamic> json) =>
      _$InfoThumbnailFromJson(json);
}
