import 'package:firebase_ai/firebase_ai.dart';

import '../../core/usecase/data_state.dart';
import '../../domain/repo_abs/ai_repo_abs.dart';

class AiRepoImpl extends AiRepo {
  late GenerativeModel _model;

  AiRepoImpl() {
    _initializeModel();
  }

  void _initializeModel() {
    try {
      // Initialize Firebase AI with Google AI backend
      final ai = FirebaseAI.googleAI();
      _model = ai.generativeModel(model: 'gemini-2.0-flash-exp');
    } catch (e) {
      throw Exception('Failed to initialize AI model: $e');
    }
  }

  @override
  Future<DataState<ChatSession>> startChat() async {
    try {
      final session = _model.startChat();
      return DataSuccess(session);
    } catch (e) {
      return DataFailure('CHAT_START_ERROR', 'Failed to start chat: $e');
    }
  }

  @override
  Future<DataState<GenerateContentResponse>> sendMessage(
      ChatSession session, List<Content> contents) async {
    try {
      final response = await session.sendMessage(contents.first);
      return DataSuccess(response);
    } catch (e) {
      return DataFailure('SEND_MESSAGE_ERROR', 'Failed to send message: $e');
    }
  }

  @override
  Future<DataState<GenerateContentResponse>> sendSingleMessage(
      String message) async {
    try {
      final response = await _model.generateContent([Content.text(message)]);
      return DataSuccess(response);
    } catch (e) {
      return DataFailure(
          'GENERATE_CONTENT_ERROR', 'Failed to generate content: $e');
    }
  }
}
