import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/state_management/base_controller.dart';
import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/reminder.dart';
import 'package:aio/domain/usecases/event_usecases.dart';
import 'package:aio/domain/usecases/reminder_usecases.dart';

import '../../../widgets/popups/two_option_popup.dart';

class EditReminderController extends BaseController {
  final Reminder? initData;
  final nameController = TextEditingController();

  late Reminder data;
  ReminderUseCases useCases = Get.find();
  EventUseCases eventUseCases = Get.find();

  RxBool shouldShowFee = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EditReminderController(this.initData);

  @override
  void onInit() {
    data = initData?.copyWith() ?? Reminder.init();
    nameController.text = data.name;
    super.onInit();
  }

  void onChangeRemindDate(DateTime? time) {
    if (time != null) {
      data.remindDate = time.dateWithoutTime();
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

      final result = await useCases.insertOrUpdate(data);
      if (initData == null || data != initData!) {
        reGeneraEvent(data);
      }
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
    data.time ??= TimeOfDay.now();
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
    final time = data.time ?? TimeOfDay.now();
    return DateTime.now().copyWith(hour: time.hour, minute: time.minute);
  }

  void onSelectedAlertTime(DateTime? time) {
    if (time == null) return;
    data.time = TimeOfDay.fromDateTime(time);
  }

  void onSelectedAlertType(List<AlertType>? alerts) {
    if (alerts == null) return;
    data.alert = alerts.first;
  }

  Future<void> reGeneraEvent(Reminder data) async {
    log('reGeneraEvent for Reminder :${data.name}');
    final from = DateTime.now().dateWithoutTime();
    final to =
        local.getLastGenerateTime() ?? from.add(const Duration(days: 15));
    await eventUseCases.removeEvents(
        parentId: data.id!,
        type: EventType.GeneradeReminder,
        from: from,
        to: to);
    final events = useCases.generateEvent(
      reminder: data,
      from: from,
      to: to,
    );

    await eventUseCases.insertAll(events);
    reloadData();
  }

  void onDeleteClass() {
    showPopup(
      TwoOptionPopup(
        desc: '${'Are your sure to delete'.tr} ${data.name}?',
        secondaryTitle: 'Delete',
        onSecondary: () async {
          Get.back();
          handlerDelete();
        },
        primaryTitle: 'Cancel',
        onPrimary: () async {
          Get.back();
        },
      ),
    );
  }

  Future<void> handlerDelete() async {
    showLoading();
    final result = await useCases.delete(data.id!);
    if (result is DataFailure) return;
    await reGeneraEvent(data);
    dismissLoading();
    Get.back(result: data);
    showSnackBar('${'Deleted'.tr} ${data.name}', type: SnackBarType.success);
  }

  Future<bool> onWillPop() async {
    final origin = initData ?? Reminder.init();
    if (data != origin) {
      showPopup(
        TwoOptionPopup(
          desc: 'Data has been changed. Do you want to save?'.tr,
          onPrimary: () {
            Get.back();
            onInsertOrUpdate();
          },
          onSecondary: () {
            Get.back();
            Get.back();
          },
        ),
      );
      return false;
    }
    return true;
  }
}
