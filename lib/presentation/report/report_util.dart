import '../../data/models/class_room.dart';
import '../../data/models/event.dart';
import '../../data/models/report_for_class.dart';
import '../../data/models/report_for_student.dart';
import '../../data/models/student.dart';

class ClrIsl {
  final List<Event> events;
  final List<ClassRoom> clr;

  ClrIsl(this.events, this.clr);
}

class StuIsl {
  final List<Event> events;
  final List<Student> stu;

  StuIsl(this.events, this.stu);
}

Map<Student, List<Event>> formatStudentData(List<Event> events) {
  Map<Student, List<Event>> formatedData = {};
  void addToGroup(Student key, Event event) {
    if (formatedData.containsKey(key)) {
      formatedData[key]!.add(event);
    } else {
      formatedData[key] = [event];
    }
  }

  for (var event in events) {
    for (var key in event.students) {
      addToGroup(key, event);
    }
  }
  return formatedData;
}

List<ReportForStudent> createStudentReport(ClrIsl data) {
  final formatedData = formatStudentData(data.events);
  List<ReportForStudent> result = [];
  formatedData.forEach(
    (student, events) {
      Map<ClassRoom, List<Event>> map = {};
      for (var classId in student.classId) {
        final classRoom = data.clr.firstWhere((e) => e.id == classId);
        final es = events.where((e) => e.classId == classId).toList();
        map[classRoom] = es;
      }
      result.add(ReportForStudent(student: student, data: map));
    },
  );
  return result;
}

Map<ClassRoom, List<Event>> formatClassData(List<Event> events) {
  Map<ClassRoom, List<Event>> formatedData = {};
  void addToGroup(ClassRoom key, Event event) {
    if (formatedData.containsKey(key)) {
      formatedData[key]!.add(event);
    } else {
      formatedData[key] = [event];
    }
  }

  for (var event in events) {
    final key = event.classRoom;
    if (key != null) {
      addToGroup(key, event);
    }
  }
  return formatedData;
}

List<ReportForClass> createClassReport(StuIsl data) {
  final formatedData = formatClassData(data.events);
  List<ReportForClass> result = [];
  formatedData.forEach(
    (clr, events) {
      Map<Student, List<Event>> map = {};
      for (var student in data.stu) {
        if (student.classId.contains(clr.id)) {
          map[student] = events;
        }
      }
      result.add(ReportForClass(classRoom: clr, data: map));
    },
  );
  return result;
}
