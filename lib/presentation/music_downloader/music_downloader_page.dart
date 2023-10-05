import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_button.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'components/music_downloader_item.dart';
import 'music_downloader_controller.dart';

class MusicDownloaderPage extends GetView<MusicDownloaderController> {
  const MusicDownloaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Music Downloader'.tr,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            BaseTextField(
              labelText: 'Urls',
              controller: controller.inputController,
              maxLines: 1,
            ),
            Expanded(
                child: Obx(() => ListView.separated(
                    itemBuilder: (context, index) => MusicDownloaderItem(
                        url: controller.pool.keys.elementAt(index),
                        info: controller.pool.values.elementAt(index)),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 4),
                    itemCount: controller.pool.keys.length))),
            Obx(() => BaseButton.fixBottom2(
                leftTitle: 'Add to pool',
                onLeftPressed: controller.addToPool,
                rightTitle: 'Download',
                onRightPressed: controller.pool.values.whereNotNull().isNotEmpty
                    ? controller.startDownload
                    : null))
          ],
        ),
      ),
    );
  }
}
