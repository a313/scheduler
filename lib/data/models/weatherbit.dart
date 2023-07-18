import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduler/core/utils/util.dart';

part 'weatherbit.freezed.dart';
part 'weatherbit.g.dart';

@freezed
class Weatherbit with _$Weatherbit {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const Weatherbit._();
  const factory Weatherbit({
    String? cityName,
    String? stateCode,
    String? countryCode,
    num? lat,
    num? lon,
    String? timezone,
    List<Datum>? data,
  }) = _Weatherbit;

  factory Weatherbit.fromJson(Map<String, dynamic> json) =>
      _$WeatherbitFromJson(json);

  Datum? findByKey(DateTime key) {
    if (data == null) return null;
    for (final d in data!) {
      d.datetime == key.toStringFormat(DateFormater.YYYYMMDD);
      return d;
    }
    return null;
  }
}

@freezed
class Datum with _$Datum {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Datum({
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
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Weather with _$Weather {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Weather({
    String? icon,
    int? code,
    String? description,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
