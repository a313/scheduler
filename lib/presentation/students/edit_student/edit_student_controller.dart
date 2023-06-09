import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/entities/class_room.dart';
import 'package:scheduler/domain/usecases/student_usecase.dart';

class EditStudentController extends BaseController {
  final Student? initData;
  final nameController = TextEditingController();
  final feeController = TextEditingController();
  final phoneController = TextEditingController();

  late Student data;
  late StudentUseCase studentUseCase;
  List<ClassRoom> allClassRoom = [];
  RxBool shouldShowFee = false.obs;

  EditStudentController(this.initData);

  @override
  void onInit() {
    studentUseCase = Get.find();
    data = initData ?? Student.init();
    super.onInit();
  }

  void onChangeBeginStudy(DateTime? time) {
    if (time != null) {
      data.beginStudy = time;
    }
  }

  void onSelectedClass(List<ClassRoom>? classes) {
    if (classes != null) {
      data.classId = classes.map((e) => e.id!).toList();
    }
  }

  void onChangeAttendance(bool value) {
    data.isFollow = value;
  }

  void onChangeIsSpecial(bool value) {
    data.isSpecial = value;
  }

  void onChangedFee(String fee) {
    data.fee = int.tryParse(fee) ?? 0;
  }

  void onChangedPhone(String phone) {
    data.phones = [phone];
  }

  void onInsertOrUpdate() {
    if (initData == data) {
      Get.back();
    } else {
      studentUseCase.insertOrUpdate(data);
    }
  }

  void onChangedAvatar(String path) {
    data.image = path;
  }

  void onChangeName(String name) {
    data.name = name;
  }
}
