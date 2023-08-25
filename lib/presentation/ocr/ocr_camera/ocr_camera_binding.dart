import 'package:get/get.dart';
import 'package:scheduler/core/utils/constants/enums.dart';

import 'ocr_camera_controller.dart';

class OcrCameraBinding implements Bindings {
  final CameraType type;
  OcrCameraBinding(this.type);

  @override
  void dependencies() {
    Get.put<OcrCameraController>(OcrCameraController(type));
  }
}
