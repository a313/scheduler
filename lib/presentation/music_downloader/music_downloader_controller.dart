import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/y2_mate_video_detail.dart';
import 'package:scheduler/domain/usecases/music_usecases.dart';
import 'package:scheduler/routes/routes.dart';

class MusicDownloaderController extends BaseController {
  final musicUC = Get.find<MusicUseCases>();
  TextEditingController inputController = TextEditingController();

  RxMap<String, Y2MateVideoDetail?> pool = <String, Y2MateVideoDetail?>{}.obs;

  Future<void> getVideoYoutubeInfo(String url) async {
    if (pool.containsKey(url)) return;
    pool[url] = null;
    final result = await musicUC.getVideoYoutubeInfo(url);
    if (result is DataSuccess<Y2MateVideoDetail>) {
      pool[url] = result.data;
      pool.refresh();
    } else if (result is DataFailure<Y2MateVideoDetail>) {
      pool[url] = Y2MateVideoDetail.error(result.message);
      pool.refresh();
    }
  }

  Future<void> startDownload() async {
    final items = pool.values.whereNotNull().toList();
    final shouldClear =
        await Get.toNamed(Routes.musicDownloading, arguments: items);
    if (shouldClear is bool && shouldClear) pool.clear();
  }

  void addToPool() {
    final urls = inputController.text.split(',');
    for (var url in urls) {
      getVideoInfo(url);
    }
    inputController.clear();
  }

  void getVideoInfo(String url) {
    if (url.isURL) {
      getVideoYoutubeInfo(url);
    } else {
      showSnackBar('$url not valid');
    }
  }
}
