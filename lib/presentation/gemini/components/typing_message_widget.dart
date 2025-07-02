import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/chat_message.dart';
import 'package:flutter/widgets.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'author_avatar.dart';

class TypingMessageWidget extends StatelessWidget {
  const TypingMessageWidget({super.key, required this.data});
  final TypingMessage data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthorAvatar(author: data.author),
        sizedBoxW12,
        const Expanded(child: Skeletonizer(child: Bone.multiText(lines: 2))),
      ],
    );
  }
}
