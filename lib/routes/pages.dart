import 'package:get/get.dart';
import 'package:scheduler/presentation/home/home_binding.dart';
import 'package:scheduler/presentation/reminder/edit_reminder/edit_reminder_binding.dart';
import 'package:scheduler/presentation/reminder/edit_reminder/edit_reminder_page.dart';
import 'package:scheduler/presentation/reminder/reminder_binding.dart';
import 'package:scheduler/presentation/reminder/reminder_page.dart';

import '../presentation/class_room/class_room_binding.dart';
import '../presentation/class_room/class_room_page.dart';
import '../presentation/class_room/edit_class_room/edit_class_room_binding.dart';
import '../presentation/class_room/edit_class_room/edit_class_room_page.dart';
import '../presentation/hex_to_link/hex_to_link_binding.dart';
import '../presentation/hex_to_link/hex_to_link_page.dart';
import '../presentation/home/home_page.dart';
import '../presentation/onboarding/onboarding_binding.dart';
import '../presentation/onboarding/onboarding_page.dart';
import '../presentation/students/edit_student/edit_student_binding.dart';
import '../presentation/students/students_binding.dart';
import '../presentation/students/students_page.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.classRoom,
      page: () => const ClassRoomPage(),
      binding: ClassRoomBinding(),
    ),
    GetPage(
      name: Routes.editClassRoom,
      page: () => const EditClassRoomPage(),
      binding: EditClassRoomBinding(),
    ),
    GetPage(
      name: Routes.students,
      page: () => const StudentsPage(),
      binding: StudentsBinding(),
    ),
    GetPage(
      name: Routes.editStudent,
      page: () => const EditClassRoomPage(),
      binding: EditStudentBinding(),
    ),
    GetPage(
      name: Routes.reminder,
      page: () => const ReminderPage(),
      binding: ReminderBinding(),
    ),
    GetPage(
      name: Routes.editReminder,
      page: () => const EditReminderPage(),
      binding: EditReminderBinding(),
    ),
    GetPage(
      name: Routes.hexToLink,
      page: () => const HexToLinkPage(),
      binding: HexToLinkBinding(),
    ),
  ];
}
