import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/domain/usecases/ai_usecases.dart';
import 'package:uuid/uuid.dart';

class AiController extends BaseController {
  final AiUsecases usecase = Get.find<AiUsecases>();

  final User user = const User(id: '123123');
  final gemini = const User(id: 'gemini', lastName: 'Gemini');
  final List<Message> messages = [];
  List<Content> prompt = [];

  Future<void> onSendPressed(PartialText msg) async {
    prompt.add(Content.text(msg.text));
    final mSend = TextMessage(
      author: user,
      id: const Uuid().v4(),
      text: msg.text,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );
    messages.insert(0, mSend);
    update();
    final result = await usecase.generateContent(prompt);
    late TextMessage mReceived;
    if (result is DataSuccess) {
      mReceived = TextMessage(
        author: gemini,
        id: const Uuid().v4(),
        text: result.data,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
    } else if (result is DataFailure) {
      mReceived = TextMessage(
        author: gemini,
        id: const Uuid().v4(),
        text: result.message,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
    }
    messages.insert(0, mReceived);
    update();
  }

  void onAttachmentPressed() {}

  void onMessageTap(BuildContext context, Message msg) {}
}
