import 'dart:ui';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:scheduler/data/models/reminder.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';
import 'package:scheduler/domain/usecases/local_usecase.dart';
import 'package:scheduler/domain/usecases/notification_usecases.dart';
import 'package:scheduler/presentation/timetables/timetables_controller.dart';

import '../../data/models/class_room.dart';
import '../../data/models/event.dart';
import '../../global.dart';
import '../../presentation/events/events_controller.dart';
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

  void updateLocale(Locale newLocale) {
    Get.updateLocale(newLocale);
  }

  void generateNotificaion() async {
    final result = await Get.find<EventUseCases>().getEventsFrom(
      DateTime.now().toUtc(),
      DateTime.now().add(const Duration(days: 365)),
    );
    if (result is DataSuccess<List<Event>>) {
      Get.find<NotificationUseCases>().createNotiFor(result.data);
    }
  }

  Future<Position?> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }
    return await Geolocator.getCurrentPosition();
  }

  void reloadData() {
    if (Get.isRegistered<EventsController>()) {
      Get.find<EventsController>().onReloadData();
    }

    if (Get.isRegistered<TimetablesController>()) {
      Get.find<TimetablesController>().onReloadData();
    }
  }
}
