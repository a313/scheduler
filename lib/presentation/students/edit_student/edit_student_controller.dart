import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/class_room_usecases.dart';
import 'package:scheduler/domain/usecases/student_usecases.dart';

class EditStudentController extends BaseController
    with StateMixin<List<ClassRoom>> {
  final Student? initData;
  final nameController = TextEditingController();
  final feeController = TextEditingController();
  final phoneController = TextEditingController();

  late Student data;
  final StudentUseCases studentUseCase = Get.find();
  final ClassRoomUseCases classUseCase = Get.find();
  Rx<List<ClassRoom>> allClassRoom = Rx<List<ClassRoom>>([]);
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

      final result = await studentUseCase.insertOrUpdate(data);
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
      allClassRoom.value = result.data;
      selectedClassRoom.value =
          allClassRoom.value.where((c) => data.classId.contains(c.id)).toList();
    } else {
      log('err');
    }
  }

  // Future<void> onAddClassRoom() async {
  //   final value = await Get.to(BaseSearchPage<ClassRoom>(
  //     isMultiSelect: true,
  //     title: 'Chọn lớp học',
  //     searchBy: (c, search) =>
  //         c.name.toLowerCase().contains(search.toLowerCase()),
  //     itemBuilder: (_, obj) => ClassRoomItem(data: obj),
  //     selectedBuilder: (_, obj) => ClassRoomItem(data: obj, isSelected: true),
  //     options: allClassRoom,
  //   ));
  // }
}
