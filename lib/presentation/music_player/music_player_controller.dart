import 'dart:developer';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/usecases/music_usecases.dart';

class MusicPlayerController extends GetxController {
  List<File> musics = [];
  Map<String, File> thumbnails = {};
  File? currentSelect;
  MusicUseCases useCases = Get.find<MusicUseCases>();
  AudioHandler audioHandler = Get.find<AudioHandler>();
  bool shuffle = false;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    musics.clear();
    thumbnails.clear();
    final directory = await Utils.getDirectory(path: 'musics');
    if (!await directory.exists()) return;
    final list = directory.listSync(recursive: true, followLinks: false);
    handlerData(list);
    update();
  }

  void handlerData(List<FileSystemEntity> list) {
    for (var f in list) {
      if (Utils.isAudioFile(f.path)) {
        musics.add(f as File);
      } else if (Utils.isImageFile(f.path)) {
        final file = f as File;
        thumbnails[file.fileName] = file;
      }
    }
    setPlaylist();
  }

  void reloadData() {
    getData();
  }

  Future<void> onTapMusic(File file) async {
    log('throw UnimplementedError()');
  }

  Future<void> setPlaylist() async {
    List<File> list = musics;
    if (shuffle) list.shuffle();
    List<MediaItem> items = [];
    for (var file in list) {
      final thumb = thumbnails[file.fileName];
      final item = MediaItem(
          id: file.fileName,
          title: file.fileName,
          artUri: thumb?.uri,
          extras: {'uri': file.uri.toString()});
      items.add(item);
    }
    audioHandler.updateQueue(items);
  }
}
