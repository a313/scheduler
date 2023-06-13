import 'package:scheduler/data/models/timetable.dart';

import '../../core/usecase/data_state.dart';

abstract class TimetableRepo {
  Future<DataState<List<Timetable>>> getAllTimetable();
  Future<DataState<List<Timetable>>> getTimetableOfClass(int id);
  Future<DataState<Timetable?>> getTimetableById(int id);
  Future<DataState<Timetable>> insertOrUpdate(Timetable data);
}
