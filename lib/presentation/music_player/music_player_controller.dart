import 'dart:io';

import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';

class MusicPlayerController extends GetxController {
  List<File> musics = [];
  Map<String, File> thumbnails = {};

  File? currentSelect;

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

  Future<void> onTapMusic(File file) async {}

  Future<void> setPlaylist() async {}
}
