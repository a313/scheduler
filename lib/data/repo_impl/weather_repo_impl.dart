import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/weatherbit.dart';

import '../../domain/repo_abs/weather_repo_abs.dart';
import '../datasource/weather_service.dart';

class WeatherRepoImpl extends WeatherRepo {
  final WeatherService _;

  WeatherRepoImpl(this._);

  @override
  Future<DataState<Forecast>> getForecastSummary(
      double lat, double long) async {
    final Response response = await _.getForecastSummary(lat, long);
    final GetStorage local = GetStorage();
    const localKey = 'ForecastSummary';
    if (response.statusCode == 200) {
      final data = Forecast.fromJson(response.body);

      local.write(localKey, data);
      return DataSuccess(data);
    } else if (local.hasData(localKey)) {
      final data = local.read(localKey);
      if (data is Forecast) {
        return DataSuccess(data);
      } else if (data is Map) {
        return DataSuccess(Forecast.fromJson(data as Map<String, dynamic>));
      } else {
        return DataFailure('local', UNKNOWN_ERROR);
      }
    } else {
      return DataFailure(response.body['code'], response.body['message']);
    }
  }

  @override
  Future<DataState<CurrentWeather>> getCurrentWeather(
      double lat, double long) async {
    final Response response = await _.getCurrentWeather(lat, long);
    final GetStorage local = GetStorage();
    const localKey = 'CurrentWeather';
    if (response.statusCode == 200) {
      final data = CurrentWeather.fromJson(response.body);

      local.write(localKey, data);

      return DataSuccess(data);
    } else if (local.hasData(localKey)) {
      final data = local.read(localKey);
      if (data is CurrentWeather) {
        return DataSuccess(data);
      } else if (data is Map) {
        return DataSuccess(
            CurrentWeather.fromJson(data as Map<String, dynamic>));
      } else {
        return DataFailure('local', UNKNOWN_ERROR);
      }
    } else {
      return DataFailure(response.body['code'], response.body['message']);
    }
  }

  @override
  Future<DataState<Forecast>> getForecastHourly(double lat, double long) async {
    final Response response = await _.getForecastHourly(lat, long);
    final GetStorage local = GetStorage();
    const localKey = 'ForecastHourly';
    if (response.statusCode == 200) {
      final data = Forecast.fromJson(response.body);

      local.write(localKey, data);
      return DataSuccess(data);
    } else if (local.hasData(localKey)) {
      final data = local.read(localKey);
      if (data is Forecast) {
        return DataSuccess(data);
      } else if (data is Map) {
        return DataSuccess(Forecast.fromJson(data as Map<String, dynamic>));
      } else {
        return DataFailure('local', UNKNOWN_ERROR);
      }
    } else {
      return DataFailure(response.body['code'], response.body['message']);
    }
  }
}
