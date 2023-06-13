import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/datasource/timetable_db.dart';
import 'package:scheduler/data/models/timetable.dart';
import 'package:scheduler/domain/repo_abs/timetable_repo_abs.dart';

import '../../core/utils/util.dart';

class TimetableRepoImpl extends TimetableRepo {
  final TimetableDB db;

  TimetableRepoImpl(this.db);
  @override
  Future<DataState<List<Timetable>>> getAllTimetable() async {
    final result = await db.fetchAll();
    return DataSuccess(Timetable.getListFromDB(result));
  }

  @override
  Future<DataState<Timetable?>> getTimetableById(int id) async {
    final result = await db.findById(id);
    if (result != null) return DataSuccess(Timetable.fromJson(result));
    return DataSuccess(null);
  }

  @override
  Future<DataState<List<Timetable>>> getTimetableOfClass(int id) async {
    final data = await db.getTimetableOfClass(id);
    return DataSuccess(Timetable.getListFromDB(data));
  }

  @override
  Future<DataState<Timetable>> insertOrUpdate(Timetable data) async {
    final id = await db.insertOrUpdate(data.toJson());
    data.id = id;
    if (id == 0) {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    } else {
      return DataSuccess(data);
    }
  }
}
