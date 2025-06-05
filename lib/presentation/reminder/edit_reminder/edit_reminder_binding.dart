import 'package:get/get.dart';
import 'package:aio/data/models/reminder.dart';

import 'edit_reminder_controller.dart';

class EditReminderBinding implements Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is Reminder?) {
      Get.put<EditReminderController>(EditReminderController(arg));
    } else {
      throw ArgumentError();
    }
  }
}
