import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';
import 'package:scheduler/routes/routes.dart';

class EventsController extends BaseController
    with StateMixin<Map<DateTime, List<Event>>> {
  EventUseCases useCases = Get.find();

  Rx<DateTime> selectedDay = DateTime.now().obs;
  late DateTime firstDay, lastDay;
  Map<DateTime, List<Event>> formatedData = {};

  final scrollController = ScrollController();

  @override
  void onInit() {
    final d = selectedDay.value;
    firstDay = d.copyWith();
    lastDay = d.copyWith(day: d.day + 15);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await generateEvent();
    await loadEvent(firstDay, lastDay);
  }

  Future<void> generateEvent() async {
    for (var obj in allClassRoom) {
      if (obj.isActive && obj.hasSchedule) {}
    }
  }

  Future<void> loadEvent(DateTime from, DateTime to) async {
    final result = await useCases.getAllEvent();
    createKey(from, to);
    if (result is DataSuccess<List<Event>>) {
      final events = result.data;
      groupEvent(events);
      change(formatedData, status: RxStatus.success());
    } else if (result is DataFailure<List<Event>>) {
      onDataFailed(result);
    }
  }

  void groupEvent(List<Event> events) {
    for (var event in events) {
      final startDay = event.startTime;
      final endDay = event.endTime;
      if (startDay.day == endDay.day) {
        final key = startDay.dateWithoutTime();
        addToGroup(key, event);
      } else {
        var d = startDay;
        while (d.day != endDay.day) {
          final key = d.dateWithoutTime();
          addToGroup(key, event);
          d = d.copyWith(day: d.day + 1);
        }
      }
    }
  }

  Future<void> onTappedEvent(Event event) async {
    final result = await Get.toNamed(Routes.editEvent, arguments: event);
    if (result != null) {
      //???
      loadEvent(firstDay, lastDay);
    }
  }

  Future<void> addEvent() async {
    final result = await Get.toNamed(Routes.editEvent);
    if (result != null) {
      //???
      loadEvent(firstDay, lastDay);
    }
  }

  void createKey(DateTime from, DateTime to) {
    final days = lastDay.difference(firstDay).inDays;
    final first = firstDay.dateWithoutTime();
    for (int i = 0; i < days; i++) {
      final key = first.add(Duration(days: i));
      if (formatedData.containsKey(key)) continue;
      formatedData[key] = [];
    }
    print(formatedData.keys.length);
  }

  void addToGroup(DateTime key, Event event) {
    if (formatedData.containsKey(key)) {
      formatedData[key]!.add(event);
    } else {
      formatedData[key] = [event];
    }
  }

  Future<void> onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    if (selectedDay.isBefore(firstDay)) {
      await getMoreData();
    }
    this.selectedDay.value = selectedDay;
    scrollToItem(selectedDay);
  }

  void scrollToItem(DateTime time) {
    // final context = key.currentContext;
    // if (context == null) return;
    // Scrollable.ensureVisible(context,
    //     duration: const Duration(seconds: 1), curve: Curves.easeInOutCubic);
  }

  Future<void> getMoreData() async {}
}
