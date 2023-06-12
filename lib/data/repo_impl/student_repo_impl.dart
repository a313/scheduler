import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/datasource/student_db.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/repo_abs/student_repo_abs.dart';

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
  Future<DataState<Student>> getStudentById(int id) {
    // TODO: implement getStudentById
    throw UnimplementedError();
  }

  @override
  Future<DataState<Student>> insertOrUpdate(Student student) async {
    final id = await db.insertOrUpdate(student.toDB());
    student.id = id;
    if (id == 0) {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    } else {
      return DataSuccess(student);
    }
  }
}
