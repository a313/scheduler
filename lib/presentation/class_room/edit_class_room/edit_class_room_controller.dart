import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/timetable.dart';
import 'package:scheduler/domain/usecases/class_room_usecases.dart';

import '../../../core/utils/util.dart';
import '../../../routes/routes.dart';

class EditClassRoomController extends BaseController {
  final ClassRoomUseCases useCases = Get.find();

  final ClassRoom? initData;
  late ClassRoom data;

  final classNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  EditClassRoomController(this.initData);

  @override
  void onInit() {
    data = initData?.copyWith() ?? ClassRoom.init();
    classNameController.text = data.name;

    super.onInit();
  }

  void onChangeCreateDate(DateTime? time) {
    if (time != null) {
      data.createDate = time;
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

      if (data.image != null && initData?.image != data.image) {
        final file = await Utils.saveFileToLocal(filePath: data.image!);
        data.image = file.path;
      }

      final result = await useCases.insertOrUpdate(data);
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
      update();
    }
  }

  Future<void> onAddTimetable() async {
    final result = await Get.toNamed(Routes.editTimetable);
    if (result != null) {
      data.timetables.add(result);
      update();
    }
  }

  void onRemove(Timetable timetable) {
    data.timetables.remove(timetable);
    update();
  }
}
