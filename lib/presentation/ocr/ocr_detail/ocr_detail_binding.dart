import 'package:get/get.dart';

import 'ocr_detail_controller.dart';

class OcrDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<OcrDetailController>(
        OcrDetailController(Get.arguments[0], Get.arguments[1]));
  }
}
