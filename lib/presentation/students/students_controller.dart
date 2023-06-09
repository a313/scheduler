import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/student_usecase.dart';

import '../../routes/routes.dart';

class StudentsController extends BaseController with StateMixin<List<Student>> {
  final StudentUseCase useCase = Get.find();

  final refreshController = RefreshController();
  final emptyController = RefreshController();

  List<Student> students = [];

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  void onRefresh() {}

  void onLoading() {}

  void onTappedStudent(Student student) {
    Get.toNamed(Routes.editStudent, arguments: student);
  }

  void onTappedFilter() {}

  void getData() async {
    final result = await useCase.getAllStudent();
    if (result is DataSuccess<List<Student>>) {
      students = result.data;
    }
    updateUI();
  }

  void updateUI() {
    if (students.isNotEmpty) {
      change(students, status: RxStatus.success());
    } else {
      change(students, status: RxStatus.empty());
    }
  }

  void addStudent() {
    Get.toNamed(Routes.editStudent);
  }

  void onEditStudent(Student student) {
    Get.toNamed(Routes.editStudent, arguments: student);
  }
}
