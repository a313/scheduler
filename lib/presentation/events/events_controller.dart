import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/domain/usecases/class_room_usecases.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';
import 'package:scheduler/presentation/events/components/event_bottomsheet.dart';
import 'package:scheduler/routes/routes.dart';

class EventsController extends BaseController {
  EventUseCases useCases = Get.find();
  ClassRoomUseCases classRoomUseCases = Get.find();

  Rx<DateTime> selectedDay = DateTime.now().obs;
  late DateTime firstDay, lastDay;
  Map<DateTime, List<Event>> formatedData = {};

  final scrollController = ScrollController();

  final refreshController = RefreshController();

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

    await generateEvent(lastDay);
    await loadEvent(firstDay, lastDay);
    updateUI();
  }

  Future<void> generateEvent(DateTime to) async {
    final classEvents = generateClassRoomEvent(to);
    for (var c in classEvents) {
      useCases.insertOrUpdate(c);
    }
    local.savedLastGenerateTime(to);
  }

  List<Event> generateClassRoomEvent(DateTime to) {
    // final lastGenerate = DateTime.now().dateWithoutTime();
    final lastGenerate =
        (local.getLastGenerateTime() ?? DateTime.now()).dateWithoutTime();
    final diff = to.difference(lastGenerate).inDays;
    if (diff <= 0) return [];
    final from = lastGenerate;
    List<Event> result = [];
    for (var obj in allClassRoom) {
      if (obj.isActive && obj.hasSchedule) {
        final events = classRoomUseCases.generateEvent(obj, from: from, to: to);
        for (var e in events) {
          final studensOfClass =
              allStudent.where((e) => e.classId.contains(obj.id)).toList();
          final listIds = studensOfClass.map((e) => e.id!).toList();
          e.invitedIds = listIds;
          e.joinedIds = listIds;
          result.add(e);
        }
      }
    }

    return result;
  }

  Future<void> loadEvent(DateTime from, DateTime to) async {
    formatedData.clear();
    final result = await useCases.getEventsFrom(
      from.dateWithoutTime(),
      to.dateWithoutTime().add(const Duration(days: 1)),
    );
    createKey(from, to);
    if (result is DataSuccess<List<Event>>) {
      final events = result.data;
      groupEvent(events);
    } else if (result is DataFailure<List<Event>>) {
      onDataFailed(result);
    }
  }

  void groupEvent(List<Event> events) {
    for (var event in events) {
      fillData(event);
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
    final data = await bottomSheet(
        EventBottomSheet(event: event, allStudent: allStudent));
    if (data != null) {
      await useCases.insertOrUpdate(data);
      updateUI();
    }
  }

  Future<void> onTappedEdit(Event event) async {
    final result = await Get.toNamed(Routes.editEvent, arguments: event);
    if (result != null) {
      //???
      await loadEvent(firstDay, lastDay);
      updateUI();
    }
  }

  Future<void> addEvent() async {
    final result = await Get.toNamed(Routes.editEvent);
    if (result != null) {
      //???
      await loadEvent(firstDay, lastDay);
      updateUI();
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
  }

  void addToGroup(DateTime key, Event event) {
    if (formatedData.containsKey(key)) {
      formatedData[key]!.add(event);
    } else {
      formatedData[key] = [event];
    }
  }

  Future<void> onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    firstDay = selectedDay;
    await loadEvent(firstDay, lastDay);
    updateUI();
    this.selectedDay.value = selectedDay;
  }

  void fillData(Event event) {
    event.students =
        allStudent.where((e) => event.invitedIds.contains(e.id)).toList();
    event.classRooms =
        allClassRoom.where((e) => event.classIds.contains(e.id)).toList();
  }

  Future<void> onRefresh() async {
    firstDay = firstDay.subtract(const Duration(days: 7));
    await loadEvent(firstDay, lastDay);
    updateUI();
    refreshController.refreshCompleted();
  }

  Future<void> onLoading() async {
    lastDay = lastDay.add(const Duration(days: 7));
    await generateEvent(lastDay);
    await loadEvent(firstDay, lastDay);
    updateUI();
    refreshController.loadComplete();
  }

  void updateUI() {
    update();
  }
}