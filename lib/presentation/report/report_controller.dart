import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';

class ReportController extends BaseController {
  final eventUsecase = Get.find<EventUseCases>();
  late DateTime startDate;
  late DateTime endDate;

  Map<ClassRoom, List<Event>> formatedData = {};

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
      update();
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

  Map<ClassRoom?, List<Event>> formatData(List<Event> events) {
    for (var event in events) {
      fillData(event);
      for (var key in event.classRooms) {
        addToGroup(key, event);
      }
    }
    return formatedData;
  }

  void addToGroup(ClassRoom key, Event event) {
    if (formatedData.containsKey(key)) {
      formatedData[key]!.add(event);
    } else {
      formatedData[key] = [event];
    }
  }
}
