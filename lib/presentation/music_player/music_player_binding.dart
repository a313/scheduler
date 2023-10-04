import 'package:get/get.dart';

import 'music_player_controller.dart';

class MusicPlayerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MusicPlayerController>(() => MusicPlayerController(),
        fenix: true);
  }
}
