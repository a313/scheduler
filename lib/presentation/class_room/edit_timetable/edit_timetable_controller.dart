import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/schedule.dart';
import 'package:scheduler/data/models/timetable.dart';
import 'package:scheduler/domain/usecases/schedule_usecases.dart';

class EditTimetableController extends BaseController {
  final Timetable? initData;
  late Timetable data;

  List<Schedule> listSchedule = <Schedule>[];
  List<Schedule> initSchedule = [];

  EditTimetableController(this.initData);

  @override
  void onInit() {
    data = initData?.copyWith() ?? Timetable.init();
    super.onInit();
  }

  @override
  void onReady() {
    getData();
    super.onReady();
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
      listSchedule = result.data;
      for (var schedule in listSchedule) {
        if (schedule.begin == data.begin && schedule.end == data.end) {
          initSchedule.add(schedule);
        }
      }
    }
    update();
  }
}
