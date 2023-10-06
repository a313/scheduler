import 'package:audio_service/audio_service.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/y2_mate_download_link.dart';
import 'package:scheduler/data/models/y2_mate_video_detail.dart';
import 'package:scheduler/domain/repo_abs/music_repo_abs.dart';
import 'package:scheduler/domain/repo_abs/youtube_repo_abs.dart';
import 'package:scheduler/domain/usecases/audio_usecases.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MusicUseCases {
  final MusicRepo m;
  final YoutubeRepo y;
  late AudioHandlerImpl audioHandler;
  MusicUseCases(this.m, this.y) {
    init();
  }

  Future<DataState<bool>> downloadMp3(String url, String savePath,
      {Function(int count, int total)? progress}) {
    return m.downloadMp3(url, savePath, progress: progress);
  }

  Future<DataState<bool>> downloadThumb(String url, String savePath) {
    return m.downloadThumb(url, savePath);
  }

  Future<DataState<Y2MateVideoDetail>> getVideoYoutubeInfo(String url) {
    return m.getVideoYoutubeInfo(url);
  }

  Future<DataState<Y2MateDownloadLink>> getDownloadUrl(String id, String key) {
    return m.getDownloadUrl(id, key);
  }

  Future<DataState<Video>> getYoutubeVideoFromId(String id) {
    return y.getVideoFromId(id);
  }

  Future<DataState<List<String>>> getYoutubeDownloadUrl(String id) {
    return y.getDownloadUrl(id);
  }

  Future<void> init() async {
    audioHandler = await AudioService.init(
        builder: () => AudioHandlerImpl(),
        config: const AudioServiceConfig(
          androidNotificationChannelId: 'com.mycompany.myapp.channel.audio',
          androidNotificationChannelName: 'Music playback',
        ));
  }

  void writeMetadata() {}
}
