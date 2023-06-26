import 'package:get/get.dart';

import 'reminder_controller.dart';

class ReminderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReminderController>(() => ReminderController(), fenix: true);
  }
}
