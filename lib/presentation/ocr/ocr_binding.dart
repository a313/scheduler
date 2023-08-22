import 'package:get/get.dart';

import 'ocr_controller.dart';

class OcrBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OcrController>(() => OcrController(), fenix: true);
  }
}
