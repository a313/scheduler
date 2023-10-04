import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/base/base_scafold_appbar.dart';
import 'music_player_controller.dart';

class MusicPlayerPage extends GetView<MusicPlayerController> {
  const MusicPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Music'.tr,
      body: const Column(),
    );
  }
}
