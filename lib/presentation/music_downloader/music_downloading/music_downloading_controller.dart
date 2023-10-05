import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/y2_mate_download_link.dart';
import 'package:scheduler/data/models/y2_mate_video_detail.dart';
import 'package:scheduler/domain/usecases/music_usecases.dart';

class MusicDownloadingController extends GetxController {
  MusicDownloadingController({
    required this.data,
  });
  final List<Y2MateVideoDetail> data;
  late String docPath;
  final musicUC = Get.find<MusicUseCases>();
  Timer? timer;
  Map<Y2MateVideoDetail, double> downloadData = {};

  @override
  void onInit() {
    for (var d in data) {
      downloadData[d] = 0.0;
    }
    getDocPath().then((value) => startDownload());
    super.onInit();
  }

  Future<void> startDownload() async {
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      update();
    });
    final listFuture = data.map((e) => download(e));
    await Future.wait(listFuture);
    update();
    timer?.cancel();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  Future<void> download(Y2MateVideoDetail data) async {
    final mp3 = data.links.mp3;
    if (mp3 == null || mp3.isEmpty) {
      return;
    }

    final key = mp3.entries.last.value.k;

    final url = await getUrl(data.vid, key);
    if (url != null) {
      final path = "$docPath/${url.title}";
      final mp3Path = '$path.${url.ftype}';
      final thumbPath = '$path.jpg';
      final mp3Rp = await musicUC.downloadMp3(
        url.dlink,
        mp3Path,
        progress: (count, total) {
          final percent = count / total;
          downloadData[data] = percent;
        },
      );
      if (mp3Rp is DataSuccess) {
        musicUC.downloadThumb(data.thumbnailUrl, thumbPath);
      } else if (mp3Rp is DataFailure<bool>) {
        log(mp3Rp.message);
      }
    }
  }

  Future<Y2MateDownloadLink?> getUrl(String id, String key) async {
    final url = await musicUC.getDownloadUrl(id, key);
    if (url is DataSuccess<Y2MateDownloadLink>) {
      return url.data;
    }
    return null;
  }

  Future<void> getDocPath() async {
    final directory = await Utils.getDirectory(path: 'musics');
    docPath = directory.path;
  }
}
