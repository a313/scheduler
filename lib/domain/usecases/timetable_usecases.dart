import '../../core/usecase/data_state.dart';
import '../../data/models/timetable.dart';
import '../repo_abs/timetable_repo_abs.dart';

class TimetableUseCases {
  final TimetableRepo _;

  TimetableUseCases(this._);

  Future<DataState<List<Timetable>>> getAllTimetable() async {
    return await _.getAllTimetable();
  }

  Future<DataState<List<Timetable>>> getTimetableOfClass(int id) async {
    return await _.getTimetableOfClass(id);
  }

  Future<DataState<Timetable>> insertOrUpdate(Timetable data) async {
    return await _.insertOrUpdate(data);
  }
}
