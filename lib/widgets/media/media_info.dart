import 'package:audio_service/audio_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/constants/sized_boxs.dart';
import 'package:aio/core/utils/extensions/build_context.dart';
import 'package:aio/theme/app_fonts.dart';

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
        SizedBox(
          width: 80,
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
                data?.title ?? 'Not playing',
                maxLines: 2,
                style: AppFonts.bMedium,
              ),
              if (data?.duration != null)
                Text(
                  data!.duration!.toString().split('.')[0],
                  maxLines: 1,
                  style: AppFonts.bSmall.copyWith(color: context.neutral900),
                ).paddingOnly(top: 2.0)
            ],
          ),
        ),
      ],
    );
  }
}
