import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/schedule.dart';
import 'package:scheduler/domain/usecases/schedule_usecases.dart';
import 'package:scheduler/routes/routes.dart';

import '../../widgets/popups/two_option_popup.dart';

class SchedulesController extends BaseController {
  final useCase = Get.find<ScheduleUseCases>();
  List<Schedule> data = [];
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    final result = await useCase.getAllSchedule();
    if (result is DataSuccess<List<Schedule>>) {
      data = result.data;
      update();
    }
  }

  Future<void> addSchedule() async {
    final result = await Get.toNamed(Routes.editSchedule);
    if (result != null) {
      getData();
    }
  }

  void deleteSchedule(Schedule data, CompletionHandler handler) {
    showPopup(
      TwoOptionPopup(
        desc: 'Are your sure to delete ${data.name}?',
        secondaryTitle: 'Delete',
        onSecondary: () async {
          Get.back();
          await handler(true);
          await useCase.delete(data.id!);
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

  Future<void> onTappedSchedule(Schedule data) async {
    final result = await Get.toNamed(Routes.editSchedule, arguments: data);
    if (result != null) {
      getData();
    }
  }
}
