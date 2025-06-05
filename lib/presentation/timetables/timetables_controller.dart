import 'package:aio/core/state_management/base_controller.dart';
import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/event.dart';
import 'package:aio/domain/usecases/event_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../events/components/event_bottomsheet.dart';

class TimetablesController extends BaseController with StateMixin<List<Event>> {
  final useCase = Get.find<EventUseCases>();

  final scrollController = ScrollController();

  final currentTime = DateTime.now().obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> onReloadData() async {
    getData();
  }

  Future<void> getData() async {
    final time = currentTime.value;
    final weekBegin = time.getStartOfWeek().dateWithoutTime();
    final weekEnd = time.getEndOfWeek().endOfDay();
    final result = await useCase.getEventsFrom(weekBegin, weekEnd);
    if (result is DataSuccess<List<Event>>) {
      final data = result.data;
      final status = data.isEmpty ? RxStatus.empty() : RxStatus.success();
      change(data, status: status);
    } else {
      change([], status: RxStatus.error());
    }
  }

  void autoScroll() {
    var hour = DateTime.now().hour;
    if (hour < 7) return;
    if (hour < 18) hour = 7;
    if (hour > 18) hour = 13;
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(hour * R1H);
      }
    });
  }

  Future<void> onTappedEvent(Event event) async {
    final data = await bottomSheet(
        EventBottomSheet(event: event, allStudent: allStudent)) as Event?;
    if (data != null) {
      await useCase.insertOrUpdate(data);
      await getData();
      if (data.alert != AlertType.None) generateNotificaion();
    }
  }

  Future<void> nextWeek() async {
    currentTime.value = currentTime.value.add(const Duration(days: 7));
    await getData();
  }

  Future<void> prevWeek() async {
    currentTime.value = currentTime.value.subtract(const Duration(days: 7));
    await getData();
  }

  Future<void> curWeek() async {
    currentTime.value = DateTime.now();
    await getData();
  }
}
