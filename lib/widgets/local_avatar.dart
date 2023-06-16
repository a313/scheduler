import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class LocalAvatar extends StatelessWidget {
  const LocalAvatar({
    super.key,
    this.path,
    this.size = 56,
    this.name,
  });
  final double size;

  final String? path;
  final String? name;
  @override
  Widget build(BuildContext context) {
    if (path != null && File(path!).existsSync()) {
      return ClipOval(
        child: Image.file(
          File(path!),
          height: size,
          width: size,
          fit: BoxFit.cover,
        ),
      );
    } else if (name != null && name!.isNotEmpty) {
      return SizedBox(
        height: size,
        width: size,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: name!.nameToColor(),
          ),
          child: AutoSizeText(
            name!.substring(0, 1).toUpperCase(),
            style: AppFonts.h700,
            minFontSize: 5,
          ),
        ),
      );
    }
    return SizedBox(
      height: size,
      width: size,
      child: SvgPicture.asset('assets/svg/Regular/UserCircle.svg'),
    );
  }
}
