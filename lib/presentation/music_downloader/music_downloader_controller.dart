import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/datasource/music_service.dart';
import 'package:scheduler/domain/usecases/music_usecases.dart';
import 'package:scheduler/routes/routes.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MusicDownloaderController extends BaseController {
  final musicUC = Get.find<MusicUseCases>();
  TextEditingController inputController = TextEditingController(text: TEST_URL);

  RxMap<String, DataState<Video>> pool = <String, DataState<Video>>{}.obs;

  // Future<void> getVideoYoutubeInfo(String url) async {
  //   if (pool.containsKey(url)) return;
  //   pool[url] = null;
  //   final result = await musicUC.getVideoYoutubeInfo(url);
  //   if (result is DataSuccess<Y2MateVideoDetail>) {
  //     pool[url] = result.data;
  //     pool.refresh();
  //   } else if (result is DataFailure<Y2MateVideoDetail>) {
  //     pool[url] = Y2MateVideoDetail.error(result.message);
  //     pool.refresh();
  //   }
  // }

  Future<void> getVideoById(String id) async {
    if (pool.containsKey(id)) return;
    pool[id] = LoadingState();
    final result = await musicUC.getYoutubeVideoFromId(id);
    pool[id] = result;
    pool.refresh();
  }

  Future<void> startDownload() async {
    final items =
        pool.values.whereType<DataSuccess<Video>>().map((e) => e.data).toList();
    final shouldClear =
        await Get.toNamed(Routes.musicDownloading, arguments: items);
    if (shouldClear is bool && shouldClear) pool.clear();
  }

  void addToPool() {
    final url = inputController.text;

    final id = VideoId.parseVideoId(url);
    if (id != null) {
      getVideoById(id);
      inputController.clear();
      return;
    }

    showSnackBar('Input not valid');
  }
}
