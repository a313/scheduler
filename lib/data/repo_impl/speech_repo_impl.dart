// import 'package:flutter_tts/flutter_tts.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/domain/repo_abs/speech_repo_abs.dart';

class SpeechRepoImpl extends SpeechRepo {
  // final _ = FlutterTts();
  SpeechRepoImpl() {
    // _.setSharedInstance(true);
  }

  @override
  Future<DataState> setVoice(String name, String locate) async {
    // final result = await _.setVoice({"name": name, "locale": locate});
    return DataSuccess(null);
  }

  @override
  Future<DataState> setting(
      {String? locate, double? volume, double? pitch, double? rate}) async {
    List<Future> progress = [];
    // if (locate != null) progress.add(_.setLanguage(locate));
    // if (volume != null) progress.add(_.setVolume(volume));
    // if (pitch != null) progress.add(_.setPitch(pitch));
    // if (rate != null) progress.add(_.setSpeechRate(rate));
    return DataSuccess(await Future.wait(progress));
  }

  @override
  Future<DataState> speak(String sentence) async {
    // final result = await _.speak(sentence);
    if ("result" == 1) {
      return DataSuccess(1);
    } else {
      return DataFailure('-1', 'can speech');
    }
  }

  @override
  Future<DataState> stop() async {
    // final result = await _.stop();
    return DataSuccess("result");
  }

  @override
  Future<DataState> toggleSpeak() {
    throw UnimplementedError();
  }
}
