import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_tts/flutter_tts_web.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/domain/usecases/ai_usecases.dart';
import 'package:scheduler/domain/usecases/speech_usecases.dart';
import 'package:scheduler/widgets/base/base_bottom_sheet.dart';
import 'package:uuid/uuid.dart';

class AiController extends BaseController {
  final AiUsecases usecase = Get.find<AiUsecases>();
  final speech = Get.find<SpeechUsecases>();

  final Rx<TtsState> speechState = TtsState.stopped.obs;

  final User user = const User(id: '123123');
  final gemini = const User(id: 'gemini', lastName: 'Gemini');
  final List<Message> messages = [];
  List<Content> prompt = [];

  _addMessage(Message msg) {
    messages.insert(0, msg);
    update();
  }

  Future<void> onSendPressed(PartialText msg) async {
    final mSend = TextMessage(
      author: user,
      id: const Uuid().v4(),
      text: msg.text,
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );
    _addMessage(mSend);
    prompt.add(Content.text(msg.text));
    _askGemini();
  }

  Future<void> _askGemini() async {
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
    _addMessage(mReceived);
  }

  void onAttachmentPressed() {
    bottomSheet(BaseBottomSheet(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CupertinoActionSheetAction(
          onPressed: () {
            Get.back();
            _handleImageSelection();
          },
          child: const Text('photo'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Get.back();
            _handleFileSelection();
          },
          child: const Text('file'),
        ),
      ],
    )));
  }

  void onMessageTap(BuildContext context, Message msg) {
    speech.speak(msg.toString());
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);
      final mineType = lookupMimeType(result.path);
      final message = ImageMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );
      _addMessage(message);
      prompt.add(Content.data(mineType ?? 'jpeg', bytes));
    }
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final mineType = lookupMimeType(result.files.single.path!);
      final message = FileMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: mineType,
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );
      _addMessage(message);

      prompt.add(Content.data(mineType ?? 'jpeg',
          File(result.files.single.path!).readAsBytesSync()));
    }
  }
}
