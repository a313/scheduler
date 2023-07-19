// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

import '../../core/network/api_service.dart';

abstract class WeatherService extends ApiService {
  Future<Response> getForecastSummary(double lat, double long);
  Future<Response> getForecastHourly(double lat, double long);
  Future<Response> getCurrentWeather(double lat, double long);
}

// class ForecastService extends WeatherService {
//   final Forecast_KEY = '0b832762f2mshc091cf40976d7e0p16ee69jsnecede991f698';
//   final Forecast_HOST = 'forecast9.p.rapidapi.com';

//   buildHeader() {
//     return {'X-RapidAPI-Key': Forecast_KEY, 'X-RapidAPI-Host': Forecast_HOST};
//   }

//   @override
//   Future<Response> getForecastSummary(double lat, double long) {
//     ();
//     final url =
//         'https://forecast9.p.rapidapi.com/rapidapi/forecast/$lat/$long/summary/';
//     return get(url, headers: buildHeader());
//   }

//   @override
//   Future<Response> getCurrentWeather(double lat, double long) {
//     // TODO: implement getCurrentWeather
//     throw UnimplementedError();
//   }
// }

class WeatherbitService extends WeatherService {
  final KEY = 'f3eaa5bef5534483be94837302adaba2';
  @override
  String get domain => 'https://api.weatherbit.io/v2.0';

  @override
  Future<Response> getForecastSummary(double lat, double long) {
    const endPoint = '/forecast/daily';

    return getData(endPoint: endPoint, params: {
      'lat': lat.toString(),
      'lon': long.toString(),
      'key': KEY,
    });
  }

  @override
  Future<Response> getForecastHourly(double lat, double long) {
    const endPoint = '/forecast/hourly';
    return getData(endPoint: endPoint, params: {
      'lat': lat.toString(),
      'lon': long.toString(),
      'key': KEY,
    });
  }

  @override
  Future<Response> getCurrentWeather(double lat, double long) {
    const endPoint = '/current';

    return getData(endPoint: endPoint, params: {
      'lat': lat.toString(),
      'lon': long.toString(),
      'key': KEY,
    });
  }
}
