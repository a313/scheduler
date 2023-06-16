import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/entities/feature.dart';
import 'package:scheduler/domain/usecases/class_room_usecases.dart';
import 'package:scheduler/domain/usecases/student_usecases.dart';

import '../../routes/routes.dart';

class HomeController extends BaseController {
  late List<Feature> features;
  StudentUseCases studentUseCases = Get.find();
  ClassRoomUseCases classRoomUseCases = Get.find();

  @override
  void onInit() {
    super.onInit();
    features = [
      Feature('Event', 'assets/png/home/calendar.png', goToEvent),
      Feature('Class Room', 'assets/png/home/classroom.png', goToClassRoom),
      Feature('Students', 'assets/png/home/student.png', goToStudents),
      Feature('Report', 'assets/png/home/report.png', goToReport),
      Feature('Reminder', 'assets/png/home/reminder.png', goToReminder),
      Feature('HexToLink', 'assets/png/home/decode.png', goToHexToLink),
    ];

    getData();
  }

  void getData() {
    getStudents();
    getClassRooms();
  }

  Future<void> getClassRooms() async {
    final value = await classRoomUseCases.getAllClassRoom();
    if (value is DataSuccess<List<ClassRoom>>) {
      allClassRoom = value.data;
    }
  }

  Future<void> getStudents() async {
    final value = await studentUseCases.getAllStudent();
    if (value is DataSuccess<List<Student>>) {
      allStudent = value.data;
    }
  }

  void goToHexToLink() {
    Get.toNamed(Routes.hexToLink);
  }

  void goToStudents() {
    Get.toNamed(Routes.students);
  }

  void goToClassRoom() {
    Get.toNamed(Routes.classRooms);
  }

  void goToEvent() {
    Get.toNamed(Routes.events);
  }

  void goToReminder() {
    Get.toNamed(Routes.reminders);
  }

  void goToReport() {
    Get.toNamed(Routes.reports);
  }
}
