import 'package:scheduler/data/models/weatherbit.dart';

import '../../core/usecase/data_state.dart';

abstract class WeatherRepo {
  Future<DataState<Forecast>> getForecastSummary(double lat, double long);
  Future<DataState<Forecast>> getForecastHourly(double lat, double long);
  Future<DataState<CurrentWeather>> getCurrentWeather(double lat, double long);
}
