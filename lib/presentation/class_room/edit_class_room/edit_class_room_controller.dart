import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/timetable.dart';
import 'package:scheduler/presentation/class_room/base_class_controller.dart';

import '../../../core/utils/util.dart';
import '../../../routes/routes.dart';
import '../../../widgets/popups/two_option_popup.dart';

class EditClassRoomController extends BaseClassController {
  final ClassRoom? initData;
  late ClassRoom data;

  final formKey = GlobalKey<FormState>();

  final classNameController = TextEditingController();
  final locationController = TextEditingController();
  final tuitionController = TextEditingController();

  EditClassRoomController(this.initData);

  @override
  void onInit() {
    data =
        initData?.copyWith(timetables: List.from(initData?.timetables ?? [])) ??
            ClassRoom.init();

    log('onInit id:${data.id}', name: runtimeType.toString());
    classNameController.text = data.name;
    locationController.text = data.location ?? '';
    tuitionController.text = data.tuition.toCurrency(symbol: '');
    super.onInit();
  }

  void onChangeOpenDate(DateTime? time) {
    if (time != null) {
      data.openDate = time;
    }
  }

  void onChangedOpen(bool value) {
    data.isOpen = value;
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
      if (result is DataSuccess<ClassRoom>) {
        Get.back(result: result.data);
      } else if (result is DataFailure<ClassRoom>) {
        onDataFailed(result);
      }
    }
  }

  void onChangeClassName(String name) {
    data.name = name;
  }

  void onChangedImage(String path) {
    data.image = path;
  }

  Future<void> onEditTimetable(Timetable timetable) async {
    final result =
        await Get.toNamed(Routes.editTimetable, arguments: timetable);
    if (result != null) {
      data.timetables.remove(timetable);
      data.timetables.add(result);
      sortTimetable();
      update();
    }
  }

  void sortTimetable() {
    data.timetables
        .sort((obj1, obj2) => obj1.dayInWeek.compareTo(obj2.dayInWeek));
    update();
  }

  Future<void> onAddTimetable() async {
    final result = await Get.toNamed(Routes.editTimetable);
    if (result != null) {
      data.timetables.add(result);

      sortTimetable();
      update();
    }
  }

  void onRemove(Timetable timetable) {
    data.timetables.remove(timetable);
    update();
  }

  void onSelectedAlertType(List<AlertType>? alert) {
    if (alert == null) return;
    data.alert = alert.first;
  }

  void onChangeLocation(String location) {
    data.location = location;
  }

  void onChangeTuition(String p1) {
    data.tuition = int.parse(p1.onlyNumberic);
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
    final origin = initData ?? ClassRoom.init();
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
