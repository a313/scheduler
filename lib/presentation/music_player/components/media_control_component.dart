import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

class MediaControlComponent extends StatelessWidget {
  const MediaControlComponent({
    super.key,
    required this.audioHandler,
  });

  final AudioHandler audioHandler;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [_PlayPauseBtn(audioHandler), _NextBtn(audioHandler)],
    );
  }
}

class _NextBtn extends StatelessWidget {
  const _NextBtn(this.audioHandler);
  final AudioHandler audioHandler;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.skip_next_rounded),
      tooltip: 'Next song',
      onPressed: audioHandler.skipToNext,
    );
  }
}

class _PlayPauseBtn extends StatelessWidget {
  const _PlayPauseBtn(this.audioHandler);

  final AudioHandler audioHandler;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlaybackState>(
      stream: audioHandler.playbackState,
      builder: (context, snapshot) {
        final playbackState = snapshot.data;
        final processingState = playbackState?.processingState;
        final playing = playbackState?.playing ?? true;
        return Stack(
          alignment: Alignment.center,
          children: [
            if (processingState == AudioProcessingState.loading ||
                processingState == AudioProcessingState.buffering)
              SizedBox(
                height: 40.0,
                width: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).iconTheme.color!,
                  ),
                ),
              ),
            playing
                ? IconButton(
                    tooltip: 'Pause',
                    onPressed: audioHandler.pause,
                    icon: const Icon(
                      Icons.pause_rounded,
                    ),
                    color: Theme.of(context).iconTheme.color,
                  )
                : IconButton(
                    tooltip: 'Play',
                    onPressed: audioHandler.play,
                    icon: const Icon(
                      Icons.play_arrow_rounded,
                    ),
                    color: Theme.of(context).iconTheme.color,
                  )
          ],
        );
      },
    );
  }
}
