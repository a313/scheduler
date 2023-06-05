import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/domain/entities/student.dart';

import '../../routes/routes.dart';

class StudentsController extends BaseController with StateMixin<List<Student>> {
  final refreshController = RefreshController();

  final emptyController = RefreshController();

  void onRefresh() {}

  void onLoading() {}

  void onTappedStudent(Student student) {
    Get.toNamed(Routes.addStudent, arguments: student);
  }

  void onTappedFilter() {}
}
