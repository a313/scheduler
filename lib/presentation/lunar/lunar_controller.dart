import 'package:full_calender/full_calender.dart';
import 'package:full_calender/models/lunar_date_time.dart';
import 'package:get/get.dart';

class LunarController extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final Rx<DateTime> focusedDay = DateTime.now().obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() {}

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    selectedDate.value = selectedDay;
    this.focusedDay.value = focusedDay;
  }

  LunarDateTime getLunarDate(DateTime solarDate) {
    return FullCalender(date: solarDate, timeZone: 7).lunarDate;
  }
}
