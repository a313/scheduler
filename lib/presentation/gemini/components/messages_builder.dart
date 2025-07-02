import 'package:aio/data/models/chat_message.dart';
import 'package:flutter/material.dart';

import 'data_message_widget.dart';
import 'file_message_widget.dart';
import 'text_message_widget.dart';
import 'typing_message_widget.dart';

class MessagesBuilder extends StatelessWidget {
  final ChatMessage data;
  final Function()? onTap;
  final Function()? onDoubleTap;

  const MessagesBuilder({
    super.key,
    required this.data,
    this.onTap,
    this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    return data.map(
      data:
          (data) => Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:
                data.author.isGemini
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
            children: [DataMessageWidget(data: data)],
          ),
      file:
          (data) => Padding(
            padding: const EdgeInsets.only(left: 64.0),
            child: FileMessageWidget(data: data),
          ),
      text: (data) => TextMessageWidget(data: data),
      typing: (data) => TypingMessageWidget(data: data),
    );
  }
}
