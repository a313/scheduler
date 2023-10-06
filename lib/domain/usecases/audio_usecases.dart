import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioHandlerImpl extends BaseAudioHandler with QueueHandler, SeekHandler {
  AudioHandlerImpl() {
    _init();
  }
  // AudioHandler() {
  //   _init();
  // }

  late AudioPlayer? _player;
  late ConcatenatingAudioSource _playlist;
  @override
  Future<void> play() async {
    _player!.play();
  }

  @override
  Future<void> pause() async {
    _player!.pause();
  }

  @override
  Future<void> stop() async {
    await _player!.stop();
  }

  @override
  Future<void> seek(Duration position) async {
    _player!.seek(position);
  }

  @override
  Future<void> skipToQueueItem(int index) async {
    if (index < 0 || index >= _playlist.children.length) return;

    _player!.seek(
      Duration.zero,
      index:
          _player!.shuffleModeEnabled ? _player!.shuffleIndices![index] : index,
    );
  }

  @override
  Future<void> addQueueItem(MediaItem mediaItem) async {
    final res = _itemToSource(mediaItem);
    if (res != null) {
      await _playlist.add(res);
    }
  }

  void _init() {
    _player = AudioPlayer();
    _playlist = ConcatenatingAudioSource(children: []);
  }

  AudioSource? _itemToSource(MediaItem mediaItem) {
    AudioSource? audioSource;
    return audioSource;
  }
}
