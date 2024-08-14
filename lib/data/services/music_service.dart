import 'package:dio/dio.dart';
import 'package:scheduler/core/network/base_response.dart';
import 'package:scheduler/core/network/dio_service.dart';

abstract class MusicService extends DioService {
  // Future<BaseResponse> getVideoInfo(String url);
  Future<BaseResponse> searchVideos(String keyword);
  Future<BaseResponse> getVideoYoutubeInfo(String url);
  Future<BaseResponse> getDownloadUrl(String id, String key);
}

const TEST_URL =
    'https://www.youtube.com/watch?v=I-QfPUz1es8&ab_channel=ImagineDragonsVEVO';

class MusicServiceImpl extends MusicService {
  static const y2mateHeader = {
    "Accept":
        "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
    "User-Agent":
        "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36",
    "Accept-Language": "en-US,en;q=0.9",
    "referer": "https://y2mate.com",
    "x-requested-with": "XMLHttpRequest",
    "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
  };

  @override
  String get domain => '';
  // @override
  // Future<BaseResponse> getVideoInfo(String url) {
  //   const apiGetInfo = 'https://api.akuari.my.id/downloader/youtube?link=';
  //   return get(endPoint: apiGetInfo + url);
  // }

  @override
  Future<BaseResponse> getVideoYoutubeInfo(String url) {
    return post(
        endPoint: 'https://www.y2mate.com/mates/analyzeV2/ajax',
        params: {"k_query": url, "k_page": "home", "hl": "vi", "q_auto": "1"},
        options: Options(headers: y2mateHeader));
  }

  @override
  Future<BaseResponse> searchVideos(String keyword) {
    return post(
        endPoint: 'https://www.y2mate.com/mates/analyzeV2/ajax',
        params: {
          "k_query": keyword,
          "k_page": "home",
          "hl": "vi",
          "q_auto": "1"
        },
        options: Options(headers: y2mateHeader));
  }

  @override
  Future<BaseResponse> getDownloadUrl(String id, String key) {
    return post(
        endPoint: 'https://www.y2mate.com/mates/convertV2/index',
        params: {
          "vid": id,
          "k": key,
        },
        options: Options(headers: y2mateHeader));
  }
}
