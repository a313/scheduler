import 'package:audio_service/audio_service.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/y2_mate_download_link.dart';
import 'package:scheduler/data/models/y2_mate_video_detail.dart';
import 'package:scheduler/domain/repo_abs/music_repo_abs.dart';

class MusicUseCases {
  final MusicRepo _;
  late AudioHandler audioHandler;
  MusicUseCases(this._) {
    init();
  }

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

  Future<void> init() async {
    audioHandler = await AudioService.init(
        builder: () => AudioHandler(),
        config: const AudioServiceConfig(
          androidNotificationChannelId: 'com.mycompany.myapp.channel.audio',
          androidNotificationChannelName: 'Music playback',
        ));
  }
}

class AudioHandler extends BaseAudioHandler
    with
        QueueHandler, // mix in default queue callback implementations
        SeekHandler {
  @override
  Future<void> play() async {}
  @override
  Future<void> pause() async {}
  @override
  Future<void> stop() async {}
  @override
  Future<void> seek(Duration position) async {}
  @override
  Future<void> skipToQueueItem(int i) async {}
}
