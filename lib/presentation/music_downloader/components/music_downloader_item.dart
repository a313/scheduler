import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/video_info.dart';
import 'package:scheduler/theme/app_fonts.dart';

class MusicDownloaderItem extends StatelessWidget {
  const MusicDownloaderItem({
    super.key,
    this.info,
    required this.url,
  });
  final String url;
  final VideoInfo? info;

  @override
  Widget build(BuildContext context) {
    if (info == null) {
      return _Loading(url);
    } else if (info?.error != null) {
      return _Error(error: info!.error!);
    } else if (info?.info != null) {
      return _Info(info: info!.info!);
    }
    return const SizedBox();
  }
}

class _Info extends StatelessWidget {
  const _Info({
    required this.info,
  });

  final Info info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: borRad04,
          child: Image.network(
            info.thumbnails.first.url,
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
                "Duration: ${Duration(seconds: int.tryParse(info.lengthSeconds) ?? 0)}",
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
    return const SizedBox();
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
