import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'music_downloading_controller.dart';

class MusicDownloadingPage extends GetView<MusicDownloadingController> {
  const MusicDownloadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScafoldAppBar(
      title: 'Music Downloading',
      body: Column(),
    );
  }
}
