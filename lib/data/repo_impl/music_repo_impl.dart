import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/datasource/music_service.dart';
import 'package:scheduler/data/models/y2_mate_download_link.dart';
import 'package:scheduler/data/models/y2_mate_video_detail.dart';
import 'package:scheduler/domain/repo_abs/music_repo_abs.dart';

class MusicRepoImpl extends MusicRepo {
  final MusicService _;

  MusicRepoImpl(this._);

  @override
  Future<DataState<Y2MateVideoDetail>> getVideoYoutubeInfo(String url) async {
    final response = await _.getVideoYoutubeInfo(url);
    if (response.isSuccess) {
      try {
        final data = Y2MateVideoDetail.fromJson(response.data);
        return DataSuccess(data);
      } catch (e) {
        return DataFailure(
            response.statusCode.toString(), response.message ?? UNKNOWN_ERROR);
      }
    } else {
      return DataFailure(
          response.statusCode.toString(), response.message ?? UNKNOWN_ERROR);
    }
  }

  @override
  Future<DataState<bool>> downloadMp3(String url, String savePath,
      {Function(int count, int total)? progress}) async {
    final response = await _.download(
      endPoint: url,
      savePath: savePath,
      onReceiveProgress: progress,
    );
    if (response.isSuccess) {
      return DataSuccess(true);
    } else {
      return DataFailure(
          response.statusCode.toString(), response.message ?? UNKNOWN_ERROR);
    }
  }

  @override
  Future<DataState<bool>> downloadThumb(String url, String savePath) async {
    final response = await _.download(endPoint: url, savePath: savePath);
    if (response.isSuccess) {
      return DataSuccess(true);
    } else {
      return DataFailure(
          response.statusCode.toString(), response.message ?? UNKNOWN_ERROR);
    }
  }

  @override
  Future<DataState<Y2MateDownloadLink>> getDownloadUrl(
      String id, String key) async {
    final response = await _.getDownloadUrl(id, key);
    if (response.isSuccess) {
      return DataSuccess(Y2MateDownloadLink.fromJson(response.data));
    } else {
      return DataFailure(
          response.statusCode.toString(), response.message ?? UNKNOWN_ERROR);
    }
  }

  @override
  Future<DataState<Uint8List>> downloadByte(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return DataSuccess(response.bodyBytes);
    } else {
      return DataFailure(response.statusCode.toString(), response.body);
    }
  }
}
