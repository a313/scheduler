import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/music_player/components/header_component.dart';
import 'package:scheduler/presentation/music_player/components/mini_player.dart';

import '../../domain/entities/swipe_action_data.dart';
import '../../widgets/base/base_scafold_appbar.dart';
import '../../widgets/media/music_item.dart';
import 'music_player_controller.dart';

class MusicPlayerPage extends GetView<MusicPlayerController> {
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Music'.tr,
      body: GetBuilder<MusicPlayerController>(
        builder: (_) {
          final musics = _.filteredMedia;
          final audioHandler = _.audioHandler;
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  itemBuilder: (context, index) {
                    if (index == 0) return const HeaderComponent();
                    final music = musics.elementAt(index - 1);

                    return MusicItem(
                      data: music,
                      onTap: controller.onTapMusic,
                      actions: [
                        SwipeActionData(onTap: controller.onDeleteMusic),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => sizedBoxH04,
                  itemCount: musics.length + 1,
                ),
              ),
              MiniPlayer(audioHandler: audioHandler),
            ],
          );
        },
      ),
    );
  }
}
