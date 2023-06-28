import 'package:get/get.dart';
import 'package:scheduler/presentation/class_room/class_room_binding.dart';
import 'package:scheduler/presentation/events/events_binding.dart';
import 'package:scheduler/presentation/hex_to_link/hex_to_link_binding.dart';
import 'package:scheduler/presentation/reminder/reminder_binding.dart';
import 'package:scheduler/presentation/report/report_binding.dart';
import 'package:scheduler/presentation/students/students_binding.dart';
import 'package:scheduler/presentation/timetables/timetables_binding.dart';

import '../presentation/class_room/edit_class_room/edit_class_room_binding.dart';
import '../presentation/class_room/edit_class_room/edit_class_room_page.dart';
import '../presentation/class_room/edit_timetable/edit_timetable_binding.dart';
import '../presentation/class_room/edit_timetable/edit_timetable_page.dart';
import '../presentation/events/edit_event/edit_event_binding.dart';
import '../presentation/events/edit_event/edit_event_page.dart';
import '../presentation/home/home_binding.dart';
import '../presentation/home/home_page.dart';
import '../presentation/onboarding/onboarding_binding.dart';
import '../presentation/onboarding/onboarding_page.dart';
import '../presentation/reminder/edit_reminder/edit_reminder_binding.dart';
import '../presentation/reminder/edit_reminder/edit_reminder_page.dart';
import '../presentation/students/edit_student/edit_student_binding.dart';
import '../presentation/students/edit_student/edit_student_page.dart';
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
      bindings: [
        HomeBinding(),
        EventsBinding(),
        ReminderBinding(),
        ReportBinding(),
        ClassRoomBinding(),
        HexToLinkBinding(),
        StudentsBinding(),
        TimetablesBinding(),
      ],
    ),
    // GetPage(
    //   name: Routes.events,
    //   page: () => const EventsPage(),
    //   binding: EventsBinding(),
    // ),
    GetPage(
      name: Routes.editEvent,
      page: () => const EditEventPage(),
      binding: EditEventBinding(),
    ),
    // GetPage(
    //   name: Routes.classRooms,
    //   page: () => const ClassRoomPage(),
    //   binding: ClassRoomBinding(),
    // ),
    GetPage(
      name: Routes.editClassRoom,
      page: () => const EditClassRoomPage(),
      binding: EditClassRoomBinding(),
    ),
    GetPage(
      name: Routes.editTimetable,
      page: () => const EditTimetablePage(),
      binding: EditTimetableBinding(),
    ),
    // GetPage(
    //   name: Routes.students,
    //   page: () => const StudentsPage(),
    //   binding: StudentsBinding(),
    // ),
    GetPage(
      name: Routes.editStudent,
      page: () => const EditStudentPage(),
      binding: EditStudentBinding(),
    ),
    // GetPage(
    //   name: Routes.reminders,
    //   page: () => const ReminderPage(),
    //   binding: ReminderBinding(),
    // ),
    GetPage(
      name: Routes.editReminder,
      page: () => const EditReminderPage(),
      binding: EditReminderBinding(),
    ),
    // GetPage(
    //   name: Routes.hexToLink,
    //   page: () => const HexToLinkPage(),
    //   binding: HexToLinkBinding(),
    // ),
  ];
}
