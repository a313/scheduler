import 'package:get/get.dart';

import 'edit_timetable_controller.dart';

class EditTimetableBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EditTimetableController>(EditTimetableController(Get.arguments));
  }
}
