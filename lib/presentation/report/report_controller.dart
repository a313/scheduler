import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/data/models/report.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';

class ReportController extends BaseController with StateMixin<List<Report>> {
  final eventUsecase = Get.find<EventUseCases>();
  late DateTime startDate;
  late DateTime endDate;

  Map<Student, List<Event>> formatedData = {};

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
      formatData(result.data);
      createReport();
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
    event.classRooms =
        allClassRoom.where((e) => event.classIds.contains(e.id)).toList();
  }

  void formatData(List<Event> events) {
    formatedData.clear();
    for (var event in events) {
      fillData(event);
      for (var key in event.students) {
        addToGroup(key, event);
      }
    }
  }

  void addToGroup(Student key, Event event) {
    if (formatedData.containsKey(key)) {
      formatedData[key]!.add(event);
    } else {
      formatedData[key] = [event];
    }
  }

  void createReport() {
    List<Report> data = [];
    formatedData.forEach((student, events) {
      Map<ClassRoom, List<Event>> map = {};
      for (var classId in student.classId) {
        final classRoom = allClassRoom.firstWhere((e) => e.id == classId);
        final es = events.where((e) => e.classIds.contains(classId)).toList();
        map[classRoom] = es;
      }
      data.add(
          Report(start: startDate, end: endDate, student: student, data: map));
    });
    change(data, status: data.isEmpty ? RxStatus.empty() : RxStatus.success());
  }
}
