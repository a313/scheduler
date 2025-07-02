import 'package:firebase_ai/firebase_ai.dart';

import '../../core/usecase/data_state.dart';

abstract class AiRepo {
  Future<DataState<ChatSession>> startChat();
  Future<DataState<GenerateContentResponse>> sendMessage(
    ChatSession session,
    List<Content> contents,
  );
  Future<DataState<GenerateContentResponse>> sendSingleMessage(String message);
}
