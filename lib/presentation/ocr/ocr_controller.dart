import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/ocr/ocr_camera/ocr_camera_binding.dart';
import 'package:scheduler/presentation/ocr/ocr_camera/ocr_camera_page.dart';

import '../../routes/routes.dart';

class OcrController extends BaseController {
  void onTappedCCCD() {
    Get.to(
      () => const OcrCameraPage(),
      binding: OcrCameraBinding(CameraType.font),
    );
  }

  Future<void> onTappedCMT() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      Get.toNamed(Routes.ocrDetail,
          arguments: [pickedFile.path, CameraType.font]);
    }
  }

  void onTappedPassport() {}

  void onTappedFreeStyle() {}
}
