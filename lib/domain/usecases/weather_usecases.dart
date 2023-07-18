import 'package:geolocator/geolocator.dart';
import 'package:scheduler/data/models/weatherbit.dart';

import '../../core/usecase/data_state.dart';
import '../repo_abs/weather_repo_abs.dart';

class WeatherUseCases {
  final WeatherRepo _;

  WeatherUseCases(this._);

  Future<DataState<Weatherbit>> getForecastSummary(Position location) async {
    return _.getForecastSummary(location.latitude, location.longitude);
  }
}
