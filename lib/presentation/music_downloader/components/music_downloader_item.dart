import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MusicDownloaderItem extends StatelessWidget {
  const MusicDownloaderItem({
    super.key,
    required this.data,
    required this.url,
  });
  final String url;
  final DataState<Video> data;

  @override
  Widget build(BuildContext context) {
    if (data is LoadingState<Video>) {
      return _Loading(url);
    } else if (data is DataFailure<Video>) {
      return _Error(error: (data as DataFailure).message);
    } else if (data is DataSuccess<Video>) {
      return _Info(info: (data as DataSuccess<Video>).data);
    }
    return const SizedBox();
  }
}

class _Info extends StatelessWidget {
  const _Info({
    required this.info,
  });

  final Video info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: borRad04,
          child: CachedNetworkImage(
            imageUrl: info.thumbnails.highResUrl,
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
                "Duration: ${info.duration}",
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
