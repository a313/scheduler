import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_user.freezed.dart';
part 'chat_user.g.dart';

const gemini_uid = '_gg_gemini';

@freezed
sealed class ChatUser with _$ChatUser {
  const ChatUser._();
  factory ChatUser({
    required String uid,
    required String name,
    String? avatarUrl,
  }) = _ChatUser;
  factory ChatUser.gemini() => ChatUser(uid: gemini_uid, name: 'Gemini');
  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);

  bool get isGemini => uid == gemini_uid;
}
