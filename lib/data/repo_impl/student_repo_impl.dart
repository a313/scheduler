import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/data/sqlite_db/student_db.dart';
import 'package:aio/data/models/student.dart';
import 'package:aio/domain/repo_abs/student_repo_abs.dart';

import '../../core/utils/util.dart';

class StudentRepoImpl extends StudentRepo {
  final StudentDB db;

  StudentRepoImpl(this.db);
  @override
  Future<DataState<List<Student>>> getAllStudent() async {
    final data = await db.getAllStudent();
    return DataSuccess(Student.getListFromDB(data));
  }

  @override
  Future<DataState<Student>> getStudentById(int id) async {
    final data = await db.findById(id);
    if (data != null) {
      return DataSuccess(Student.fromJson(data));
    } else {
      return DataFailure('NOT FOUND', 'NOT FOUND');
    }
  }

  @override
  Future<DataState<Student>> insertOrUpdate(Student data) async {
    final id = await db.insertOrUpdate(data.toJson());

    if (id == 0) {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    } else {
      data.id ??= id;
      return DataSuccess(data);
    }
  }

  @override
  Future<DataState<int>> delete(int id) async {
    final data = await db.delete(id);
    if (data > 0) {
      return DataSuccess(data);
    } else {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    }
  }
}
