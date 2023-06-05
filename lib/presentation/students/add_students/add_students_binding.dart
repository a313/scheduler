import 'package:get/get.dart';
import 'package:scheduler/domain/entities/student.dart';

import 'add_students_controller.dart';

class AddStudentsBinding implements Bindings {
  @override
  void dependencies() {
    final arg = Get.arguments;
    if (arg is Student) {
      Get.put<AddStudentsController>(AddStudentsController(arg));
    } else {
      throw ArgumentError();
    }
  }
}
