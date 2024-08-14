import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/data/models/schedule.dart';

import '../repo_abs/schedule_repo_abs.dart';

class ScheduleUseCases {
  final aioepo _;

  ScheduleUseCases(this._);

  Future<DataState<List<Schedule>>> getAllSchedule() async {
    return await _.getAllSchedule();
  }

  Future<DataState<Schedule>> insertOrUpdate(Schedule data) async {
    return await _.insertOrUpdate(data);
  }

  Future<DataState<int>> delete(int id) async {
    return await _.delete(id);
  }
}
