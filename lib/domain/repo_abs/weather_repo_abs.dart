import 'package:scheduler/data/models/weatherbit.dart';

import '../../core/usecase/data_state.dart';

abstract class WeatherRepo {
  Future<DataState<Weatherbit>> getForecastSummary(double lat, double long);
}
