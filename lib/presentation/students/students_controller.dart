import 'package:get/get.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/student_usecases.dart';
import 'package:scheduler/presentation/students/base_student_controller.dart';

import '../../routes/routes.dart';

class StudentsController extends BaseStudentController
    with StateMixin<Map<ClassRoom, List<Student>>> {
  final StudentUseCases useCase = Get.find();

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  Future<void> onTappedStudent(Student student) async {
    final result = await Get.toNamed(Routes.editStudent, arguments: student);
    if (result != null) {
      //Need reload;
      await getData();
      await reGeneraEvent(result[0], classId: result[1]);
    }
  }

  void onTappedFilter() {}

  Future<void> getData() async {
    final result = await useCase.getAllStudent();
    if (result is DataSuccess<List<Student>>) {
      allStudent = result.data;
      updateUI();
    }
  }

  void updateUI() {
    if (allStudent.isNotEmpty) {
      change(formatData(allStudent), status: RxStatus.success());
    } else {
      change({}, status: RxStatus.empty());
    }
  }

  Future<void> addStudent() async {
    final result = await Get.toNamed(Routes.editStudent);
    if (result != null) {
      await getData();
      await reGeneraEvent(result[0], classId: result[1]);
    }
  }

  Map<ClassRoom, List<Student>> formatData(List<Student> allStudent) {
    Map<ClassRoom, List<Student>> formatedData = {};
    void addToGroup(ClassRoom key, Student student) {
      if (formatedData.containsKey(key)) {
        formatedData[key]!.add(student);
      } else {
        formatedData[key] = [student];
      }
    }

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
    return formatedData;
  }

  Future<void> onDeleteStudent(
      Student data, Future<void> Function(bool delete) handler) async {
    final result = await useCases.delete(data.id!);
    if (result is DataFailure) return;
    await handler(true);
    await getData();
    await reGeneraEvent(data);
  }

  Future<void> onToggleFollow(
      Student data, Future<void> Function(bool delete) handler) async {
    data.isFollow = !data.isFollow;
    final result = await useCases.insertOrUpdate(data);
    if (result is DataFailure) return;

    await handler(false);
    await getData();
    await reGeneraEvent(data);
  }
}
