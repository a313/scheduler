import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/domain/repo_abs/speech_repo_abs.dart';

class SpeechUsecases {
  final SpeechRepo repo;

  SpeechUsecases(this.repo);

  Future<DataState> speak(String sentence) {
    return repo.speak(sentence);
  }

  Future<DataState> stop() {
    return repo.stop();
  }

  Future<DataState> toggleSpeak() {
    return repo.toggleSpeak();
  }

  Future<DataState> setting(
      {String? locate, double? volume, double? pitch, double? rate}) {
    return repo.setting(
        locate: locate, volume: volume, pitch: pitch, rate: rate);
  }

  Future<DataState> setVoice({required String name, required String locate}) {
    return repo.setVoice(name, locate);
  }
}
