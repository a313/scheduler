import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class BottomOptionCamera extends StatelessWidget {
  const BottomOptionCamera({
    Key? key,
    required this.botText,
    required this.enableBtn,
    required this.onPickImage,
    required this.onTakePicture,
    required this.recentPhoto,
    this.onSwapCamera,
    required this.bgColor,
  }) : super(key: key);

  final String botText;

  final bool enableBtn;
  final Function()? onPickImage;
  final Function()? onTakePicture;
  final Function()? onSwapCamera;
  final Uint8List recentPhoto;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              botText,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: AppFonts.bMedium.copyWith(
                color: context.neutral100,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: onPickImage,
                  child: recentPhoto.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.memory(
                            recentPhoto,
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          ),
                        )
                      : const Icon(
                          Icons.photo_library,
                          color: Colors.white,
                          size: 60,
                        ),
                ),
                AbsorbPointer(
                  absorbing: !enableBtn,
                  child: InkWell(
                    autofocus: true,
                    onTap: onTakePicture,
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: context.neutral100,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: context.neutral100,
                        size: 28,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: onSwapCamera,
                  child: const Icon(
                    Icons.cameraswitch,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.viewPadding.bottom,
          ),
        ],
      ),
    );
  }
}
