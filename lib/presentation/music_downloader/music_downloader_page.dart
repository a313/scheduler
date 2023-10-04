import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_button.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/base/base_state_widget.dart';

import 'music_downloader_controller.dart';

class MusicDownloaderPage extends GetView<MusicDownloaderController> {
  const MusicDownloaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Music Downloader'.tr,
      body: ABWidget(
        isShowA: controller.isDownloading,
        widgetA: (context) => const SizedBox(),
        widgetB: (context) => Column(
          children: [
            BaseTextField(
              labelText: 'Urls',
              onChanged: controller.onChangeUrls,
              maxLines: 5,
            ),
            BaseButton.mediumPrimary(
                title: 'Download', onPressed: controller.startDownload)
          ],
        ),
      ),
    );
  }
}
