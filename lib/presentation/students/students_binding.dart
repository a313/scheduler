import 'package:get/get.dart';

import 'students_controller.dart';

class StudentsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentsController>(() => StudentsController());
  }
}
