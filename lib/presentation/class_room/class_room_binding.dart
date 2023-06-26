import 'package:get/get.dart';

import 'class_room_controller.dart';

class ClassRoomBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassRoomController>(() => ClassRoomController(), fenix: true);
  }
}
