import 'package:get/get.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';

class ReportController extends GetxController {
  final eventUsecase = Get.find<EventUseCases>();
  late DateTime startDate;
  late DateTime endDate;

  @override
  void onInit() {
    startDate = DateTime.now().dateWithoutDay();
    endDate = startDate
        .copyWith(month: startDate.month + 1)
        .subtract(const Duration(seconds: 1));
    getData(startDate, endDate);

    super.onInit();
  }

  Future<void> getData(DateTime from, DateTime to) async {
    final result = await eventUsecase.getEventsFrom(from, to);
    if (result is DataSuccess<List<Event>>) {
      print(result.data.length);
    }
  }
}
