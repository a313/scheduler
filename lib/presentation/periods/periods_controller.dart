import 'package:scheduler/core/state_management/base_controller.dart';

class PeriodsController extends BaseController {
  late DateTime begin;

  @override
  void onInit() {
    begin = local.getLastPeriods() ?? DateTime.now();
    super.onInit();
  }
}
