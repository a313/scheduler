import 'package:get/get.dart';

import 'reminder_controller.dart';

class ReminderBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ReminderController>(ReminderController());
  }
}
