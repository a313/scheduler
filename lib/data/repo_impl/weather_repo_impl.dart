import 'package:get/get.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/weatherbit.dart';
import 'package:scheduler/domain/repo_abs/local_data_repo_abs.dart';

import '../../domain/repo_abs/weather_repo_abs.dart';
import '../datasource/weather_service.dart';

class WeatherRepoImpl extends WeatherRepo {
  final WeatherService _;
  final LocalDataRepo local;

  WeatherRepoImpl(this._, this.local);

  @override
  Future<DataState<Forecast>> getForecastSummary(
      double lat, double long) async {
    final now = DateTime.now();
    final lastUpdate = local.getLastUpdateForecastSummary();
    if (lastUpdate != null &&
        lastUpdate.isAfter(now.add(const Duration(hours: 3)))) {
      final forescast = local.getLastForecast();
      if (forescast != null) return DataSuccess(forescast);
    }

    final Response response = await _.getForecastSummary(lat, long);

    if (response.statusCode == 200) {
      final data = Forecast.fromJson(response.body);
      local.savedLastForecast(data);
      local.savedLastUpdateForecastSummary(now);
      return DataSuccess(data);
    } else {
      final forescast = local.getLastForecast();
      if (forescast != null) return DataSuccess(forescast);
      return DataFailure(response.body['code'], response.body['message']);
    }
  }

  @override
  Future<DataState<CurrentWeather>> getCurrentWeather(
      double lat, double long) async {
    final now = DateTime.now();
    final lastUpdate = local.getLastUpdateCurrentWeather();
    if (lastUpdate != null &&
        lastUpdate.isAfter(now.add(const Duration(minutes: 30)))) {
      final weather = local.getLastCurrentWeather();
      if (weather != null) return DataSuccess(weather);
    }

    final Response response = await _.getCurrentWeather(lat, long);

    if (response.statusCode == 200) {
      final data = CurrentWeather.fromJson(response.body);
      local.savedLastCurrentWeather(data);
      local.savedLastUpdateCurrentWeather(now);
      return DataSuccess(data);
    } else {
      final weather = local.getLastCurrentWeather();
      if (weather != null) return DataSuccess(weather);
      return DataFailure(response.body['code'], response.body['message']);
    }
  }

  @override
  Future<DataState<Forecast>> getForecastHourly(double lat, double long) async {
    throw UnimplementedError();
  }
}
