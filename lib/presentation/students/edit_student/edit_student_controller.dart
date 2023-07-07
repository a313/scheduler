import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/presentation/students/base_student_controller.dart';

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
      dismissLoading();
      if (result is DataSuccess<Student>) {
        Get.back(result: result.data);
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
}
