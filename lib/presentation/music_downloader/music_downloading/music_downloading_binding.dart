import 'package:get/get.dart';

import 'music_downloading_controller.dart';

class MusicDownloadingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MusicDownloadingController>(
        MusicDownloadingController(data: Get.arguments));
  }
}
