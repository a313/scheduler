import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/timetable.dart';
import 'package:scheduler/domain/usecases/class_room_usecases.dart';
import 'package:scheduler/domain/usecases/timetable_usecases.dart';

import '../../../core/utils/util.dart';
import '../../../routes/routes.dart';

class EditClassRoomController extends BaseController
    with StateMixin<List<Timetable>> {
  final ClassRoomUseCases useCases = Get.find();
  final TimetableUseCases timeUseCases = Get.find();
  final ClassRoom? initData;
  late ClassRoom data;

  final classNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  EditClassRoomController(this.initData);

  @override
  void onInit() {
    data = initData?.copyWith() ?? ClassRoom.init();
    getTimetable();
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

  void onChangedImage(String path) {}

  Future<void> getTimetable() async {
    final id = data.id;
    if (id != null) {
      final result = await timeUseCases.getTimetableOfClass(id);
      if (result is DataSuccess<List<Timetable>>) {
        change(
          result.data,
          status: result.data.isEmpty ? RxStatus.empty() : RxStatus.success(),
        );
      } else if (result is DataFailure<List<Timetable>>) {
        change(null, status: RxStatus.error(result.message));
      }
    } else {
      change([], status: RxStatus.empty());
    }
  }

  Future<void> onEditTimetable(Timetable timetable) async {
    final result =
        await Get.toNamed(Routes.editTimetable, arguments: timetable);
    if (result != null) {
      getTimetable();
    }
  }

  Future<void> onAddTimetable() async {
    final newTimetable = Timetable.init();
    final result = await Get.toNamed(Routes.editTimetable);
    if (result != null) {
      getTimetable();
    }
  }
}
