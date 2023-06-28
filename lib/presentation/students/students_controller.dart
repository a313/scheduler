import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/student_usecases.dart';

import '../../routes/routes.dart';

class StudentsController extends BaseController
    with StateMixin<Map<ClassRoom, List<Student>>> {
  final StudentUseCases useCase = Get.find();

  Map<ClassRoom, List<Student>> formatedData = {};
  @override
  void onReady() {
    getData();
    super.onReady();
  }

  Future<void> onTappedStudent(Student student) async {
    final result = await Get.toNamed(Routes.editStudent, arguments: student);
    if (result != null) {
      //Need reload;
      getData();
    }
  }

  void onTappedFilter() {}

  void getData() async {
    final result = await useCase.getAllStudent();
    if (result is DataSuccess<List<Student>>) {
      allStudent = result.data;
      formatData(allStudent);
    }
    updateUI();
  }

  void updateUI() {
    if (allStudent.isNotEmpty) {
      change(formatedData, status: RxStatus.success());
    } else {
      change({}, status: RxStatus.empty());
    }
  }

  Future<void> addStudent() async {
    final result = await Get.toNamed(Routes.editStudent);
    if (result != null) {
      //Need reload;
      getData();
    }
  }

  void formatData(List<Student> allStudent) {
    final unFollowClass = ClassRoom.init(name: 'Unfollow')..id = 9999;
    final emptyClass = ClassRoom.init(name: 'Not in any class')..id = 9998;
    for (var student in allStudent) {
      if (!student.isFollow) {
        addToGroup(unFollowClass, student);
      } else if (student.classId.isEmpty) {
        addToGroup(emptyClass, student);
      } else {
        allClassRoom
            .where((e) => student.classId.contains(e.id))
            .forEach((cl) => addToGroup(cl, student));
      }
    }
  }

  void addToGroup(ClassRoom key, Student student) {
    if (formatedData.containsKey(key)) {
      formatedData[key]!.add(student);
    } else {
      formatedData[key] = [student];
    }
  }
}
