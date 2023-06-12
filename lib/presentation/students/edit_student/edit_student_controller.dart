import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/student_usecases.dart';

class EditStudentController extends BaseController {
  final Student? initData;
  final nameController = TextEditingController();
  final feeController = TextEditingController();
  final phoneController = TextEditingController();

  late Student data;
  late StudentUseCases studentUseCase;
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
}
