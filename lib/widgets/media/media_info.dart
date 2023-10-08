import 'package:audio_service/audio_service.dart';
import 'package:flutter/widgets.dart';
import 'package:scheduler/core/utils/constants/sized_boxs.dart';
import 'package:scheduler/core/utils/extensions/build_context.dart';
import 'package:scheduler/theme/app_fonts.dart';

import 'media_thumb.dart';

class MediaInfo extends StatelessWidget {
  const MediaInfo({
    super.key,
    required this.data,
    this.heroTag = 'artWork',
  });

  final MediaItem? data;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Hero(
            tag: heroTag,
            child: MediaThumb(data?.artUri),
          ),
        ),
        sizedBoxW08,
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              sizedBoxH04,
              Text(
                data?.title ?? 'Now playing',
                maxLines: 2,
                style: AppFonts.bMedium,
              ),
              sizedBoxH02,
              Text(
                data?.duration?.toString() ?? '',
                maxLines: 1,
                style: AppFonts.bSmall.copyWith(color: context.neutral900),
              )
            ],
          ),
        ),
      ],
    );
  }
}
