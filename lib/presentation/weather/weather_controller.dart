import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/domain/usecases/weather_usecases.dart';

class WeatherController extends BaseController {
  final useCase = Get.find<WeatherUseCases>();

  @override
  void onReady() {
    fetchData();
    super.onReady();
  }

  void fetchData() {}

  Future<void> getWeather() async {
    Position? currentPosition = await getCurrentPosition();
    if (currentPosition == null) return;
    final result = await useCase.getCurrentWeather(currentPosition);
  }
}
