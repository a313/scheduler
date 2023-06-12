import 'package:get/get.dart';

import 'edit_class_room_controller.dart';

class EditClassRoomBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EditClassRoomController>(EditClassRoomController(Get.arguments));
  }
}
