import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:aio/core/state_management/base_controller.dart';
import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/data/models/reminder.dart';
import 'package:aio/domain/usecases/reminder_usecases.dart';
import 'package:aio/widgets/popups/two_option_popup.dart';

import '../../routes/routes.dart';

class ReminderController extends BaseController
    with StateMixin<List<Reminder>> {
  final ReminderUseCases useCase = Get.find();

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
      TwoOptionPopup(
        desc: 'Are your sure to delete ${state.name}?',
        secondaryTitle: 'Delete',
        onSecondary: () async {
          Get.back();
          await handler(true);
          await useCase.delete(state.id!);
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
}
