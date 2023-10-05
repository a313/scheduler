import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import '../components/music_downloading_item.dart';
import 'music_downloading_controller.dart';

class MusicDownloadingPage extends StatelessWidget {
  const MusicDownloadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Music Downloading',
      body: GetBuilder<MusicDownloadingController>(
        builder: (controller) {
          final data = controller.downloadData;
          return ListView.separated(
            padding: padAll16,
            itemCount: data.length,
            separatorBuilder: (context, index) => sizedBoxH08,
            itemBuilder: (context, index) => MusicDownloadingItem(
              info: data.keys.elementAt(index),
              percent: data.values.elementAt(index),
            ),
            // itemBuilder: (context, index) => const SizedBox(
            //   height: 50,
            //   width: 50,
            // ).debugSize(),
          );
        },
      ),
    );
  }
}
