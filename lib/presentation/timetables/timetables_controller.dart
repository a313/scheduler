import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';

class TimetablesController extends BaseController with StateMixin<List<Event>> {
  final useCase = Get.find<EventUseCases>();

  final refreshController = RefreshController();

  final scrollController = ScrollController();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> onReloadData() async {
    getData();
  }

  Future<void> getData() async {
    final now = DateTime.now().add(const Duration(days: 7));
    final weekBegin = now.getStartOfWeek().dateWithoutTime();
    final weekEnd =
        now.getEndOfWeek().dateWithoutTime().add(const Duration(days: 1));
    final result = await useCase.getEventsFrom(weekBegin, weekEnd);
    if (result is DataSuccess<List<Event>>) {
      final data = result.data;
      final status = data.isEmpty ? RxStatus.empty() : RxStatus.success();
      change(data, status: status);
    } else {
      change([], status: RxStatus.error());
    }
  }

  Future<void> onRefresh() async {
    await getData();
    refreshController.refreshCompleted();
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
}
