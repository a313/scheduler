import 'dart:developer';

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
  Future<DataState<Weatherbit>> getForecastSummary(
      double lat, double long) async {
    final Response response = await _.getForecastSummary(lat, long);
    final GetStorage local = GetStorage();
    const localKey = 'weather';
    if (response.statusCode == 200) {
      final data = Weatherbit.fromJson(response.body);

      local.write(localKey, data);
      return DataSuccess(data);
    } else if (local.hasData(localKey)) {
      final data = local.read(localKey);
      if (data is Weatherbit) {
        return DataSuccess(data);
      } else if (data is Map) {
        return DataSuccess(Weatherbit.fromJson(data as Map<String, dynamic>));
      } else {
        return DataFailure('local', UNKNOWN_ERROR);
      }
    } else {
      return DataFailure(response.body['code'], response.body['message']);
    }
  }

  @override
  Future<DataState> getCurrentWeather(double lat, double long) async {
    final Response response = await _.getCurrentWeather(lat, long);
    final GetStorage local = GetStorage();
    const localKey = 'current_weather';
    if (response.statusCode == 200) {
      // final data = Weatherbit.fromJson(response.body);

      // local.write(localKey, data);
      log(response.bodyString!);
      return DataSuccess(null);
    } else if (local.hasData(localKey)) {
      final data = local.read(localKey);
      if (data is Weatherbit) {
        return DataSuccess(data);
      } else if (data is Map) {
        return DataSuccess(Weatherbit.fromJson(data as Map<String, dynamic>));
      } else {
        return DataFailure('local', UNKNOWN_ERROR);
      }
    } else {
      return DataFailure(response.body['code'], response.body['message']);
    }
  }
}
