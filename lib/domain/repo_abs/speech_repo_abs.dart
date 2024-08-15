import 'package:scheduler/core/usecase/data_state.dart';

abstract class SpeechRepo {
  Future<DataState> speak(String sentence);
  Future<DataState> stop();
  Future<DataState> toggleSpeak();
  Future<DataState> setting(
      {String? locate, double? volume, double? pitch, double? rate});
  Future<DataState> setVoice(String name, String locate);
}
