import 'package:get/get.dart';
import 'package:scheduler/data/models/reminder.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';
import 'package:scheduler/domain/usecases/local_usecase.dart';
import 'package:scheduler/domain/usecases/notification_usecases.dart';

import '../../data/models/class_room.dart';
import '../../data/models/event.dart';
import '../../global.dart';
import '../usecase/data_state.dart';
import 'base_common_widget.dart';

class BaseController extends GetxController with BaseCommonWidgets {
  Global get global => Get.find();
  LocalUseCases get local => Get.find();
  void backToHome({int selectTab = 0}) {}

  set allStudent(List<Student> newValue) => global.allStudent = newValue;
  List<Student> get allStudent => global.allStudent;

  set allClassRoom(List<ClassRoom> newValue) => global.allClassRoom = newValue;
  List<ClassRoom> get allClassRoom => global.allClassRoom;

  set allReminder(List<Reminder> newValue) => global.allReminder = newValue;
  List<Reminder> get allReminder => global.allReminder;

  void generateNotificaion() async {
    final result = await Get.find<EventUseCases>().getEventsFrom(
      DateTime.now().toUtc(),
      DateTime.now().add(const Duration(days: 365)),
    );
    if (result is DataSuccess<List<Event>>) {
      Get.find<NotificationUseCases>().createNotiFor(result.data);
    }
  }
}
