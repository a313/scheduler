import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/ekyc.dart';
import 'package:scheduler/presentation/ocr/ocr_camera/ocr_camera_binding.dart';
import 'package:scheduler/presentation/ocr/ocr_camera/ocr_camera_page.dart';

class OcrController extends BaseController {
  void onTappedCCCD() {
    Get.to(
      () => const OcrCameraPage(),
      binding: OcrCameraBinding(CameraType.font, Ekyc()),
    );
  }

  Future<void> onTappedCMT() async {
    // Get.to(
    //   () => const OcrCameraPage(),
    //   binding: OcrCameraBinding(CameraType.font, Ekyc()),
    // );
    Get.to(
      () => const OcrCameraPage(),
      binding: OcrCameraBinding(CameraType.portrait, Ekyc()),
    );
  }

  void onTappedPassport() {
    // Get.to(
    //   () => const OcrCameraPage(),
    //   binding: OcrCameraBinding(CameraType.back),
    // );
  }

  void onTappedFreeStyle() {}
}
