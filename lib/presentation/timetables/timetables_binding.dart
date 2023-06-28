import 'package:get/get.dart';

import 'timetables_controller.dart';

class TimetablesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimetablesController>(() => TimetablesController(),
        fenix: true);
  }
}
