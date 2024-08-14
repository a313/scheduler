import 'dart:developer';

import 'package:get/get.dart';
import 'package:aio/core/state_management/base_controller.dart';
import 'package:aio/core/utils/util.dart';

import '../../data/models/class_room.dart';
import '../../domain/usecases/class_room_usecases.dart';
import '../../domain/usecases/event_usecases.dart';

class BaseClassController extends BaseController {
  final ClassRoomUseCases useCases = Get.find();
  final eventUseCases = Get.find<EventUseCases>();

  Future<void> reGeneraEvent(ClassRoom data) async {
    log('reGeneraEvent for Class :${data.id}', name: runtimeType.toString());
    final from = DateTime.now().dateWithoutTime();
    final to =
        local.getLastGenerateTime() ?? from.add(const Duration(days: 15));
    await eventUseCases.removeEvents(
        parentId: data.id!, from: from, to: to, type: EventType.GeneradeClass);

    final events = useCases.generateEvent(
      classRoom: data,
      students: allStudent,
      from: from,
      to: to,
    );

    await eventUseCases.insertAll(events);
    reloadData();
  }
}
