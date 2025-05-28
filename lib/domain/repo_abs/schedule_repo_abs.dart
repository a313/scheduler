import 'package:aio/core/usecase/data_state.dart';

import '../../data/models/schedule.dart';

abstract class ScheduleRepo {
  Future<DataState<List<Schedule>>> getAllSchedule();

  Future<DataState<Schedule>> insertOrUpdate(Schedule data);

  Future<DataState<int>> delete(int id);
}
