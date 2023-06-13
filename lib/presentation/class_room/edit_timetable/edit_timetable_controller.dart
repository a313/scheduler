import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/data/models/timetable.dart';

import '../../../domain/usecases/class_room_usecases.dart';

class EditTimetableController extends BaseController {
  final ClassRoomUseCases useCases = Get.find();
  final Timetable? initData;
  late Timetable data;

  EditTimetableController(this.initData);

  @override
  void onInit() {
    data = initData?.copyWith() ??
        Timetable(
            classId: -1,
            begin: const TimeOfDay(hour: 7, minute: 00),
            end: const TimeOfDay(hour: 9, minute: 00),
            dayInWeek: 0);
    super.onInit();
  }

  Future<void> onInsertOrUpdate() async {
    if (initData == data) {
      Get.back();
    } else {
      showLoading();

      // final result = await useCases.insertOrUpdate(data);
      // dismissLoading();
      // if (result is DataSuccess<ClassRoom>) {
      //   Get.back(result: result.data);
      // } else if (result is DataFailure<ClassRoom>) {
      //   onDataFailed(result);
      // }
    }
  }

  void onChangedBegin(DateTime value) {}

  void onChangedEnd(DateTime value) {}
}
