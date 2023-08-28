import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/presentation/ocr/components/custom_camera_preview.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import '../components/other_info.dart';
import 'ocr_camera_controller.dart';

class OcrCameraPage extends GetView<OcrCameraController> {
  const OcrCameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      backgroundColor: Colors.green,
      body: controller.obx(
        (cameraController) {
          return CustomCameraPreview(
            cameraController!,
            cameraKey: controller.cameraKey,
            child: OtherInfo(
              type: controller.type,
              frameKey: controller.frameKey,
              enableBtn: true,
              recentPhoto: controller.recentPhoto.value,
              onPickImage: controller.onPickImage,
              onTakePicture: controller.onTakePicture,
              // onSwapCamera: controller.swapCamera,
            ),
          );
        },
        onLoading: OtherInfo(
          type: controller.type,
          frameKey: controller.frameKey,
          enableBtn: false,
          recentPhoto: controller.recentPhoto.value,
        ),
      ),
    );
  }
}
