import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aio/core/state_management/base_common_widget.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/theme/app_fonts.dart';

import 'local_avatar.dart';

class AvatarPicker extends StatefulWidget {
  const AvatarPicker({
    super.key,
    this.onChangedAvatar,
    this.imagePath,
  });
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
                color: context.primaryDark),
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
    bottomSheet(SafeArea(
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
    ));
  }
}
