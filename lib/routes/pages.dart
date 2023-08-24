import 'package:get/get.dart';
import 'package:scheduler/presentation/class_room/class_room_binding.dart';
import 'package:scheduler/presentation/events/events_binding.dart';
import 'package:scheduler/presentation/hex_to_link/hex_to_link_binding.dart';
import 'package:scheduler/presentation/ocr/ocr_binding.dart';
import 'package:scheduler/presentation/ocr/ocr_detail/ocr_detail_binding.dart';
import 'package:scheduler/presentation/ocr/ocr_detail/ocr_detail_page.dart';
import 'package:scheduler/presentation/periods/periods_binding.dart';
import 'package:scheduler/presentation/qrcode/qrcode_binding.dart';
import 'package:scheduler/presentation/reminder/reminder_binding.dart';
import 'package:scheduler/presentation/report/report_binding.dart';
import 'package:scheduler/presentation/schedules/edit_schedule/edit_schedule_binding.dart';
import 'package:scheduler/presentation/schedules/edit_schedule/edit_schedule_page.dart';
import 'package:scheduler/presentation/schedules/schedules_binding.dart';
import 'package:scheduler/presentation/schedules/schedules_page.dart';
import 'package:scheduler/presentation/setting/setting_binding.dart';
import 'package:scheduler/presentation/students/students_binding.dart';
import 'package:scheduler/presentation/timetables/timetables_binding.dart';
import 'package:scheduler/presentation/vpn/vpn_binding.dart';
import 'package:scheduler/presentation/weather/weather_binding.dart';

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
        SettingBinding(),
        WeatherBinding(),
        PeriodsBinding(),
        QrcodeBinding(),
        OcrBinding(),
        VpnBinding(),
      ],
    ),
    GetPage(
      name: Routes.editEvent,
      page: () => const EditEventPage(),
      binding: EditEventBinding(),
    ),
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
    GetPage(
      name: Routes.editStudent,
      page: () => const EditStudentPage(),
      binding: EditStudentBinding(),
    ),
    GetPage(
      name: Routes.editReminder,
      page: () => const EditReminderPage(),
      binding: EditReminderBinding(),
    ),
    GetPage(
      name: Routes.schedule,
      page: () => const SchedulesPage(),
      binding: SchedulesBinding(),
    ),
    GetPage(
      name: Routes.editSchedule,
      page: () => const EditSchedulePage(),
      binding: EditScheduleBinding(),
    ),
    GetPage(
      name: Routes.ocrDetail,
      page: () => const OcrDetailPage(),
      binding: OcrDetailBinding(),
    ),
  ];
}
