import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:scheduler/core/usecase/data_state.dart';

abstract class AiRepo {
  Future<DataState> generateContent(List<Content> prompt);
}
