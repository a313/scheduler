import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/util.dart';

class MediaThumb extends StatelessWidget {
  const MediaThumb(this.uri, {super.key});
  final Uri? uri;
  @override
  Widget build(BuildContext context) {
    if (uri == null) {
      return Padding(
        padding: padSymHor08,
        child: SvgPicture.asset("assets/svg/Regular/MusicNotes.svg"),
      );
    }
    final isNetwork = uri!.scheme.contains('http');
    if (isNetwork) {
      return CachedNetworkImage(imageUrl: uri.toString());
    } else {
      return Image.file(File(uri!.toFilePath()));
    }
  }
}

class ByteThumb extends StatelessWidget {
  const ByteThumb(this.bytes, {super.key});
  final Uint8List? bytes;
  @override
  Widget build(BuildContext context) {
    if (bytes == null || bytes!.isEmpty) {
      return Padding(
        padding: padSymHor08,
        child: SvgPicture.asset("assets/svg/Regular/MusicNotes.svg"),
      );
    } else {
      return Image.memory(bytes!);
    }
  }
}
