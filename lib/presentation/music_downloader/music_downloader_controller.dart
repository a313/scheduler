import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/domain/usecases/music_usecases.dart';
import 'package:scheduler/routes/routes.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MusicDownloaderController extends BaseController {
  final musicUC = Get.find<MusicUseCases>();
  TextEditingController inputController = TextEditingController();

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
    final items = pool.values.whereType<DataSuccess<Video>>().toList();
    final shouldClear =
        await Get.toNamed(Routes.musicDownloading, arguments: items);
    if (shouldClear is bool && shouldClear) pool.clear();
  }

  void addToPool() {
    final url = inputController.text;

    final id = findYoutubeId(url);
    if (id != null) {
      getVideoById(id);
      inputController.clear();
      return;
    }

    showSnackBar('Input not valid');
  }

  String? findYoutubeId(String source) {
    String keywordStart = "v=";
    String keywordEnd = "&";

    int startIndex = source.indexOf(keywordStart);
    int endIndex = source.indexOf(keywordEnd);

    if (startIndex != -1 && endIndex != -1) {
      String substring =
          source.substring(startIndex + keywordStart.length, endIndex);
      return substring;
    }
    return null;
  }
}
