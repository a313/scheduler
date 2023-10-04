import 'package:scheduler/core/network/base_response.dart';
import 'package:scheduler/core/network/dio_service.dart';

abstract class MusicService extends DioService {
  Future<BaseResponse> getVideoInfo(String url);
}

class MusicServiceImpl extends MusicService {
  @override
  String get domain => '';
  @override
  Future<BaseResponse> getVideoInfo(String url) {
    const apiGetInfo = 'https://api.akuari.my.id/downloader/youtube?link=';
    return get(endPoint: apiGetInfo + url);
  }
}
