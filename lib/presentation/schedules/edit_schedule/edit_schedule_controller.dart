import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/state_management/base_controller.dart';
import 'package:aio/data/models/schedule.dart';
import 'package:aio/domain/usecases/schedule_usecases.dart';

import '../../../core/usecase/data_state.dart';

class EditScheduleController extends BaseController {
  final useCases = Get.find<ScheduleUseCases>();
  final Schedule? initData;

  late Schedule data;

  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  EditScheduleController(this.initData);

  @override
  void onInit() {
    data = initData?.copyWith() ?? Schedule.init();
    nameController.text = data.name;
    super.onInit();
  }

  Future<void> onInsertOrUpdate() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    if (!data.isValid) {
      showSnackBar('Time Range is invalid');
      return;
    }
    if (initData == data) {
      Get.back();
    } else {
      showLoading();
      final result = await useCases.insertOrUpdate(data);
      dismissLoading();
      if (result is DataSuccess<Schedule>) {
        Get.back(result: result.data);
      } else if (result is DataFailure<Schedule>) {
        onDataFailed(result);
      }
    }
  }

  void onChangedBegin(DateTime value) {
    data.begin = TimeOfDay.fromDateTime(value);
  }

  void onChangedEnd(DateTime value) {
    data.end = TimeOfDay.fromDateTime(value);
  }

  void onChangeName(String p1) {
    data.name = p1;
  }
}
