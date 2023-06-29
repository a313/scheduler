import 'package:get/get.dart';
import 'package:scheduler/data/models/schedule.dart';

import 'edit_schedule_controller.dart';

class EditScheduleBinding implements Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is Schedule?) {
      Get.put<EditScheduleController>(EditScheduleController(arg));
    } else {
      throw ArgumentError();
    }
  }
}
