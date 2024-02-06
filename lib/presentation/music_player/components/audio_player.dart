import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/widgets/media/media_thumb.dart';

import '../music_player_controller.dart';

class AudioPlayer extends GetWidget<MusicPlayerController> {
  const AudioPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MediaItem?>(
        stream: controller.audioHandler.mediaItem,
        builder: (context, snapshot) {
          final item = snapshot.data;
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0)),
                  color: context.neutral100),
              child: SafeArea(
                child: Column(
                  children: [
                    sizedBoxH28,
                    Container(
                      width: 32,
                      height: 4,
                      decoration: const BoxDecoration(
                          borderRadius: borRad100, color: Colors.grey),
                    ),
                    sizedBoxH04,
                    ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: context.screenHeight * 0.94),
                        child: Column(
                          children: [
                            Hero(
                              tag: 'artWork',
                              child: MediaThumb(item?.artUri),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
