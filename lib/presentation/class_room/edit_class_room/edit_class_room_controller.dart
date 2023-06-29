import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/timetable.dart';
import 'package:scheduler/domain/usecases/class_room_usecases.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';

import '../../../core/utils/util.dart';
import '../../../routes/routes.dart';

class EditClassRoomController extends BaseController {
  final ClassRoomUseCases useCases = Get.find();
  final EventUseCases eventUseCases = Get.find();

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

    log('onInit :${data.id}', name: runtimeType.toString());
    classNameController.text = data.name;
    locationController.text = data.location ?? '';
    tuitionController.text = data.tuition.toCurrency(symbol: '');
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

  Future<void> reGeneraEvent(ClassRoom data) async {
    log('reGeneraEvent for Class :${data.id}', name: runtimeType.toString());
    final from = DateTime.now().dateWithoutTime();
    final to =
        local.getLastGenerateTime() ?? from.add(const Duration(days: 15));
    await eventUseCases.removeEvents(
        parentId: data.id!, from: from, to: to, type: EventType.GeneradeClass);
    final events = useCases.generateEvent(
      classRoom: data,
      students: allStudent,
      from: from,
      to: to,
    );

    await eventUseCases.insertAll(events);
    reloadData();
  }

  void onChangeTuition(String p1) {
    data.tuition = int.parse(p1.onlyNumberic);
  }
}
