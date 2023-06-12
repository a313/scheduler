import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/reminder.dart';
import 'package:scheduler/domain/usecases/reminder_usecases.dart';

import '../../routes/routes.dart';

class ReminderController extends BaseController
    with StateMixin<List<Reminder>> {
  final ReminderUseCases useCase = Get.find();

  final refreshController = RefreshController();
  final emptyController = RefreshController();

  List<Reminder> reminders = [];

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  void onRefresh() {}

  void onLoading() {}

  void onTappedReminder(Reminder reminder) {
    Get.toNamed(Routes.editReminder, arguments: reminder);
  }

  void onTappedFilter() {}

  void getData() async {
    final result = await useCase.getAllReminder();
    if (result is DataSuccess<List<Reminder>>) {
      reminders = result.data;
    }
    updateUI();
  }

  void updateUI() {
    if (reminders.isNotEmpty) {
      change(reminders, status: RxStatus.success());
    } else {
      change(reminders, status: RxStatus.empty());
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
}
