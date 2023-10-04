import 'package:scheduler/core/usecase/data_state.dart';

import '../../data/models/video_info.dart';

abstract class MusicRepo {
  Future<DataState<VideoInfo>> getVideoInfo(String url);
  Future<DataState<bool>> downloadMp3(String url, String savePath,
      {Function(int count, int total)? progress});
  Future<DataState<bool>> downloadThumb(String url, String savePath);
}
