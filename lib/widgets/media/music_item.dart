import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../../domain/entities/swipe_action_data.dart';
import 'media_thumb.dart';

class MusicItem extends StatelessWidget {
  const MusicItem({
    Key? key,
    required this.data,
    required this.onTap,
    this.actions,
  }) : super(key: key);

  final MediaItem data;
  final Function(MediaItem audio) onTap;
  final List<SwipeActionData<MediaItem>>? actions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(data),
        child: SwipeActionCell(
          key: ObjectKey(data),
          trailingActions: actions?.map((e) => e.toAction(data)).toList(),
          child: Row(
            children: [
              Expanded(child: MediaThumb(data.artUri)),
              sizedBoxW08,
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    sizedBoxH04,
                    Text(
                      data.title,
                      maxLines: 2,
                      style: AppFonts.bMedium,
                    ),
                    sizedBoxH02,
                    Text(
                      data.duration.toString().split('.')[0],
                      maxLines: 1,
                      style:
                          AppFonts.bSmall.copyWith(color: context.neutral900),
                    )
                  ],
                ),
              ),
              sizedBoxW08,
            ],
          ),
        ));
  }
}
