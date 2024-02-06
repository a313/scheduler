import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/usecases/audio_usecases.dart';
import 'package:scheduler/domain/usecases/music_usecases.dart';
import 'package:scheduler/theme/app_fonts.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final audioHandler = Get.find<MusicUseCases>().audioHandler;
    return SafeArea(
      child: StreamBuilder<MediaItem?>(
          stream: audioHandler.mediaItem,
          builder: (context, snapshot) {
            final MediaItem? mediaItem = snapshot.data;
            return Dismissible(
                key: const Key('miniPlayer'),
                direction: DismissDirection.vertical,
                confirmDismiss: (DismissDirection direction) {
                  if (mediaItem != null) {
                    if (direction == DismissDirection.down) {
                      audioHandler.stop();
                    }
                  }
                  return Future.value(false);
                },
                child: Dismissible(
                  key: Key(mediaItem?.id ?? 'nothingPlaying'),
                  direction: DismissDirection.horizontal,
                  confirmDismiss: (DismissDirection direction) {
                    if (mediaItem != null) {
                      if (direction == DismissDirection.startToEnd) {
                        audioHandler.skipToPrevious();
                      } else {
                        audioHandler.skipToNext();
                      }
                    }
                    return Future.value(false);
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    elevation: 0,
                    child: GradientContainer(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PlayerItem(
                            audioHandler: audioHandler,
                            title: mediaItem?.title,
                            subtitle: mediaItem?.artist,
                            thumb: mediaItem?.artUri?.toFilePath(),
                            isDummy: mediaItem == null,
                          ),
                          const DurationSlider(),
                        ],
                      ),
                    ),
                  ),
                ));
          }),
    );
  }
}

class PlayerItem extends StatelessWidget {
  const PlayerItem({
    super.key,
    required this.isDummy,
    this.title,
    this.subtitle,
    this.thumb,
    this.isSelected = false,
    required this.audioHandler,
  });
  final bool isDummy;
  final String? title;
  final String? subtitle;
  final String? thumb;
  final bool isSelected;
  final AudioHandlerImpl audioHandler;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: isDummy
          ? null
          : () {
              Navigator.pushNamed(context, '/player');
            },
      title: Text(
        title ?? 'Now Playing',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppFonts.bMedium.copyWith(color: context.neutral1100),
      ),
      subtitle: Text(
        subtitle ?? 'Unknown',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppFonts.bSmall,
      ),
      leading: Hero(
        tag: 'currentArtwork',
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.antiAlias,
          child: SizedBox.square(
            dimension: 55.0,
            child: Stack(
              fit: StackFit.expand,
              children: [
                thumb != null
                    ? Image.file(
                        File(thumb!),
                        fit: BoxFit.cover,
                      )
                    : SvgPicture.asset('assets/svg/Regular/MusicNote.svg'),
                if (isSelected)
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check_rounded,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      trailing: isDummy
          ? null
          : ControlButtons(audioHandler,
              miniplayer: true, buttons: const ['Like', 'Play/Pause', 'Next']),
    );
  }
}

class DurationSlider extends StatelessWidget {
  const DurationSlider({
    super.key,
    this.maxDuration,
  });

  final double? maxDuration;
  @override
  Widget build(BuildContext context) {
    final audioHandler = Get.find<MusicUseCases>().audioHandler;
    return StreamBuilder<Duration>(
      stream: AudioService.position,
      builder: (context, snapshot) {
        final position = snapshot.data;
        return ((position?.inSeconds.toDouble() ?? 0) < 0.0 ||
                ((position?.inSeconds.toDouble() ?? 0) >
                    (maxDuration ?? 180.0)))
            ? const SizedBox()
            : SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Theme.of(context).colorScheme.secondary,
                  inactiveTrackColor: Colors.transparent,
                  trackHeight: 0.5,
                  thumbColor: Theme.of(context).colorScheme.secondary,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 1.0,
                  ),
                  overlayColor: Colors.transparent,
                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 2.0,
                  ),
                ),
                child: Center(
                  child: Slider(
                    inactiveColor: Colors.transparent,
                    // activeColor: Colors.white,
                    value: position?.inSeconds.toDouble() ?? 0,
                    max: maxDuration ?? 180.0,
                    onChanged: (newPosition) {
                      audioHandler.seek(
                        Duration(
                          seconds: newPosition.round(),
                        ),
                      );
                    },
                  ),
                ),
              );
      },
    );
  }
}

class GradientContainer extends StatefulWidget {
  final Widget? child;
  final bool? opacity;
  const GradientContainer({super.key, required this.child, this.opacity});
  @override
  State createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  @override
  Widget build(BuildContext context) {
    // ignore: use_decorated_box
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xfff5f9ff),
            Colors.white,
          ],
        ),
      ),
      child: widget.child,
    );
  }
}

class ControlButtons extends StatelessWidget {
  final AudioHandlerImpl audioHandler;
  final bool shuffle;
  final bool miniplayer;
  final List buttons;
  final Color? dominantColor;

  const ControlButtons(
    this.audioHandler, {
    super.key,
    this.shuffle = false,
    this.miniplayer = false,
    this.buttons = const ['Previous', 'Play/Pause', 'Next'],
    this.dominantColor,
  });

  @override
  Widget build(BuildContext context) {
    final MediaItem mediaItem = audioHandler.mediaItem.value!;

    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
    );
  }
}
