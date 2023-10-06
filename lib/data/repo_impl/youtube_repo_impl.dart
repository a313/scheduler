import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/domain/repo_abs/youtube_repo_abs.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeRepoImpl extends YoutubeRepo {
  final YoutubeExplode _ = YoutubeExplode();

  @override
  Future<DataState<List<String>>> getDownloadUrl(String id) async {
    final StreamManifest manifest =
        await _.videos.streamsClient.getManifest(id);
    final List<AudioOnlyStreamInfo> sortedStreamInfo =
        manifest.audioOnly.sortByBitrate();

    final urls = [
      sortedStreamInfo.first.url.toString(),
      sortedStreamInfo.last.url.toString(),
    ];
    return DataSuccess(urls);
  }

  @override
  Future<DataState<Video>> getVideoFromId(String id) async {
    try {
      final result = await _.videos.get(id);
      return DataSuccess(result);
    } catch (e) {
      return DataFailure(e.runtimeType.toString(), e.toString());
    }
  }
}
