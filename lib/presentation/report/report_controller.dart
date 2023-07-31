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
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import '../../data/models/student.dart';
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
    if (reportForClass.isEmpty) {
      final input = StuIsl(events, allStudent);
      reportForClass = await compute(createClassReport, input);
    }

    if (reportForClass.isEmpty) {
      showSnackBar('No data'.tr);
      return;
    }
    final Workbook workbook = Workbook();
    final cellStyle = CellStyle(workbook);
    cellStyle.fontColor = '#f70019';
    workbook.styles.addStyle(cellStyle);
    for (int i = 0; i < reportForClass.length; i++) {
      final rp = reportForClass[i];
      Worksheet sheet;
      if (i == 0) {
        sheet = workbook.worksheets[0];
        sheet.name = rp.classRoom.name;
      } else {
        sheet = workbook.worksheets.addWithName(rp.classRoom.name);
      }

      ///Table
      sheet.getRangeByIndex(3, 1).setText('STT');
      sheet.getRangeByIndex(3, 2).setText('Họ tên');
      sheet.getRangeByIndex(3, 3).setText('Học phí');
      int realCol = 3;
      final students = <Student>{};
      for (var j = 0; j < rp.events.length; j++) {
        final event = rp.events[j];
        if (event.isActive) {
          realCol++;
          sheet.getRangeByIndex(3, realCol).setDateTime(event.startTime);
          // .setText(event.startTime.toStringFormat(DateFormater.ddMMMMyyyy));
          students.addAll(event.students);
        }
      }

      //Header
      sheet.getRangeByIndex(1, 1, 1, realCol + 2).merge();
      sheet
          .getRangeByIndex(1, 1)
          .setText('Danh sách học sinh ${rp.classRoom.name}');
      sheet.getRangeByIndex(2, 1, 2, realCol + 2).merge();
      sheet.getRangeByIndex(2, 1).setText('Tháng abc');

      sheet.getRangeByIndex(3, realCol + 1).setText('Tổng số buổi');

      sheet.getRangeByIndex(3, realCol + 2).setText('Tổng học phí');

      fillValueToSheet(sheet, students, rp, cellStyle);
    }

    final now = DateTime.now();
    final fileName = 'Report_${now.toIso8601String()}.xlsx';
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    dismissLoading();

    final xfile = XFile.fromData(
      Uint8List.fromList(bytes),
      name: fileName,
      mimeType: 'xlsx',
    );
    Share.shareXFiles([xfile], text: fileName);
  }

  void fillValueToSheet(
    Worksheet sheet,
    Set<Student> students,
    ReportForClass data,
    CellStyle redStyle,
  ) {
    final classRoom = data.classRoom;
    final events = data.events;

    for (var i = 0; i < students.length; i++) {
      final student = students.elementAt(i);
      final fee =
          (student.isSpecial ? student.fee : classRoom.tuition).toDouble();
      sheet.getRangeByIndex(i + 4, 1).setNumber(i + 1);
      sheet.getRangeByIndex(i + 4, 2).setText(student.name);
      sheet.getRangeByIndex(i + 4, 3).setNumber(fee);
      int realCol = 3;
      int joined = 0;
      for (var j = 0; j < events.length; j++) {
        final event = events[j];
        if (event.isActive) {
          realCol++;
          final isJoined = event.joinedIds.contains(student.id);

          sheet
              .getRangeByIndex(i + 4, realCol)
              .setText(isJoined ? 'Học' : 'Nghỉ');
          if (isJoined) joined++;
          if (!isJoined) {
            sheet.getRangeByIndex(i + 4, realCol).cellStyle = redStyle;
          }
        }
      }

      sheet.getRangeByIndex(i + 4, realCol + 1).setNumber(joined.toDouble());
      sheet.getRangeByIndex(i + 4, realCol + 2).setNumber(joined * fee);
    }
  }
}
