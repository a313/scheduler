import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DataMessageWidget extends StatelessWidget {
  const DataMessageWidget({super.key, required this.data});
  final DataMessage data;

  @override
  Widget build(BuildContext context) {
    final mine = data.mimeType;
    if (mine.startsWith('image')) {
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
    final extension = extensionFromMime(mine);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: borRad08,
              color: context.theme.dividerColor,
            ),
            child: SvgPicture.asset(getFileByExtension(extension)),
          ),
          sizedBoxW06,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.fileName?.split('.').first ?? 'File',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                sizedBoxH02,
                Text(
                  extension.toUpperCase(),
                  style: context.theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          sizedBoxW06,
        ],
      ),
    );
  }

  String getFileByExtension(String extension) {
    if (extension.startsWith('pdf')) {
      return 'assets/svg/Regular/FilePdf.svg';
    } else if (extension.startsWith('css')) {
      return 'assets/svg/Regular/FileCss.svg';
    } else if (extension.startsWith('zip')) {
      return 'assets/svg/Regular/FileZip.svg';
    } else if (extension.startsWith('rar')) {
      return 'assets/svg/Regular/FileZip.svg';
    } else if (extension.startsWith('csv')) {
      return 'assets/svg/Regular/FileCsv.svg';
    } else if (extension.startsWith('dat')) {
      return 'assets/svg/Regular/FileDat.svg';
    } else if (extension.startsWith('doc')) {
      return 'assets/svg/Regular/FileDoc.svg';
    } else if (extension.startsWith('ppt')) {
      return 'assets/svg/Regular/FilePpt.svg';
    } else if (extension.startsWith('text')) {
      return 'assets/svg/Regular/FileText.svg';
    } else {
      return 'assets/svg/Regular/File.svg';
    }
  }
}
