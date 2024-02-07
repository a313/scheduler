import 'package:get/get.dart';

import 'lunar_controller.dart';

class LunarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LunarController>(() => LunarController(), fenix: true);
  }
}
