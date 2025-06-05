// import 'package:geolocator/geolocator.dart';
// import 'package:aio/data/models/weatherbit.dart';

// import '../../core/usecase/data_state.dart';
// import '../repo_abs/weather_repo_abs.dart';

// class WeatherUseCases {
//   final WeatherRepo _;

//   WeatherUseCases(this._);

//   Future<DataState<Forecast>> getForecastSummary(Position location) async {
//     return _.getForecastSummary(location.latitude, location.longitude);
//   }

//   Future<DataState<Forecast>> getForecastHourly(Position location) async {
//     return _.getForecastHourly(location.latitude, location.longitude);
//   }

//   Future<DataState<CurrentWeather>> getCurrentWeather(Position location) async {
//     return _.getCurrentWeather(location.latitude, location.longitude);
//   }
// }
