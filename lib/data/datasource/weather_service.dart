// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class WeatherService extends GetConnect {
  final Forecast_KEY = '0b832762f2mshc091cf40976d7e0p16ee69jsnecede991f698';
  final Forecast_HOST = 'forecast9.p.rapidapi.com';

  buildHeader() {
    return {'X-RapidAPI-Key': Forecast_KEY, 'X-RapidAPI-Host': Forecast_HOST};
  }

  Future<Response> getForecastSummary(double lat, double long) {
    ();
    final url =
        'https://forecast9.p.rapidapi.com/rapidapi/forecast/$lat/$long/summary/';
    return get(url, headers: buildHeader());
  }
}
