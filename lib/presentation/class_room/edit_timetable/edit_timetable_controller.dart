import 'package:aio/core/state_management/base_controller.dart';
import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/data/models/schedule.dart';
import 'package:aio/data/models/timetable.dart';
import 'package:aio/domain/usecases/schedule_usecases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTimetableController extends BaseController
    with StateMixin<List<Schedule>> {
  final Timetable? initData;
  late Timetable data;

  List<Schedule> initSchedule = [];

  EditTimetableController(this.initData);

  @override
  void onInit() {
    data = initData?.copyWith() ?? Timetable.init();
    getData();
    super.onInit();
  }

  void onChangedDate(int day) {
    data.dayInWeek = day;
  }

  void onChangedBegin(DateTime value) {
    data.begin = TimeOfDay.fromDateTime(value);
  }

  void onChangedEnd(DateTime value) {
    data.end = TimeOfDay.fromDateTime(value);
  }

  bool validData() {
    final date = validDate();
    final time = validTime();
    if (date && time) return true;
    if (!date) {
      showSnackBar('Not valid date');
    }
    if (!time) {
      showSnackBar('Not valid time');
    }
    return false;
  }

  bool validDate() {
    if (data.dayInWeek < 1 || data.dayInWeek > 7) {
      return false;
    }
    return true;
  }

  bool validTime() {
    if (data.begin.hour < data.end.hour) {
      return true;
    } else if (data.begin.hour == data.end.hour &&
        data.begin.minute <= data.end.minute) {
      return true;
    }
    return false;
  }

  void onUpdate() {
    if (validData()) {
      Get.back(result: data);
    }
  }

  void onSelected(List<Schedule>? schedules) {
    if (schedules == null) return;
    final schedule = schedules.first;
    data.begin = schedule.begin;
    data.end = schedule.end;
    update();
  }

  Future<void> getData() async {
    final result = await Get.find<ScheduleUseCases>().getAllSchedule();
    if (result is DataSuccess<List<Schedule>>) {
      final listSchedule = result.data;
      for (var schedule in listSchedule) {
        if (schedule.begin == data.begin && schedule.end == data.end) {
          initSchedule.add(schedule);
        }
      }
      change(listSchedule, status: RxStatus.success());
    } else {
      change([], status: RxStatus.success());
    }
  }
}
