import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:scheduler/core/usecase/data_state.dart';

import '../repo_abs/ai_repo_abs.dart';

class AiUsecases {
  final AiRepo repo;

  AiUsecases(this.repo);

  Future<DataState> generateContent(List<Content> prompt) async {
    return repo.generateContent(prompt);
  }
}
