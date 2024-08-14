import 'package:get/get.dart';
import 'package:aio/core/utils/constants/enums.dart';
import 'package:aio/domain/entities/ekyc.dart';

import 'ocr_camera_controller.dart';

class OcrCameraBinding implements Bindings {
  final CameraType type;
  final Ekyc ekyc;
  OcrCameraBinding(this.type, this.ekyc);

  @override
  void dependencies() {
    Get.put<OcrCameraController>(OcrCameraController(type, ekyc));
  }
}
