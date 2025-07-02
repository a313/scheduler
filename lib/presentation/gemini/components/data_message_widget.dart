import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/chat_message.dart';
import 'package:flutter/material.dart';

class DataMessageWidget extends StatelessWidget {
  const DataMessageWidget({super.key, required this.data});
  final DataMessage data;

  @override
  Widget build(BuildContext context) {
    final mime = data.mimeType;
    if (mime.startsWith('image')) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.screenWidth * 0.5,
          maxHeight: context.screenWidth * 0.5,
        ),
        child: ClipRRect(
          borderRadius: borRad08,
          child: Image.memory(data.data, fit: BoxFit.cover),
        ),
      );
    }
    final extension = _extensionFromMime(mime);
    final isImage = extension?.startsWith('image') == true;
    return Container(
      decoration: BoxDecoration(
        borderRadius: borRad08,
        color: context.neutral200,
      ),
      padding: padAll08,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isImage ? Icons.image : Icons.insert_drive_file,
            color: context.primaryDark,
          ),
          sizedBoxW08,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.fileName ?? 'Unknown file',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: context.neutral1100,
                  ),
                ),
                Text(
                  extension ?? mime,
                  style: TextStyle(
                    fontSize: 12,
                    color: context.neutral600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String? _extensionFromMime(String mimeType) {
    // Simple mime to extension mapping
    const mimeToExt = {
      'image/jpeg': 'jpeg',
      'image/jpg': 'jpg',
      'image/png': 'png',
      'image/gif': 'gif',
      'image/webp': 'webp',
      'application/pdf': 'pdf',
      'text/plain': 'txt',
      'application/json': 'json',
      'application/xml': 'xml',
      'application/zip': 'zip',
      'application/x-rar-compressed': 'rar',
      'application/msword': 'doc',
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
          'docx',
      'application/vnd.ms-excel': 'xls',
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
          'xlsx',
    };

    return mimeToExt[mimeType] ?? mimeType.split('/').last;
  }
}
