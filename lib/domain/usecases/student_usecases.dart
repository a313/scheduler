import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/data/models/student.dart';
import 'package:aio/domain/repo_abs/student_repo_abs.dart';

class StudentUseCases {
  final StudentRepo _;

  StudentUseCases(this._);

  Future<DataState<List<Student>>> getAllStudent() async {
    return await _.getAllStudent();
  }

  Future<DataState<Student>> insertOrUpdate(Student data) async {
    return await _.insertOrUpdate(data);
  }

  Future<DataState<int>> delete(int id) async {
    return await _.delete(id);
  }
}
