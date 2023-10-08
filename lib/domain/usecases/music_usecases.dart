import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/y2_mate_download_link.dart';
import 'package:scheduler/data/models/y2_mate_video_detail.dart';
import 'package:scheduler/domain/repo_abs/music_repo_abs.dart';

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
}
