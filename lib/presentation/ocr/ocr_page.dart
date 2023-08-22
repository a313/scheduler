import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';

import '../../widgets/base/base_scafold_appbar.dart';
import 'ocr_controller.dart';

class OcrPage extends GetView<OcrController> {
  const OcrPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'OCR',
      body: controller.obx(
        (state) => Stack(
          children: [
            CameraPreview(state!),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LibraryBtn(onTap: controller.uploadPicture),
                  CameraBtn(onTap: controller.onTakePicture),
                  SwapCamBtn(onTap: controller.swapCamera)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwapCamBtn extends StatelessWidget {
  const SwapCamBtn({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class LibraryBtn extends StatelessWidget {
  const LibraryBtn({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class CameraBtn extends StatelessWidget {
  const CameraBtn({
    super.key,
    required this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
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
    );
  }
}
