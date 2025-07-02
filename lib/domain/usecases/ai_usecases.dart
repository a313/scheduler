import 'package:firebase_ai/firebase_ai.dart';

import '../../core/usecase/data_state.dart';
import '../repo_abs/ai_repo_abs.dart';

class AiUsecases {
  final AiRepo _repo;

  AiUsecases(this._repo);

  Future<DataState<ChatSession>> startChat() async {
    return await _repo.startChat();
  }

  Future<DataState<GenerateContentResponse>> sendMessage(
    ChatSession session,
    Content content,
  ) async {
    return await _repo.sendMessage(session, [content]);
  }

  Future<DataState<GenerateContentResponse>> sendSingleMessage(
    String message,
  ) async {
    return await _repo.sendSingleMessage(message);
  }
}
