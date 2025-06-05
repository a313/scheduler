import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/data/models/schedule.dart';
import 'package:aio/data/sqlite_db/schedule_db.dart';

import '../../core/utils/util.dart';
import '../../domain/repo_abs/schedule_repo_abs.dart';

class ScheduleRepoImpl extends ScheduleRepo {
  final ScheduleDB db;

  ScheduleRepoImpl(this.db);
  @override
  Future<DataState<List<Schedule>>> getAllSchedule() async {
    final data = await db.fetchAll();
    return DataSuccess(Schedule.getListFromDB(data));
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

  @override
  Future<DataState<Schedule>> insertOrUpdate(Schedule data) async {
    final id = await db.insertOrUpdate(data.toJson());

    if (id == 0) {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    } else {
      data.id ??= id;
      return DataSuccess(data);
    }
  }
}
