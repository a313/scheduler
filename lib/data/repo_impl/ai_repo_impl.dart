import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/domain/repo_abs/ai_repo_abs.dart';

import '../services/ai_service.dart';

class AiRepoImpl extends AiRepo {
  final AiService api;
  AiRepoImpl(this.api);

  @override
  Future<DataState> generateContent(List<Content> prompt) async {
    final result = await api.generateContent(prompt);
    if (result != null) return DataSuccess(result);
    return DataFailure('-1', 'noResponse');
  }
}
