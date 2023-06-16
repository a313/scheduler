import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';

import '../../../core/usecase/data_state.dart';
import '../../../data/models/event.dart';

class EditEventController extends BaseController {
  EventUseCases useCases = Get.find();
  Rx<List<ClassRoom>> selectedClassRoom = Rx<List<ClassRoom>>([]);
  Rx<List<Student>> selectedStudent = Rx<List<Student>>([]);

  EditEventController(this.initData);

  final Event? initData;
  late Event data;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final noteController = TextEditingController();

  @override
  void onInit() {
    data = initData?.copyWith() ?? Event.init();
    nameController.text = data.name;
    noteController.text = data.note ?? "";
    super.onInit();
  }

  void onSelectedClass(List<ClassRoom>? p1) {}

  void onSelectedStudent(List<Student>? p1) {}

  Future<void> onInsertOrUpdate() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    if (initData == data) {
      Get.back();
    } else {
      final result = await useCases.insertOrUpdate(data);
      if (result is DataSuccess<Event>) {
        Get.back(result: result.data);
      } else if (result is DataFailure<Event>) {
        onDataFailed(result);
      }
    }
  }

  void onChangeTitle(String title) {
    data.name = title;
  }

  void onSelectStartTime(DateTime? time) {
    if (time == null) return;
    data.startTime = time.dateWithoutSecond();
  }

  void onSelectEndTime(DateTime? time) {
    if (time == null) return;
    data.endTime = time.dateWithoutSecond();
  }

  void onSelectedRepeatType(List<RepeatType>? type) {
    data.repeat = type?.first ?? RepeatType.None;
  }

  void onSelectedAlertType(List<AlertType>? type) {
    data.alert = type?.first ?? AlertType.None;
  }

  void onChangeNote(String note) {
    data.note = note;
  }
}
