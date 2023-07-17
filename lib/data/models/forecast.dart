import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast.freezed.dart';
part 'forecast.g.dart';

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    List<Item>? items,
    DateTime? forecastDate,
    DateTime? nextUpdate,
    String? source,
    String? point,
    String? fingerprint,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    DateTime? date,
    DateTime? dateWithTimezone,
    int? freshSnow,
    dynamic snowHeight,
    Weather? weather,
    Prec? prec,
    int? sunHours,
    dynamic rainHours,
    SnowLine? temperature,
    Wind? wind,
    SnowLine? windchill,
    SnowLine? snowLine,
    Astronomy? astronomy,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
class Astronomy with _$Astronomy {
  const factory Astronomy({
    DateTime? dawn,
    DateTime? sunrise,
    DateTime? suntransit,
    DateTime? sunset,
    DateTime? dusk,
    DateTime? moonrise,
    DateTime? moontransit,
    DateTime? moonset,
    double? moonphase,
    double? moonzodiac,
  }) = _Astronomy;

  factory Astronomy.fromJson(Map<String, dynamic> json) =>
      _$AstronomyFromJson(json);
}

@freezed
class Prec with _$Prec {
  const factory Prec({
    double? sum,
    double? probability,
    double? sumAsRain,
    double? precClass,
  }) = _Prec;

  factory Prec.fromJson(Map<String, dynamic> json) => _$PrecFromJson(json);
}

@freezed
class SnowLine with _$SnowLine {
  const factory SnowLine({
    double? avg,
    double? min,
    double? max,
    String? unit,
  }) = _SnowLine;

  factory SnowLine.fromJson(Map<String, dynamic> json) =>
      _$SnowLineFromJson(json);
}

@freezed
class Weather with _$Weather {
  const factory Weather({
    int? state,
    String? text,
    String? icon,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
class Wind with _$Wind {
  const factory Wind({
    String? unit,
    String? direction,
    String? text,
    double? avg,
    double? min,
    double? max,
    Gusts? gusts,
    bool? significationWind,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

@freezed
class Gusts with _$Gusts {
  const factory Gusts({
    double? value,
    String? text,
  }) = _Gusts;

  factory Gusts.fromJson(Map<String, dynamic> json) => _$GustsFromJson(json);
}
