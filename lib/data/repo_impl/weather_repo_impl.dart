import 'dart:convert';

import 'package:get/get.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/forecast.dart';

import '../../domain/repo_abs/weather_repo_abs.dart';
import '../datasource/weather_service.dart';

class WeatherRepoImpl extends WeatherRepo {
  final WeatherService _;

  WeatherRepoImpl(this._);

  @override
  Future<DataState<Forecast>> getForecastSummary(
      double lat, double long) async {
    final Response response =
        await _.getForecastSummary(lat.toPrecision(5), long.toPrecision(5));
    if (response.statusCode == 200) {
      return DataSuccess(Forecast.fromJson(response.body));
    } else {
      final err = jsonDecode(response.bodyString!);
      final detail = err['error']['details'] ?? UNKNOWN_ERROR;
      return DataFailure(response.statusCode.toString(), detail.toString());
    }
  }
}
