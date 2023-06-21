import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/schedule.dart';

import '../repo_abs/schedule_repo_abs.dart';

class ScheduleUseCases {
  final ScheduleRepo _;

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
