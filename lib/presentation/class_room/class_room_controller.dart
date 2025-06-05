import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/class_room.dart';
import 'package:aio/domain/usecases/event_usecases.dart';
import 'package:aio/presentation/class_room/base_class_controller.dart';

import '../../routes/routes.dart';
import '../../widgets/popups/two_option_popup.dart';

class ClassRoomController extends BaseClassController
    with StateMixin<Map<String, List<ClassRoom>>> {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void onTappedFilter() {}

  Future<void> addClassRoom() async {
    final result = await Get.toNamed(Routes.editClassRoom);
    if (result != null) {
      getData();
    }
  }

  Future<void> onEditClassRoom(ClassRoom classroom) async {
    final result =
        await Get.toNamed(Routes.editClassRoom, arguments: classroom);
    if (result != null) {
      getData();
    }
  }

  Future<void> onTappedClassRoom(ClassRoom classroom) async {
    final result =
        await Get.toNamed(Routes.editClassRoom, arguments: classroom);
    if (result != null) {
      getData();
    }
  }

  Future<void> getData() async {
    final result = await useCases.getAllClassRoom();
    if (result is DataSuccess<List<ClassRoom>>) {
      allClassRoom = result.data;
      updateUI();
    } else if (result is DataFailure<List<ClassRoom>>) {
      onDataFailed(result);
    }
  }

  void updateUI() {
    if (allClassRoom.isEmpty) {
      change({}, status: RxStatus.empty());
    } else {
      change(formatData(allClassRoom), status: RxStatus.success());
    }
  }

  void deleteClass(ClassRoom data, CompletionHandler handler) {
    showPopup(
      TwoOptionPopup(
        desc: 'Are your sure to delete ${data.name}?',
        secondaryTitle: 'Delete',
        onSecondary: () async {
          Get.back();
          await handler(true);
          await useCases.delete(data.id!);
          final from = DateTime.now().dateWithoutTime();
          await Get.find<EventUseCases>().removeEvents(
              parentId: data.id!,
              from: from,
              to: DateTime(2300),
              type: EventType.GeneradeClass);
          getData();
        },
        primaryTitle: 'Cancel',
        onPrimary: () async {
          Get.back();
          await handler(false);
        },
      ),
    );
  }

  Future<void> toggleStateClass(
      ClassRoom state, CompletionHandler handler) async {
    state.isOpen = !state.isOpen;
    final result = await useCases.insertOrUpdate(state);
    if (result is DataFailure) return;
    await reGeneraEvent(state);
    await getData();
    handler(false);
  }

  Map<String, List<ClassRoom>> formatData(List<ClassRoom> allClassRoom) {
    Map<String, List<ClassRoom>> formatedData = {};
    for (var c in allClassRoom) {
      var key = '-1';
      if (!c.isOpen) {
        key = '-1';
      } else {
        key = c.location ?? '-2';
      }

      if (formatedData.containsKey(key)) {
        formatedData[key]!.add(c);
      } else {
        formatedData[key] = [c];
      }
    }
    return formatedData;
  }
}
