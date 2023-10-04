import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/video_info.dart';
import 'package:scheduler/domain/usecases/music_usecases.dart';

class MusicDownloaderController extends GetxController {
  final musicUC = Get.find<MusicUseCases>();

  late String docPath;

  bool isDownloading = false;
  double totalPercent = 0.0;
  String urls = '';

  @override
  void onInit() {
    super.onInit();
    getDocPath();
  }

  Future<void> getVideoInfo(String url) async {
    final result = await musicUC.getVideoInfo(url);
    if (result is DataSuccess<VideoInfo>) {
      log(result.data.toString());
      download(result.data);
    } else if (result is DataFailure<VideoInfo>) {
      log(result.message);
    }
  }

  Future<void> download(VideoInfo data) async {
    final id = data.info.videoId;
    final dlUrl = data.dlAudio;
    final thumUrl =
        data.info.thumbnails[(data.info.thumbnails.length ~/ 2)].url;
    final path = "$docPath/$id";
    final mp3Path = '$path.mp3';
    final thumbPath = '$path.jpg';
    final mp3Rp = await musicUC.downloadMp3(
      dlUrl,
      mp3Path,
      progress: (count, total) {
        final percent = count / total;
        log(percent.toString());
      },
    );
    if (mp3Rp is DataSuccess) {
      musicUC.downloadThumb(thumUrl, thumbPath);
    } else if (mp3Rp is DataFailure<bool>) {
      log(mp3Rp.message);
    }
  }

  Future<void> getDocPath() async {
    Directory? directory;
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    }
    docPath = directory!.path;
  }

  void startDownload() {
    final urlSplit = urls.split(',');
    for (var url in urlSplit) {
      if (url.isURL) {
        getVideoInfo(url);
      }
    }
  }

  void onChangeUrls(String urls) {
    urls = urls;
  }
}
