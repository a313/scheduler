import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/data/models/y2_mate_video_detail.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../../../core/utils/util.dart';

class MusicDownloadingItem extends StatelessWidget {
  const MusicDownloadingItem({
    super.key,
    required this.info,
    required this.percent,
  });

  final double percent;
  final Y2MateVideoDetail info;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: borRad04,
            child: CachedNetworkImage(
              imageUrl: info.thumbnailUrl,
              width: 100,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          sizedBoxW08,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  info.title,
                  style: AppFonts.bMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                    width: double.infinity,
                    child: LayoutBuilder(
                      builder: (context, constraints) => Container(
                        height: 8.0,
                        width: constraints.maxWidth,
                        decoration: BoxDecoration(
                          borderRadius: borRad100,
                          color: context.neutral300,
                        ),
                        child: Container(
                          height: 8.0,
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              right: constraints.maxWidth * (1 - percent)),
                          decoration: BoxDecoration(
                              borderRadius: borRad100,
                              color: context.funcCornflowerBlue),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
