import 'package:get/get.dart';
import 'package:scheduler/domain/entities/feature.dart';

import '../../routes/routes.dart';

class HomeController extends GetxController {
  late List<Feature> features;

  @override
  void onInit() {
    super.onInit();
    features = [
      Feature('Calendar', 'assets/png/home/calendar.png', goToCalendar),
      Feature('Scheduler', 'assets/png/home/schedule.png', goToScheduler),
      Feature('Class Room', 'assets/png/home/classroom.png', goToClassRoom),
      Feature('Students', 'assets/png/home/student.png', goToStudents),
      Feature('Report', 'assets/png/home/report.png', goToReport),
      Feature('Reminder', 'assets/png/home/reminder.png', goToReminder),
      Feature('HexToLink', 'assets/png/home/decode.png', goToHexToLink),
    ];
  }

  void goToHexToLink() {
    Get.toNamed(Routes.hexToLink);
  }

  void goToStudents() {
    Get.toNamed(Routes.students);
  }

  void goToClassRoom() {
    Get.toNamed(Routes.classRoom);
  }

  void goToScheduler() {
    Get.toNamed(Routes.scheduler);
  }

  void goToCalendar() {
    Get.toNamed(Routes.calendar);
  }

  void goToReminder() {
    Get.toNamed(Routes.reminder);
  }

  void goToReport() {
    Get.toNamed(Routes.report);
  }
}
