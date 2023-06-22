
import 'package:get/get.dart';
import 'timetables_controller.dart';

class TimetablesBinding implements Bindings {
@override
void dependencies() {
    Get.put<TimetablesController>(TimetablesController());
}
}