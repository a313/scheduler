import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/extensions/build_context.dart';
import 'package:scheduler/presentation/music_player/components/media_control_component.dart';
import 'package:scheduler/widgets/media/media_info.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer(
      {super.key,
      required this.audioHandler,
      this.onSwipeUp,
      this.onSwipeDown,
      this.onSwipeRight,
      this.onSwipeLeft,
      this.onSeek});
  final AudioHandler audioHandler;

  final Function()? onSwipeUp;

  final Function()? onSwipeDown;

  final Function()? onSwipeRight;

  final Function()? onSwipeLeft;

  final Function(double sec)? onSeek;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MediaItem?>(
      stream: audioHandler.mediaItem,
      builder: (context, snapshot) {
        final mediaItem = snapshot.data;
        return Dismissible(
            key: const Key('up_down'),
            direction: DismissDirection.vertical,
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.down) {
                onSwipeDown?.call();
              } else if (direction == DismissDirection.up) {
                onSwipeUp?.call();
              }
              return false;
            },
            child: Dismissible(
                key: const Key('left_right'),
                direction: DismissDirection.horizontal,
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    onSwipeRight?.call();
                  } else if (direction == DismissDirection.endToStart) {
                    onSwipeLeft?.call();
                  }
                  return false;
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        context.neutral400.withOpacity(0.5),
                        context.neutral200.withOpacity(0.8)
                      ])),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(child: MediaInfo(data: mediaItem)),
                          MediaControlComponent(audioHandler: audioHandler)
                        ],
                      ),
                      SliderWidget(
                        length: mediaItem?.duration?.inSeconds.toDouble() ?? 0,
                        onChanged: onSeek,
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.length,
    this.onChanged,
  });

  final double length;
  final Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration>(
      stream: AudioService.position,
      builder: (context, snapshot) {
        final position = snapshot.data;
        final currSec = position?.inSeconds.toDouble() ?? -1;
        if (currSec <= 0.0 || currSec > length) {
          return const SizedBox(height: 2.5);
        }
        return SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: context.funcRadicalRed,
            inactiveTrackColor: Colors.transparent,
            trackHeight: 2,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 2.5),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 2.5),
          ),
          child: Center(
            child: Slider(
                inactiveColor: Colors.transparent,
                value: currSec,
                max: length,
                onChanged: onChanged),
          ),
        );
      },
    );
  }
}
