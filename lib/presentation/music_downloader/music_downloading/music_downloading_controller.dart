import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/usecases/music_usecases.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MusicDownloadingController extends GetxController {
  MusicDownloadingController({
    required this.data,
  });
  final List<Video> data;
  late String docPath;
  final musicUC = Get.find<MusicUseCases>();
  Timer? timer;
  Map<Video, double> downloadData = {};

  @override
  void onInit() {
    MetadataGod.initialize();
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

  Future<void> download(Video data) async {
    final id = data.id.value;

    final url = await getUrl(id);
    final path = "$docPath/${data.title}";
    final mp3Path = '$path.${data.title}.m4a';

    final mp3Rp = await musicUC.downloadMp3(
      url.last,
      mp3Path,
      progress: (count, total) {
        final percent = count / total;
        downloadData[data] = percent;
      },
    );
    if (mp3Rp is DataSuccess) {
      writeMetadata(data, path);
    } else if (mp3Rp is DataFailure<bool>) {
      log(mp3Rp.message);
    }
  }

  Future<List<String>> getUrl(String id) async {
    final url = await musicUC.getYoutubeDownloadUrl(id);
    if (url is DataSuccess<List<String>>) {
      log(url.data.join(','));
      return url.data;
    }
    return [];
  }

  Future<void> getDocPath() async {
    final directory = await Utils.getDirectory(path: 'musics');
    docPath = directory.path;
  }

  Future<void> writeMetadata(Video data, String path) async {
    final thumb = await GetConnect().get(data.thumbnails.highResUrl);
    Picture? picture;
    if (thumb.statusCode == 200) {
      final byte = thumb.body as Uint8List;
      picture = Picture(mimeType: '.jpeg', data: byte);
    }
    await MetadataGod.writeMetadata(
        file: path,
        metadata: Metadata(
          title: data.title,
          artist: data.author,
          picture: picture,
        ));
  }
}
