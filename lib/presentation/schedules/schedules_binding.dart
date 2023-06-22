
import 'package:get/get.dart';
import 'schedules_controller.dart';

class SchedulesBinding implements Bindings {
@override
void dependencies() {
    Get.put<SchedulesController>(SchedulesController());
}
}