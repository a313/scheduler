import 'dart:developer';

import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';

import '../../data/models/event.dart';
import '../../domain/usecases/class_room_usecases.dart';
import '../../domain/usecases/student_usecases.dart';

class BaseStudentController extends BaseController {
  final useCases = Get.find<StudentUseCases>();
  final classUseCase = Get.find<ClassRoomUseCases>();

  Future<void> reGeneraEvent(Student data, {List<int>? classId}) async {
    if (classId != null && classId.isEmpty) {
      log('Skip reGeneraEvent for Student :${data.id}',
          name: runtimeType.toString());
      return;
    }
    log('reGeneraEvent for Student :${data.id}', name: runtimeType.toString());
    final from = DateTime.now().dateWithoutTime();
    final to =
        local.getLastGenerateTime() ?? from.add(const Duration(days: 15));
    final events = <Event>[];
    final eventUseCases = Get.find<EventUseCases>();

    for (var id in classId ?? data.classId) {
      final c = allClassRoom.where((e) => e.id == id).firstOrNull;
      if (c == null) continue;

      await eventUseCases.removeEvents(
        parentId: c.id!,
        from: from,
        to: to,
        type: EventType.GeneradeClass,
      );

      final e = classUseCase.generateEvent(
        classRoom: c,
        students: allStudent,
        from: from,
        to: to,
      );
      events.addAll(e);
    }

    await eventUseCases.insertAll(events);
    reloadData();
  }
}
