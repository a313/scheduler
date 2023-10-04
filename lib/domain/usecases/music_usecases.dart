import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/domain/repo_abs/music_repo_abs.dart';

import '../../data/models/video_info.dart';

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

  Future<DataState<VideoInfo>> getVideoInfo(String url) {
    return _.getVideoInfo(url);
  }
}
