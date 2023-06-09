import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/repo_abs/student_repo_abs.dart';

class StudentUseCase {
  final StudentRepo _;

  StudentUseCase(this._);

  Future<DataState<List<Student>>> getAllStudent() async {
    return await _.getAllStudent();
  }

  Future<DataState<Student>> insertOrUpdate(Student data) async {
    return await _.insertOrUpdate(data);
  }
}
