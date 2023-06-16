import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/student_usecases.dart';

import '../../routes/routes.dart';

class StudentsController extends BaseController with StateMixin<List<Student>> {
  final StudentUseCases useCase = Get.find();

  final refreshController = RefreshController();
  final emptyController = RefreshController();

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
      allStudent = result.data;
    }
    updateUI();
  }

  void updateUI() {
    if (allStudent.isNotEmpty) {
      change(allStudent, status: RxStatus.success());
    } else {
      change(allStudent, status: RxStatus.empty());
    }
  }

  Future<void> addStudent() async {
    final result = await Get.toNamed(Routes.editStudent);
    if (result != null) {
      //Need reload;
      getData();
    }
  }

  Future<void> onEditStudent(Student student) async {
    final result = await Get.toNamed(Routes.editStudent, arguments: student);
    if (result != null) {
      //Need reload;
      getData();
    }
  }
}
