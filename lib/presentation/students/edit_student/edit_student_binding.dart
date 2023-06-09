import 'package:get/get.dart';
import 'package:scheduler/data/models/student.dart';

import 'edit_student_controller.dart';

class EditStudentBinding implements Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is Student?) {
      Get.put<EditStudentController>(EditStudentController(arg));
    } else {
      throw ArgumentError();
    }
  }
}
