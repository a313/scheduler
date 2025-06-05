import 'package:aio/data/models/student.dart';

import '../../core/usecase/data_state.dart';

abstract class StudentRepo {
  Future<DataState<List<Student>>> getAllStudent();
  Future<DataState<Student>> getStudentById(int id);
  Future<DataState<Student>> insertOrUpdate(Student data);
  Future<DataState<int>> delete(int id);
}
