import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/weatherbit.dart';
import 'package:scheduler/domain/usecases/weather_usecases.dart';

class WeatherController extends BaseController {
  final useCase = Get.find<WeatherUseCases>();
  Position? currentPosition;
  CurrentWeather? currentWeather;
  Forecast? summary;

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  Future<void> getData() async {
    currentPosition = await getCurrentPosition();
    getWeather();
    getForecastSummary();
  }

  Future<void> getWeather() async {
    if (currentPosition == null) return;
    final result = await useCase.getCurrentWeather(currentPosition!);
    if (result is DataSuccess<CurrentWeather>) {
      currentWeather = result.data;
      update();
    }
  }

  Future<void> getForecastSummary() async {
    final result = await useCase.getForecastSummary(currentPosition!);
    if (result is DataSuccess<Forecast>) {
      summary = result.data;
      update();
    }
  }
}
