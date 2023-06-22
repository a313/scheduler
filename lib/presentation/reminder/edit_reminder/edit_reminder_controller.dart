import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/reminder.dart';
import 'package:scheduler/domain/usecases/reminder_usecases.dart';

class EditReminderController extends BaseController {
  final Reminder? initData;
  final nameController = TextEditingController();

  late Reminder data;
  late ReminderUseCases reminderUseCase;

  RxBool shouldShowFee = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EditReminderController(this.initData);

  @override
  void onInit() {
    reminderUseCase = Get.find();
    data = initData?.copyWith() ?? Reminder.init();
    nameController.text = data.name;
    super.onInit();
  }

  void onChangeDateCreate(DateTime? time) {
    if (time != null) {
      data.createDate = time.dateWithoutTime();
    }
  }

  Future<void> onInsertOrUpdate() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    if (initData == data) {
      Get.back();
    } else {
      showLoading();
      if (data.image != null && initData?.image != data.image) {
        final file = await Utils.saveFileToLocal(filePath: data.image!);
        data.image = file.path;
      }

      final result = await reminderUseCase.insertOrUpdate(data);
      dismissLoading();
      if (result is DataSuccess<Reminder>) {
        Get.back(result: result.data);
      } else if (result is DataFailure<Reminder>) {
        onDataFailed(result);
      }
    }
  }

  void onChangedAvatar(String path) {
    data.image = path;
  }

  void onChangeName(String name) {
    data.name = name;
  }

  void onSelectedRepeatType(List<RepeatType>? p1) {
    if (p1 == null) return;
    data.repeat = p1.first;
    data.alertTime ??= TimeOfDay.now();
    update();
  }

  void onSelectInterval(List<int>? p1) {
    if (p1 == null) return;
    data.interval = p1.first;
    update();
  }

  String getIntervelName(int e) {
    String getSuffix() {
      switch (data.repeat) {
        case RepeatType.Daily:
          return "day";
        case RepeatType.Weekly:
          return "week";
        case RepeatType.Monthly:
          return "month";
        case RepeatType.Yearly:
          return "year";
        default:
          return 'none';
      }
    }

    return '$e ${getSuffix()}${e > 1 ? 's' : ''}';
  }

  DateTime getAlertTime() {
    final time = data.alertTime ?? TimeOfDay.now();
    return DateTime.now().copyWith(hour: time.hour, minute: time.minute);
  }

  void onSelectedAlertTime(DateTime? p1) {
    if (p1 == null) return;
    data.alertTime = TimeOfDay.fromDateTime(p1);
    update();
  }
}
