import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/y2_mate_download_link.dart';
import 'package:scheduler/data/models/y2_mate_video_detail.dart';

abstract class MusicRepo {
  Future<DataState<Y2MateVideoDetail>> getVideoYoutubeInfo(String url);
  Future<DataState<bool>> downloadMp3(String url, String savePath,
      {Function(int count, int total)? progress});
  Future<DataState<bool>> downloadThumb(String url, String savePath);
  Future<DataState<Y2MateDownloadLink>> getDownloadUrl(String id, String key);
}
