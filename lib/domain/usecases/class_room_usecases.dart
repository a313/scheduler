import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';

import '../../core/usecase/data_state.dart';
import '../../data/models/class_room.dart';
import '../repo_abs/class_room_repo_abs.dart';

class ClassRoomUseCases {
  final ClassRoomRepo _;

  ClassRoomUseCases(this._);

  Future<DataState<List<ClassRoom>>> getAllClassRoom() async {
    return await _.getAllClassRoom();
  }

  Future<DataState<ClassRoom>> insertOrUpdate(ClassRoom data) async {
    return await _.insertOrUpdate(data);
  }

  List<Event> generateEvent(ClassRoom obj,
      {required DateTime from, required DateTime to}) {
    List<Event> result = [];
    for (var date = from;
        date.isBefore(to);
        date = date.add(const Duration(days: 1))) {
      for (final t in obj.timetables) {
        if (date.weekday == t.dayInWeek) {
          final begin = t.begin;
          final end = t.end;
          final startTime =
              date.copyWith(hour: begin.hour, minute: begin.minute);
          final endTime = date.copyWith(hour: end.hour, minute: end.minute);
          result.add(Event(
            name: obj.name,
            parentId: obj.id,
            classIds: [obj.id!],
            startTime: startTime,
            endTime: endTime,
            location: obj.location,
            alert: obj.alert,
            type: EventType.GeneradeClass,
            repeat: RepeatType.None,
          ));
        }
      }
    }
    return result;
  }
}
