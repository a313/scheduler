import 'package:get/get.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/schedule.dart';
import 'package:scheduler/domain/usecases/schedule_usecases.dart';

class SchedulesController extends GetxController {
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
}
