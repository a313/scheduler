import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/music_player/components/mini_player.dart';

import '../../widgets/base/base_scafold_appbar.dart';
import '../../widgets/media/music_item.dart';
import 'music_player_controller.dart';

class MusicPlayerPage extends GetView<MusicPlayerController> {
  const MusicPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Music'.tr,
      body: GetBuilder<MusicPlayerController>(
        builder: (_) {
          final musics = _.musics;
          final audioHandler = _.audioHandler;
          return Stack(
            children: [
              ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemBuilder: (context, index) {
                  final music = musics.elementAt(index);
                  final thumb = _.thumbnails[music.fileName];
                  return MusicItem(
                    file: music,
                    thumbnail: thumb?.uri,
                    onTap: controller.onTapMusic,
                  );
                },
                separatorBuilder: (context, index) => sizedBoxH04,
                itemCount: musics.length,
              ),
              Positioned(
                left: 2,
                right: 2,
                bottom: 2,
                child: MiniPlayer(audioHandler: audioHandler),
              ),
            ],
          );
        },
      ),
    );
  }
}
