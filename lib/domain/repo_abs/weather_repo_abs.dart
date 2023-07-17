import '../../core/usecase/data_state.dart';
import '../../data/models/forecast.dart';

abstract class WeatherRepo {
  Future<DataState<Forecast>> getForecastSummary(double lat, double long);
}
