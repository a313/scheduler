import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';

import '../../core/usecase/data_state.dart';
import '../../data/models/class_room.dart';
import '../../data/models/student.dart';
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

  List<Event> generateEvent({
    required ClassRoom classRoom,
    required List<Student> students,
    required DateTime from,
    required DateTime to,
  }) {
    List<Event> result = [];
    if (!classRoom.isActive && !classRoom.hasSchedule) return [];
    for (var date = from;
        date.isBefore(to);
        date = date.add(const Duration(days: 1))) {
      for (final t in classRoom.timetables) {
        if (date.weekday == t.dayInWeek) {
          final begin = t.begin;
          final end = t.end;
          final startTime =
              date.copyWith(hour: begin.hour, minute: begin.minute);
          final endTime = date.copyWith(hour: end.hour, minute: end.minute);
          final studensOfClass =
              students.where((e) => e.classId.contains(classRoom.id)).toList();
          final listIds = studensOfClass.map((e) => e.id!).toList();

          result.add(Event(
            name: classRoom.name,
            parentId: classRoom.id,
            classIds: [classRoom.id!],
            invitedIds: listIds,
            joinedIds: listIds,
            startTime: startTime,
            endTime: endTime,
            location: classRoom.location,
            alert: classRoom.alert,
            type: EventType.GeneradeClass,
            repeat: RepeatType.None,
          ));
        }
      }
    }
    return result;
  }
}
