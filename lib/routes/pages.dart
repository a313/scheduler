import 'package:get/get.dart';
import 'package:scheduler/presentation/hex_to_link/hex_to_link_binding.dart';
import 'package:scheduler/presentation/hex_to_link/hex_to_link_page.dart';
import 'package:scheduler/presentation/home/home_binding.dart';
import 'package:scheduler/presentation/home/home_page.dart';
import 'package:scheduler/presentation/students/edit_student/edit_student_binding.dart';
import 'package:scheduler/presentation/students/edit_student/edit_student_page.dart';
import 'package:scheduler/presentation/students/students_binding.dart';
import 'package:scheduler/presentation/students/students_page.dart';

import '../presentation/onboarding/onboarding_binding.dart';
import '../presentation/onboarding/onboarding_page.dart';
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
      name: Routes.students,
      page: () => const StudentsPage(),
      binding: StudentsBinding(),
    ),
    GetPage(
      name: Routes.editStudent,
      page: () => const EditStudentPage(),
      binding: EditStudentBinding(),
    ),
    GetPage(
      name: Routes.hexToLink,
      page: () => const HexToLinkPage(),
      binding: HexToLinkBinding(),
    ),
  ];
}
