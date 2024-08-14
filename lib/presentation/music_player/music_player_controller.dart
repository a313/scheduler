import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:get/get.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:aio/core/state_management/base_controller.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/domain/usecases/music_usecases.dart';
import 'package:aio/presentation/music_player/components/audio_player.dart';

class MusicPlayerController extends BaseController {
  List<MediaItem> allMedia = [];
  List<MediaItem> filteredMedia = [];
  Map<String, File> thumbnails = {};
  File? currentSelect;
  MusicUseCases useCases = Get.find<MusicUseCases>();
  AudioHandler audioHandler = Get.find<AudioHandler>();
  bool shuffle = false;
  String filter = '';

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    allMedia.clear();
    thumbnails.clear();
    final directory = await Utils.getDirectory(path: 'musics');
    if (!await directory.exists()) return;
    final list = directory.listSync(recursive: true, followLinks: false);

    await handlerData(list);
    onFilter(filter);
    update();
  }

  Future<void> handlerData(List<FileSystemEntity> list) async {
    final audios = <File>[];
    for (var f in list) {
      if (Utils.isAudioFile(f.path)) {
        audios.add(f as File);
      } else if (Utils.isImageFile(f.path)) {
        final file = f as File;
        thumbnails[file.fileName] = file;
      }
    }
    for (var a in audios) {
      final thumb = thumbnails[a.fileName];
      final metadata = await MetadataGod.readMetadata(file: a.path);
      final item = MediaItem(
          id: a.fileName,
          title: metadata.title ?? 'Unknown',
          artUri: thumb?.uri,
          duration: metadata.duration,
          extras: {'uri': a.uri.toString(), 'thumbUri': thumb?.uri.toString()});
      allMedia.add(item);
    }
  }

  @override
  void reloadData() {
    getData();
  }

  Future<void> onTapMusic(MediaItem audio) async {
    final clone = List<MediaItem>.from(filteredMedia);
    clone.remove(audio);
    if (shuffle) clone.shuffle();
    clone.insert(0, audio);
    playAudios(clone);
  }

  Future<void> onDeleteMusic(
      MediaItem data, Future<void> Function(bool delete) handler) async {
    allMedia.remove(data);
    final fUri = data.extras?['uri'] as String?;
    if (fUri != null) {
      File.fromUri(Uri.parse(fUri)).delete();
    }

    final tUri = data.extras?['thumbUri'] as String?;
    if (tUri != null) {
      File.fromUri(Uri.parse(tUri)).delete();
    }
    await handler(true);
    update();
  }

  Future<void> playAudios(List<MediaItem> list, {bool shuffle = false}) async {
    if (shuffle) list.shuffle();
    await audioHandler.updateQueue(list);
    await audioHandler.play();
  }

  void onSwipeLeft() {
    audioHandler.skipToPrevious();
  }

  void onSwipeRight() {
    audioHandler.skipToNext();
  }

  void onSeek(double sec) {
    audioHandler.seek(Duration(seconds: sec.round()));
  }

  void onShuffle() {
    playAudios(filteredMedia, shuffle: true);
  }

  void onPlay() {
    playAudios(filteredMedia);
  }

  void onFilter(String value) {
    filter = value;
    if (filter.isEmpty) {
      filteredMedia = allMedia;
    } else {
      filteredMedia = allMedia
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    update();
  }

  void openAudioPlayer() {
    bottomSheet(const AudioPlayer());
  }
}
