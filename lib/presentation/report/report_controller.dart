import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/data/models/report_for_student.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';
import 'package:scheduler/widgets/base/base_state_widget.dart';

class ReportController extends BaseController {
  final eventUsecase = Get.find<EventUseCases>();
  late DateTime startDate;
  late DateTime endDate;

  List<Event> events = [];
  final groupByClass = false.obs;
  WidgetState state = WidgetState.loading;

  List<ReportForStudent> reportForStudent = [];
  List<ReportForStudent> filterReportForStudent = [];

  final searchController = TextEditingController();

  @override
  void onInit() {
    startDate = DateTime.now().dateWithoutDay();
    endDate = startDate
        .copyWith(month: startDate.month + 1)
        .subtract(const Duration(seconds: 1));
    getData(startDate, endDate);

    super.onInit();
  }

  Future<void> getData(DateTime from, DateTime to) async {
    final result = await eventUsecase.getClassEventsFrom(from, to);
    if (result is DataSuccess<List<Event>>) {
      events = result.data;
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

  void fillData(Event event) {
    event.students =
        allStudent.where((e) => event.invitedIds.contains(e.id)).toList();
    event.classRoom =
        allClassRoom.firstWhereOrNull((e) => event.classId == e.id);
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
      fillData(event);
      for (var key in event.students) {
        addToGroup(key, event);
      }
    }
    return formatedData;
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
      fillData(event);
      final key = event.classRoom;
      if (key != null) {
        addToGroup(key, event);
      }
    }
    return formatedData;
  }

  void createReport() {
    if (groupByClass.value) {
      createClassReport();
    } else {
      createStudentReport();
    }
    if (searchController.text.hasText) {
      onSearchChanged(searchController.text);
    } else {
      onClearSearch();
    }
  }

  void createStudentReport() {
    reportForStudent.clear();
    final formatedData = formatStudentData(events);
    formatedData.forEach(
      (student, events) {
        Map<ClassRoom, List<Event>> map = {};
        for (var classId in student.classId) {
          final classRoom = allClassRoom.firstWhere((e) => e.id == classId);
          final es = events.where((e) => e.classId == classId).toList();
          map[classRoom] = es;
        }
        reportForStudent.add(ReportForStudent(student: student, data: map));
      },
    );
  }

  void createClassReport() {
    final formatedData = formatClassData(events);
    // formatedData.forEach(
    //   (student, events) {
    //     Map<ClassRoom, List<Event>> map = {};
    //     for (var classId in student.classId) {
    //       final classRoom = allClassRoom.firstWhere((e) => e.id == classId);
    //       final es = events.where((e) => e.classIds.contains(classId)).toList();
    //       map[classRoom] = es;
    //     }
    //     ReportForStudent.add(Report(
    //         start: startDate, end: endDate, student: student, data: map));
    //   },
    // );
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
    } else {
      filterReportForStudent = reportForStudent;
    }
    updateUI();
  }

  void onClearSearch() {
    filterReportForStudent = reportForStudent;
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
