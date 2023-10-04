import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/datasource/music_service.dart';
import 'package:scheduler/data/models/video_info.dart';
import 'package:scheduler/domain/repo_abs/music_repo_abs.dart';

class MusicRepoImpl extends MusicRepo {
  final MusicService _;

  MusicRepoImpl(this._);

  @override
  Future<DataState<VideoInfo>> getVideoInfo(String url) async {
    final response = await _.getVideoInfo(url);
    if (response.isSuccess) {
      try {
        final data = VideoInfo.fromJson(response.data);
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
}
