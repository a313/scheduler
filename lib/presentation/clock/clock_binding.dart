
import 'package:get/get.dart';
import 'clock_controller.dart';

class ClockBinding implements Bindings {
@override
void dependencies() {
    Get.put<ClockController>(ClockController());
}
}