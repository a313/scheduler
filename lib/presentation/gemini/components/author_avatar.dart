import 'package:aio/data/models/chat_user.dart';
import 'package:aio/widgets/avatar_picker.dart';
import 'package:flutter/material.dart';

class AuthorAvatar extends StatelessWidget {
  const AuthorAvatar({super.key, required this.author, this.size = 24.0});

  final ChatUser author;
  final double size;
  @override
  Widget build(BuildContext context) {
    if (author.isGemini) {
      return Image.asset(
        'assets/png/gemini-icon_480.png',
        width: size,
        height: size,
      );
    }
    return AvatarWidget(name: author.name, url: author.avatarUrl, size: size);
  }
}
