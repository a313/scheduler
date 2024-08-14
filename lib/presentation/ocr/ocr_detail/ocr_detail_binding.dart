import 'package:get/get.dart';
import 'package:aio/presentation/ocr/ocr_detail/ocr_detail_controller.dart';

class OcrDetailBinding implements Bindings {
  @override
  void dependencies() {
    if (Get.arguments is List) {
      final file = Get.arguments[0];
      final type = Get.arguments[1];
      final ekyc = Get.arguments[2];
      Get.put(OcrDetailController(file, type, ekyc));
    }
  }
}
