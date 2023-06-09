import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocalAvatar extends StatelessWidget {
  const LocalAvatar({
    super.key,
    this.path,
    this.size = 56,
  });
  final double size;

  final String? path;
  @override
  Widget build(BuildContext context) {
    if (path == null) {
      return SizedBox(
        height: size,
        width: size,
        child: SvgPicture.asset('assets/svg/Regular/UserCircle.svg'),
      );
    } else {
      return ClipOval(
        child: Image.file(
          File(path!),
          height: size,
          width: size,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}
