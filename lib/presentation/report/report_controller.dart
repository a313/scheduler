import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/data/models/report_for_class.dart';
import 'package:scheduler/data/models/report_for_student.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';
import 'package:scheduler/widgets/base/base_state_widget.dart';

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

class ReportController extends BaseController {
  final eventUsecase = Get.find<EventUseCases>();
  late DateTime startDate;
  late DateTime endDate;

  List<Event> events = [];
  final groupByClass = false.obs;
  WidgetState state = WidgetState.loading;

  List<ReportForStudent> reportForStudent = [];
  List<ReportForStudent> filterReportForStudent = [];

  // List<ReportForClass> reportForClass = [];
  // List<ReportForClass> filterReportForClass = [];
  Map<ClassRoom, List<Event>> reportForClass = {};
  Iterable<ClassRoom> filterClassKeys = [];

  final searchController = TextEditingController();

  @override
  void onInit() {
    startDate = DateTime.now().dateWithoutDay();
    endDate = DateTime.now().endOfDay();
    getData(startDate, endDate);

    super.onInit();
  }

  Future<void> getData(DateTime from, DateTime to) async {
    final result = await eventUsecase.getClassEventsFrom(from, to);
    if (result is DataSuccess<List<Event>>) {
      events = result.data;
      fillAllEvent(events);
      createReport();
    } else {
      state = WidgetState.error;
    }
  }

  void onChangeStart(DateTime? time) {
    if (time == null) return;
    startDate = time;
    getData(startDate, endDate);
  }

  void onChangeEnd(DateTime? time) {
    if (time == null) return;
    endDate = time;
    getData(startDate, endDate);
  }

  void fillAllEvent(List<Event> events) {
    void fillData(Event event) {
      event.students =
          allStudent.where((e) => event.invitedIds.contains(e.id)).toList();
      event.classRoom =
          allClassRoom.firstWhereOrNull((e) => event.classId == e.id);
    }

    for (var event in events) {
      fillData(event);
    }
  }

  Future<void> createReport() async {
    if (groupByClass.value) {
      // final input = StuIsl(events, allStudent);
      // reportForClass = await compute(createClassReport, input);
      reportForClass = await compute(formatClassData, events);
    } else {
      final input = ClrIsl(events, allClassRoom);
      reportForStudent = await compute(createStudentReport, input);
    }
    if (searchController.text.hasText) {
      onSearchChanged(searchController.text);
    } else {
      onClearSearch();
    }
  }

  void toggleGrouping() {
    groupByClass.value = !groupByClass.value;
    createReport();
  }

  void onSearchChanged(String value) {
    final lowCase = value.toLowerCase().trim();
    if (lowCase.hasText) {
      filterReportForStudent = reportForStudent
          .where((e) => e.student.name.toLowerCase().contains(lowCase))
          .toList();
      // filterReportForClass = reportForClass
      //     .where((e) => e.classRoom.name.toLowerCase().contains(lowCase))
      //     .toList();
      filterClassKeys = reportForClass.keys
          .where((e) => e.name.toLowerCase().contains(lowCase));
      updateUI();
    } else {
      onClearSearch();
    }
  }

  void onClearSearch() {
    filterReportForStudent = reportForStudent;
    filterClassKeys = reportForClass.keys;
    updateUI();
  }

  void updateUI() {
    if (groupByClass.value) {
    } else {
      if (filterReportForStudent.isEmpty) {
        state = WidgetState.empty;
      } else {
        state = WidgetState.success;
      }
    }
    update();
  }
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
