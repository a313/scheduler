import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/chat_message.dart';
import 'package:flutter/material.dart';

import 'data_message_widget.dart';
import 'file_message_widget.dart';

class AttachmentBuilder extends StatelessWidget {
  final ChatMessage data;
  final Function(ChatMessage data)? onRemove;
  final Function(ChatMessage data)? onTap;

  const AttachmentBuilder({
    super.key,
    required this.data,
    this.onRemove,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 48,
        maxWidth: 160,
        minWidth: 48,
      ),
      decoration: BoxDecoration(
        borderRadius: borRad08,
        border: Border.all(color: context.disabledColor),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          GestureDetector(
            onTap: () => onTap?.call(data),
            child: ClipRRect(
              borderRadius: borRad08,
              child: data.map(
                data: (data) => DataMessageWidget(data: data),
                file: (data) => FileMessageWidget(data: data),
                text: (data) => const SizedBox(),
                typing: (data) => const SizedBox(),
              ),
            ),
          ),
          InkWell(
            onTap: () => onRemove?.call(data),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.surfaceSchemeColor,
              ),
              child: const Icon(Icons.clear_rounded, size: 14),
            ),
          ),
        ],
      ),
    );
  }
}
