import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/reminder.dart';
import 'package:scheduler/domain/usecases/reminder_usecases.dart';
import 'package:scheduler/widgets/popups/yes_no_popup.dart';

import '../../routes/routes.dart';

class ReminderController extends BaseController
    with StateMixin<List<Reminder>> {
  final ReminderUseCases useCase = Get.find();

  // final refreshController = RefreshController();
  // final emptyController = RefreshController();

  @override
  void onReady() {
    updateUI();
    super.onReady();
  }

  Future<void> onTappedReminder(Reminder reminder) async {
    final result = await Get.toNamed(Routes.editReminder, arguments: reminder);
    if (result != null) {
      //Need reload;
      getData();
    }
  }

  void onTappedFilter() {}

  void getData() async {
    final result = await useCase.getAllReminder();
    if (result is DataSuccess<List<Reminder>>) {
      allReminder = result.data;
    }
    updateUI();
  }

  void updateUI() {
    if (allReminder.isNotEmpty) {
      change(allReminder, status: RxStatus.success());
    } else {
      change(allReminder, status: RxStatus.empty());
    }
  }

  Future<void> addReminder() async {
    final result = await Get.toNamed(Routes.editReminder);
    if (result != null) {
      //Need reload;
      getData();
    }
  }

  Future<void> onEditReminder(Reminder reminder) async {
    final result = await Get.toNamed(Routes.editReminder, arguments: reminder);
    if (result != null) {
      //Need reload;
      getData();
    }
  }

  void deleteReminder(Reminder state, CompletionHandler handler) {
    showPopup(
      YesNoPopup(
        desc: 'Are your sure to delete ${state.name}?',
        onOk: () async {
          Get.back();
          await handler(true);
          await useCase.delete(state.id!);
          getData();
        },
        onCancel: () async {
          Get.back();
          await handler(false);
        },
      ),
    );
  }
}
