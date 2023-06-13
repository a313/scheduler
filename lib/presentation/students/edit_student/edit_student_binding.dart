import 'package:get/get.dart';

import 'edit_student_controller.dart';

class EditStudentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EditStudentController>(EditStudentController(Get.arguments));
  }
}
