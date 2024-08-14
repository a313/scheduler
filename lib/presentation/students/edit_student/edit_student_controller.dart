import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:aio/core/manager/event_tracking.dart';
import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/class_room.dart';
import 'package:aio/data/models/student.dart';
import 'package:aio/presentation/students/base_student_controller.dart';
import 'package:aio/presentation/students/student_event.dart';

import '../../../widgets/popups/two_option_popup.dart';

class EditStudentController extends BaseStudentController
    with StateMixin<List<ClassRoom>> {
  final Student? initData;
  final nameController = TextEditingController();
  final feeController = TextEditingController();
  final phoneController = TextEditingController();

  late Student data;

  Rx<List<ClassRoom>> selectedClassRoom = Rx<List<ClassRoom>>([]);
  RxBool shouldShowFee = false.obs;

  final formKey = GlobalKey<FormState>();

  EditStudentController(this.initData);

  @override
  void onInit() {
    data = initData?.copyWith() ?? Student.init();
    EventManager.fire(StudentEvent.onInitEditStudent(data));
    nameController.text = data.name;
    feeController.text = data.fee.toString();
    phoneController.text = data.phones.join(',');
    shouldShowFee.value = data.isSpecial;
    super.onInit();
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  void onChangeLastCharge(DateTime? time) {
    if (time != null) {
      data.lastCharge = time;
    }
  }

  void onChangeBeginStudy(DateTime? time) {
    if (time != null) {
      data.beginStudy = time;
    }
  }

  void onSelectedClass(List<ClassRoom>? classes) {
    if (classes != null) {
      data.classId = classes.map((e) => e.id!).toList();
      selectedClassRoom.value = classes;
    }
  }

  void onChangeAttendance(bool value) {
    data.isFollow = value;
  }

  void onChangeIsSpecial(bool value) {
    shouldShowFee.value = value;
    data.isSpecial = value;
  }

  void onChangedFee(String fee) {
    data.fee = int.tryParse(fee) ?? 0;
  }

  void onChangedPhone(String phone) {
    data.phones = [phone];
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
      EventManager.fire(StudentEvent.onInsertOrUpdate(data));
      dismissLoading();
      if (result is DataSuccess<Student>) {
        final classIds = <int>[];
        if (shouldReGeneraEvent(data, initData)) {
          classIds.addAll(data.classId);
          classIds.addAll(initData?.classId ?? []);
          classIds.toSet().toList();
        }
        Get.back(result: [result.data, classIds]);
      } else if (result is DataFailure<Student>) {
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

  Future<void> getData() async {
    final result = await classUseCase.getAllClassRoom();
    if (result is DataSuccess<List<ClassRoom>>) {
      allClassRoom = result.data;
      selectedClassRoom.value =
          allClassRoom.where((c) => data.classId.contains(c.id)).toList();
    } else {
      log('err');
    }
  }

  void onDeleteStudent() {
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
    final origin = initData ?? Student.init();
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

  bool shouldReGeneraEvent(Student data, Student? initData) {
    if (initData == null) return true;
    if (!listEquals(initData.classId, data.classId)) return true;
    if (initData.isFollow != data.isFollow ||
        initData.beginStudy != data.beginStudy) return true;
    return false;
  }
}
