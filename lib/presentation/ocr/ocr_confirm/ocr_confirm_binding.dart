import 'package:get/get.dart';

import 'ocr_confirm_controller.dart';

class OcrConfirmBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<OcrConfirmController>(OcrConfirmController(Get.arguments));
  }
}
