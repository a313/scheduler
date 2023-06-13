
import 'package:get/get.dart';
import 'edit_scheduler_controller.dart';

class EditSchedulerBinding implements Bindings {
@override
void dependencies() {
    Get.put<EditSchedulerController>(EditSchedulerController());
}
}