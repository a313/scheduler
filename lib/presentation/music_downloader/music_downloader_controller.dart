import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/video_info.dart';
import 'package:scheduler/domain/usecases/music_usecases.dart';
import 'package:scheduler/routes/routes.dart';

class MusicDownloaderController extends BaseController {
  final musicUC = Get.find<MusicUseCases>();
  TextEditingController inputController = TextEditingController();

  RxMap<String, VideoInfo?> pool = <String, VideoInfo?>{}.obs;

  Future<void> getVideoInfo(String url) async {
    if (pool.containsKey(url)) return;
    pool[url] = null;
    final result = await musicUC.getVideoInfo(url);
    if (result is DataSuccess<VideoInfo>) {
      pool[url] = result.data;
      pool.refresh();
    } else if (result is DataFailure<VideoInfo>) {
      pool[url] = VideoInfo.error(result.message);
      pool.refresh();
    }
  }

  void startDownload() {
    final items = pool.values.whereNotNull().toList();
    Get.toNamed(Routes.musicDownloading, arguments: items);
    pool.clear();
  }

  void addToPool() {
    final url = inputController.text;
    if (url.isURL) {
      getVideoInfo(url);
      inputController.clear();
    } else {
      showSnackBar('Input not valid');
    }
  }
}
