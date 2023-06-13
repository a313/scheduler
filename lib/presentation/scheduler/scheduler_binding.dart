
import 'package:get/get.dart';
import 'scheduler_controller.dart';

class SchedulerBinding implements Bindings {
@override
void dependencies() {
    Get.put<SchedulerController>(SchedulerController());
}
}