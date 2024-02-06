import 'package:scheduler/core/usecase/data_state.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

abstract class YoutubeRepo {
  Future<DataState<Video>> getVideoFromId(String id);
  Future<DataState<List<String>>> getDownloadUrl(String id);
}
