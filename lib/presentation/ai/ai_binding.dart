import 'package:get/get.dart';

import 'ai_controller.dart';

class AiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiController>(() => AiController(), fenix: true);
  }
}
