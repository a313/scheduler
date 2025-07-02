import 'dart:typed_data';

import 'package:aio/data/models/chat_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';

@freezed
sealed class ChatMessage with _$ChatMessage {
  const factory ChatMessage.file({
    required ChatUser author,
    required int createAtTs,
    required Uri uri,
    String? roomId,
  }) = FileMessage;
  const factory ChatMessage.data({
    required ChatUser author,
    required int createAtTs,
    required Uint8List data,
    required String mimeType,
    String? roomId,
    String? fileName,
  }) = DataMessage;
  const factory ChatMessage.text({
    required ChatUser author,
    required int createAtTs,
    required String message,
    String? roomId,
  }) = TextMessage;

  const factory ChatMessage.typing({
    required ChatUser author,
    required int createAtTs,
  }) = TypingMessage;
}
