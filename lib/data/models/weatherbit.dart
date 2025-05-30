import 'package:aio/core/utils/util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weatherbit.freezed.dart';
part 'weatherbit.g.dart';

@freezed
sealed class Forecast with _$Forecast {
  const Forecast._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Forecast({
    String? cityName,
    String? stateCode,
    String? countryCode,
    num? lat,
    num? lon,
    String? timezone,
    List<WeatherInfo>? data,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  WeatherInfo? findByKey(DateTime key) {
    if (data == null) return null;
    for (final d in data!) {
      if (d.datetime == key.toStringFormat(DateFormater.YYYYMMDD)) {
        return d;
      }
    }
    return null;
  }
}

@freezed
sealed class CurrentWeather with _$CurrentWeather {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CurrentWeather({
    int? count,
    List<WeatherInfo>? data,
  }) = _CurrentWeather;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
}

@freezed
sealed class WeatherInfo with _$WeatherInfo {
  const WeatherInfo._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WeatherInfo({
    num? ts,
    DateTime? timestampLocal,
    DateTime? timestampUtc,
    String? datetime,
    num? snow,
    int? snowDepth,
    num? precip,
    num? temp,
    num? dewpt,
    num? maxTemp,
    num? minTemp,
    num? appMaxTemp,
    num? appMinTemp,
    int? rh,
    int? clouds,
    Weather? weather,
    num? slp,
    num? pres,
    num? uv,
    num? maxDhi,
    num? vis,
    num? pop,
    num? moonPhase,
    int? sunriseTs,
    int? sunsetTs,
    int? moonriseTs,
    int? moonsetTs,
    String? pod,
    num? windSpd,
    int? windDir,
    String? windCdir,
    String? windCdirFull,
    double? appTemp,
    int? aqi,
    String? cityName,
    String? countryCode,
    double? dhi,
    double? dni,
    double? elevAngle,
    double? ghi,
    double? gust,
    double? hAngle,
    double? lat,
    double? lon,
    String? obTime,
    double? solarRad,
    List<String>? sources,
    String? stateCode,
    String? station,
    String? sunrise,
    String? sunset,
    String? timezone,
  }) = _WeatherInfo;

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);

  DateTime get date => DateTime.parse(datetime ?? '1900-01-01');

  DateTime get sunriseTime =>
      DateTime.parse('${DateTime.now().toStringFormat('yyyy-MM-dd')} $sunrise');
  DateTime get sunsetTime =>
      DateTime.parse('${DateTime.now().toStringFormat('yyyy-MM-dd')} $sunset');
}

@freezed
sealed class Weather with _$Weather {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Weather({
    String? icon,
    int? code,
    String? description,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
