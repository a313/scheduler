import 'package:get/get.dart';

import 'events_controller.dart';

class EventsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<EventsController>(EventsController());
  }
}
