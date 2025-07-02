import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/data/models/chat_message.dart';
import 'package:aio/data/models/chat_user.dart';
import 'package:aio/domain/usecases/ai_usecases.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:super_clipboard/super_clipboard.dart';

class GeminiController extends GetxController {
  final AiUsecases usecase = Get.find<AiUsecases>();

  final user = ChatUser(uid: '123123', name: 'Me');
  final gemini = ChatUser.gemini();
  final List<ChatMessage> messages = [];

  final mesController = TextEditingController();

  late FocusNode focusNode;

  late ChatSession session;

  RxList<ChatMessage> attachments = RxList.empty();

  @override
  void onInit() {
    focusNode = FocusNode(onKeyEvent: _handleKeyPress);
    startChat();
    super.onInit();
  }

  KeyEventResult _handleKeyPress(FocusNode node, KeyEvent event) {
    final sendEvent = event is KeyDownEvent &&
        (event.physicalKey == PhysicalKeyboardKey.enter ||
            event.physicalKey == PhysicalKeyboardKey.numpadEnter) &&
        !HardwareKeyboard.instance.physicalKeysPressed.any(
          (key) => <PhysicalKeyboardKey>{
            PhysicalKeyboardKey.shiftLeft,
            PhysicalKeyboardKey.shiftRight,
          }.contains(key),
        );
    final pasteEvent = event is KeyDownEvent &&
        event.physicalKey == PhysicalKeyboardKey.keyV &&
        HardwareKeyboard.instance.physicalKeysPressed.any(
          (key) => <PhysicalKeyboardKey>{
            PhysicalKeyboardKey.controlLeft,
            PhysicalKeyboardKey.controlRight,
          }.contains(key),
        );

    if (sendEvent) {
      onSendMessage();
      return KeyEventResult.handled;
    } else if (pasteEvent) {
      onPastedData();
      return KeyEventResult.handled;
    } else {
      return KeyEventResult.ignored;
    }
  }

  Future<void> startChat() async {
    final result = await usecase.startChat();
    if (result is DataSuccess<ChatSession>) {
      session = result.data;
    } else if (result is DataFailure<ChatSession>) {
      //TODO
    }
  }

  void _addMessage(ChatMessage msg) {
    messages.insert(0, msg);
    update();
  }

  void _addResponse(ChatMessage msg) {
    messages.insert(0, msg);
    update();
  }

  void onSendMessage({String? msg}) {
    msg ??= mesController.text;
    final trimmed = msg.trim();
    if (trimmed.isEmpty) return;
    List<Part> parts = [];
    for (var attach in attachments) {
      if (attach is DataMessage) {
        messages.insert(0, attach);
        parts.add(DataPart(attach.mimeType, attach.data));
      }
    }
    final mSend = ChatMessage.text(
      author: user,
      message: trimmed,
      createAtTs: DateTime.now().millisecondsSinceEpoch,
    );
    _addMessage(mSend);
    attachments.clear();
    parts.add(TextPart(trimmed));
    _askGemini(Content.multi(parts));
    mesController.clear();
  }

  Future<void> _askGemini(Content content) async {
    late ChatMessage mReceived;
    final typing = TypingMessage(
      author: gemini,
      createAtTs: DateTime.now().millisecondsSinceEpoch,
    );
    _addMessage(typing);
    final result = await usecase.sendMessage(session, content);

    if (result is DataSuccess<GenerateContentResponse>) {
      mReceived = ChatMessage.text(
        author: gemini,
        message: result.data.text ?? '',
        createAtTs: DateTime.now().millisecondsSinceEpoch,
      );
    } else if (result is DataFailure<GenerateContentResponse>) {
      mReceived = ChatMessage.text(
        author: gemini,
        message: result.message,
        createAtTs: DateTime.now().millisecondsSinceEpoch,
      );
    }
    messages.remove(typing);
    update();
    _addResponse(mReceived);
  }

  void onTapImage() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (result != null) {
      final bytes = await result.readAsBytes();
      final mimeType = lookupMimeType(result.name) ?? 'image/jpeg';
      _addDataMessage(data: bytes, name: result.name, mime: mimeType);
    }
  }

  void onTapFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );

    if (result == null || result.xFiles.isEmpty) return;
    for (var file in result.files) {
      final bytes = await file.xFile.readAsBytes();
      if (bytes.isEmpty) continue;
      final mimeType = lookupMimeType(file.name);
      _addDataMessage(data: bytes, name: file.name, mime: mimeType);
    }
  }

  void _addDataMessage({
    required Uint8List data,
    required String name,
    String? mime,
  }) {
    final message = DataMessage(
      author: user,
      createAtTs: DateTime.now().millisecondsSinceEpoch,
      data: data,
      fileName: name,
      mimeType: mime ?? 'unknown',
    );
    attachments.add(message);
  }

  void onRemoveAttachment(ChatMessage data) {
    attachments.remove(data);
  }

  Future<void> onPastedData() async {
    final reader = await SystemClipboard.instance?.read();
    if (reader == null) return;
    //Pasted text
    if (reader.items.length == 1) {
      final item = reader.items.first;
      final pasted = await item.readValue(Formats.plainText);
      if (pasted != null) {
        final selection = mesController.selection;
        final oldText = mesController.text;
        final newText = oldText.substring(0, selection.end) +
            pasted +
            oldText.substring(selection.end);
        mesController.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(
            offset: selection.end + pasted.length,
          ),
        );
        return;
      }
    }
    //Pasted files, images or videos
    for (var item in reader.items) {
      item.getFile(null, (file) async {
        final bytes = await file.getStream().toBytes();
        final fileName = file.fileName;
        if (fileName == null) return;
        final mimeType = lookupMimeType(fileName);
        _addDataMessage(data: bytes, name: fileName, mime: mimeType);
      });
    }
  }
}
