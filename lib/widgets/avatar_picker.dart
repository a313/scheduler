import 'dart:io';

import 'package:aio/core/state_management/base_common_widget.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'local_avatar.dart';

class AvatarPicker extends StatefulWidget {
  const AvatarPicker({super.key, this.onChangedAvatar, this.imagePath});
  final String? imagePath;
  final Function(String path)? onChangedAvatar;

  @override
  State<AvatarPicker> createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> with BaseCommonWidgets {
  late String? imagePath;
  @override
  void initState() {
    imagePath = widget.imagePath;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showOption,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          LocalAvatar(path: imagePath),
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: context.neutral100,
              ),
              shape: BoxShape.circle,
              color: context.primaryDark,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/svg/Regular/Camera.svg',
                fit: BoxFit.contain,
                width: 16,
                height: 16,
                colorFilter: context.neutral100.filterSrcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> pickImage(ImageSource source) async {
    Get.back();
    final file = await Utils.pickImage(source: source);
    if (file != null) {
      widget.onChangedAvatar?.call(file.path);
      setState(() {
        imagePath = file.path;
      });
    }
  }

  void showOption() {
    bottomSheet(
      SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text(
                  "Chụp ảnh",
                  style: AppFonts.h400,
                  textScaler: TextScaler.linear(1),
                ),
                onTap: () => pickImage(ImageSource.camera),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text(
                  "Thư viện",
                  style: AppFonts.h400,
                  textScaler: TextScaler.linear(1),
                ),
                onTap: () => pickImage(ImageSource.gallery),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    this.path,
    this.name,
    this.url,
    this.size = 56,
  });
  final double size;
  final String? url;
  final String? path;
  final String? name;
  @override
  Widget build(BuildContext context) {
    late Widget image;
    if (path != null && File(path!).existsSync()) {
      image = Image.file(
        File(path!),
        height: size,
        width: size,
        fit: BoxFit.cover,
      );
    } else if (url != null && url!.isURL) {
      image = CachedNetworkImage(
        imageUrl: url!,
        fit: BoxFit.cover,
        placeholder:
            (_, __) => Padding(
              padding: const EdgeInsets.all(2.0),
              child: Skeleton.shade(child: Icon(Icons.person, size: size - 2)),
            ),
        errorWidget:
            (_, __, ___) =>
                SvgPicture.asset('assets/svg/Regular/UserCircle.svg'),
      );
    } else if (name != null && name!.isNotEmpty) {
      final p = name!.avatarName();
      final code = p.nameToColor();
      image = Container(
        height: size,
        width: size,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(shape: BoxShape.circle, color: code),
        child: Center(
          child: AutoSizeText(
            p,
            style: TextStyle(fontSize: 28 * size / 56, color: Colors.white),
            minFontSize: 5,
          ),
        ),
      );
    } else {
      image = SvgPicture.asset('assets/svg/Regular/UserCircle.svg');
    }
    return SizedBox(height: size, width: size, child: image);
  }
}
