import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/domain/entities/feature.dart';

import '../../routes/routes.dart';

class HomeController extends GetxController {
  late List<Feature> features;

  @override
  void onInit() {
    super.onInit();
    features = [
      Feature('Calendar', Image.asset('assets/png/home/calendar.png'),
          () => Get.toNamed(Routes.students)),
      Feature('Scheduler', Image.asset('assets/png/home/schedule.png'),
          () => Get.toNamed(Routes.students)),
      Feature('Class Room', Image.asset('assets/png/home/classroom.png'),
          () => Get.toNamed(Routes.students)),
      Feature('Students', Image.asset('assets/png/home/student.png'),
          () => Get.toNamed(Routes.students)),
      Feature('Report', Image.asset('assets/png/home/report.png'),
          () => Get.toNamed(Routes.students)),
      Feature('Reminder', Image.asset('assets/png/home/reminder.png'),
          () => Get.toNamed(Routes.students)),
      Feature('HexToLink', Image.asset('assets/png/home/decode.png'),
          () => Get.toNamed(Routes.hexToLink)),
    ];
  }

  void goToHexToLink() {
    Get.toNamed(Routes.hexToLink);
  }
}
