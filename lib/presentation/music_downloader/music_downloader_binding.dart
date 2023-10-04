import 'package:get/get.dart';

import 'music_downloader_controller.dart';

class MusicDownloaderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MusicDownloaderController>(() => MusicDownloaderController(),
        fenix: true);
  }
}
