import 'package:get/get.dart';

import 'periods_controller.dart';

class PeriodsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PeriodsController>(() => PeriodsController(), fenix: true);
  }
}
