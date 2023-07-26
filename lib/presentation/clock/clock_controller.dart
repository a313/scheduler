import 'dart:async';

import 'package:get/get.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';

class ClockController extends GetxController {
  late Timer timer;

  DateTime get currentTime => DateTime.now();

  final eventUseCases = Get.find<EventUseCases>();

  List<Event> events = [];

  @override
  void onInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      update();
    });
    super.onInit();
  }

  @override
  void onReady() {
    getEvents();
    super.onReady();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  Future<void> getEvents() async {
    final from = currentTime.beginOfDay();
    final to = currentTime.endOfDay();
    final result = await eventUseCases.getEventsFrom(from, to);
    if (result is DataSuccess<List<Event>>) {
      events = result.data;
      update();
    }
  }
}
