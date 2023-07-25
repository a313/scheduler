import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/util.dart';

class PeriodsController extends BaseController {
  late DateTime begin;
  late int periodsDuration;

  @override
  void onInit() {
    begin = local.getLastPeriods() ?? DateTime.now();
    periodsDuration = local.getPeriodsDuration() ?? 28;
    super.onInit();
  }

  void onChangeLastPeriods(DateTime? time) {
    if (time != null) {
      begin = time;
      update();
      local.savedLastPeriods(time);
    }
  }

  void onChangePeriodDuration(String value) {
    if (value.hasText) {
      int n = int.parse(value);
      if (n >= 22 && n <= 36) {
        periodsDuration = n;
        update();
        local.savedPeriodsDuration(n);
      }
    }
  }
}
