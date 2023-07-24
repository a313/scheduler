import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';

import '../../../core/usecase/data_state.dart';
import '../../../data/models/event.dart';
import '../../../widgets/popups/two_option_popup.dart';

class EditEventController extends BaseController {
  EventUseCases useCases = Get.find();
  Rx<ClassRoom?> selectedClassRoom = Rx<ClassRoom?>(null);
  Rx<List<Student>> selectedStudent = Rx<List<Student>>([]);

  EditEventController(this.initData);

  final Event? initData;
  late Event data;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final noteController = TextEditingController();
  final locationController = TextEditingController();

  @override
  void onInit() {
    data = initData?.copyWith() ?? Event.init();
    nameController.text = data.name;
    noteController.text = data.note ?? '';
    locationController.text = data.location ?? '';

    selectedClassRoom.value =
        allClassRoom.firstWhereOrNull((e) => e.id == data.classId);
    selectedStudent.value = allStudent
        .where((element) => data.invitedIds.contains(element.id))
        .toList();
    super.onInit();
  }

  void onSelectedClass(List<ClassRoom>? listClass) {
    if (listClass == null) return;
    final classR = listClass.firstOrNull;
    data.classId = classR?.id;
    selectedClassRoom.value = classR;
    selectedStudent.value.clear();
    for (var c in listClass) {
      for (var s in allStudent) {
        if (s.classId.contains(c.id)) {
          selectedStudent.value.addIf(!selectedStudent.value.contains(s), s);
        }
      }
    }
    selectedStudent.refresh();
    final studentIds = selectedStudent.value.map((e) => e.id!).toList();
    data.joinedIds = studentIds;
    data.invitedIds = studentIds;
  }

  void onSelectedStudent(List<Student>? listStudent) {
    if (listStudent == null) return;
    final studentIds = listStudent.map((e) => e.id!).toList();
    data.invitedIds = studentIds;
    if (data.type != EventType.Modified) {
      data.joinedIds = studentIds;
    }
  }

  Future<void> onInsertOrUpdate() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    if (initData == data) {
      Get.back();
    } else {
      if (data.startTime.isAfter(data.endTime)) {
        data.endTime = data.startTime;
      }
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

  void onChangeLocation(String location) {
    data.location = location;
  }

  void onDeleteEvent() {
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
    dismissLoading();
    Get.back(result: data);
    showSnackBar('${'Deleted'.tr} ${data.name}', type: SnackBarType.success);
  }

  Future<bool> onWillPop() async {
    final origin = initData ?? Event.init();
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
