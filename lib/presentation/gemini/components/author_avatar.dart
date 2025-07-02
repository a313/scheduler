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
      return Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
        ),
        child: Icon(Icons.auto_awesome, color: Colors.white, size: size * 0.6),
      );
    }
    return AvatarWidget(name: author.name, url: author.avatarUrl, size: size);
  }
}
