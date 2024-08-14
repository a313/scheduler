import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/y2_mate_video_detail.dart';
import 'package:aio/theme/app_fonts.dart';

class MusicDownloaderItem extends StatelessWidget {
  const MusicDownloaderItem({
    super.key,
    this.info,
    required this.url,
  });
  final String url;
  final Y2MateVideoDetail? info;

  @override
  Widget build(BuildContext context) {
    if (info == null) {
      return _Loading(url);
    } else if (info!.isError) {
      return _Error(error: info!.mess);
    }
    return _Info(info: info!);
  }
}

class _Info extends StatelessWidget {
  const _Info({
    required this.info,
  });

  final Y2MateVideoDetail info;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              Text(
                "Duration: ${Duration(seconds: info.t)}",
                style: AppFonts.bSmall.copyWith(color: context.neutral800),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({
    required this.error,
  });
  final String error;
  @override
  Widget build(BuildContext context) {
    return Text(
      error,
      style: AppFonts.bMedium,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading(this.url);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          url,
          style: AppFonts.bMedium,
          overflow: TextOverflow.ellipsis,
        )),
        sizedBoxW08,
        const CupertinoActivityIndicator().paddingSymmetric(horizontal: 08),
      ],
    );
  }
}
