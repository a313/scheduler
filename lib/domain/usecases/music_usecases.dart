import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:mime/mime.dart';
import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/data/models/y2_mate_download_link.dart';
import 'package:aio/data/models/y2_mate_video_detail.dart';
import 'package:aio/domain/repo_abs/music_repo_abs.dart';

class MusicUseCases {
  final MusicRepo _;
  MusicUseCases(this._);

  Future<DataState<bool>> downloadMp3(String url, String savePath,
      {Function(int count, int total)? progress}) {
    return _.downloadMp3(url, savePath, progress: progress);
  }

  Future<DataState<bool>> downloadThumb(String url, String savePath) {
    return _.downloadThumb(url, savePath);
  }

  Future<DataState<Y2MateVideoDetail>> getVideoYoutubeInfo(String url) {
    return _.getVideoYoutubeInfo(url);
  }

  Future<DataState<Y2MateDownloadLink>> getDownloadUrl(String id, String key) {
    return _.getDownloadUrl(id, key);
  }

  Future<DataState<Uint8List>> downloadByte(String url) {
    return _.downloadByte(url);
  }

  Future<bool> fillMetadata(
      String audioFile, String thumbFile, Y2MateVideoDetail data) async {
    Picture? picture;
    try {
      picture = Picture(
          mimeType: lookupMimeType(thumbFile) ?? '.jpg',
          data: File(thumbFile).readAsBytesSync());
    } finally {}
    try {
      await MetadataGod.writeMetadata(
          file: audioFile,
          metadata: Metadata(
            title: data.title,
            artist: data.extractor,
            durationMs: data.t * 1000,
            fileSize: File(audioFile).lengthSync(),
            picture: picture,
          ));
      return true;
    } catch (e) {
      return false;
    }
  }
}
