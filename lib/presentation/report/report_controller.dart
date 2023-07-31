import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/data/models/report_for_class.dart';
import 'package:scheduler/data/models/report_for_student.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';
import 'package:scheduler/widgets/base/base_state_widget.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'report_util.dart';

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
  // Map<ClassRoom, List<Event>> reportForClass = {};

  List<ReportForClass> reportForClass = [];
  List<ReportForClass> filterReportForClass = [];
  // Iterable<ClassRoom> filterClassKeys = [];

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
      final input = StuIsl(events, allStudent);
      reportForClass = await compute(createClassReport, input);
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
      filterReportForClass = reportForClass
          .where((e) => e.classRoom.name.toLowerCase().contains(lowCase))
          .toList();
      updateUI();
    } else {
      onClearSearch();
    }
  }

  void onClearSearch() {
    filterReportForStudent = reportForStudent;
    filterReportForClass = reportForClass;
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

  Future<void> exportExcel() async {
    showLoading();
    if (reportForStudent.isEmpty) {
      final input = ClrIsl(events, allClassRoom);
      reportForStudent = await compute(createStudentReport, input);
    }

    if (reportForStudent.isEmpty) {
      showSnackBar('No data'.tr);
    }
    final Workbook workbook = Workbook();

    final List<int> bytes = workbook.saveAsStream();
    final now = DateTime.now();
    File('Report_${now.toIso8601String()}.xlsx').writeAsBytes(bytes);
    workbook.dispose();
    dismissLoading();
  }
}
