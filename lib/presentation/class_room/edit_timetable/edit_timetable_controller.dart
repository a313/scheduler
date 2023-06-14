import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/data/models/timetable.dart';

class EditTimetableController extends BaseController {
  final Timetable? initData;
  late Timetable data;

  EditTimetableController(this.initData);

  @override
  void onInit() {
    data = initData?.copyWith() ?? Timetable.init();
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
      showSnackBar('Ngày không hợp lệ');
    }
    if (!time) {
      showSnackBar('Thời gian không hợp lệ');
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
    Get.back(result: data);
  }
}
