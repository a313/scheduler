import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

import 'media_thumb.dart';

class MusicItem extends StatelessWidget {
  const MusicItem({
    Key? key,
    required this.file,
    this.thumbnail,
    required this.onTap,
  }) : super(key: key);

  final File file;
  final Uri? thumbnail;
  final Function(File file) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(file),
      child: Row(
        children: [
          Expanded(child: MediaThumb(thumbnail)),
          sizedBoxW08,
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sizedBoxH04,
                Text(
                  file.fileName,
                  maxLines: 2,
                  style: AppFonts.bMedium,
                ),
                sizedBoxH02,
                Text(
                  file.lengthSync().toString(),
                  maxLines: 1,
                  style: AppFonts.bSmall.copyWith(color: context.neutral900),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
