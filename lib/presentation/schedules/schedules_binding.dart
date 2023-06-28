import 'package:get/get.dart';

import 'schedules_controller.dart';

class SchedulesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchedulesController>(() => SchedulesController(), fenix: true);
  }
}
