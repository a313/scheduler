import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/video_info.dart';
import 'package:scheduler/domain/usecases/music_usecases.dart';

class MusicDownloadingController extends GetxController {
  MusicDownloadingController({
    required this.data,
  });
  final List<VideoInfo> data;
  late String docPath;
  final musicUC = Get.find<MusicUseCases>();

  @override
  void onInit() {
    getDocPath();
    super.onInit();
  }

  Future<void> download(VideoInfo data) async {
    final info = data.info;
    final dlUrl = data.dlAudio;
    if (info == null || dlUrl == null) return;
    final id = info.videoId;
    final thumUrl = info.thumbnails[(info.thumbnails.length ~/ 2)].url;
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
}
