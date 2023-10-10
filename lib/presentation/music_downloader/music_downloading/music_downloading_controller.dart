import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/y2_mate_download_link.dart';
import 'package:scheduler/data/models/y2_mate_video_detail.dart';
import 'package:scheduler/domain/usecases/music_usecases.dart';
import 'package:scheduler/widgets/base/base_button.dart';
import 'package:scheduler/widgets/base/base_popup.dart';

class MusicDownloadingController extends BaseController {
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
    final isSuccess = (await Future.wait(listFuture)).reduce((value, e) {
      if (e == false) value = false;
      return value;
    });
    update();
    timer?.cancel();
    if (isSuccess) {
      showPopup(BasePopup(title: 'Download completed', actions: [
        BaseButton.mediumPrimary(
            title: 'Ok',
            onPressed: () {
              Get.back();
              Get.back(result: true);
            })
      ]));
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  Future<bool> download(Y2MateVideoDetail data) async {
    final mp3 = data.links.mp3;
    if (mp3 == null || mp3.isEmpty) {
      return false;
    }

    final key = mp3.entries.last.value.k;
    final videoId = data.vid;
    final url = await getUrl(data.vid, key);
    if (url != null) {
      final path = "$docPath/$videoId";
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
        await musicUC.downloadThumb(data.thumbnailUrl, thumbPath);
        await musicUC.fillMetadata(mp3Path, thumbPath, data);
        return true;
      } else if (mp3Rp is DataFailure<bool>) {
        log(mp3Rp.message);
      }
    }
    return false;
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
