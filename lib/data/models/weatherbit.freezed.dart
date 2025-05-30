// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weatherbit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Forecast {
  String? get cityName;
  String? get stateCode;
  String? get countryCode;
  num? get lat;
  num? get lon;
  String? get timezone;
  List<WeatherInfo>? get data;

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForecastCopyWith<Forecast> get copyWith =>
      _$ForecastCopyWithImpl<Forecast>(this as Forecast, _$identity);

  /// Serializes this Forecast to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Forecast &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cityName, stateCode, countryCode,
      lat, lon, timezone, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'Forecast(cityName: $cityName, stateCode: $stateCode, countryCode: $countryCode, lat: $lat, lon: $lon, timezone: $timezone, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ForecastCopyWith<$Res> {
  factory $ForecastCopyWith(Forecast value, $Res Function(Forecast) _then) =
      _$ForecastCopyWithImpl;
  @useResult
  $Res call(
      {String? cityName,
      String? stateCode,
      String? countryCode,
      num? lat,
      num? lon,
      String? timezone,
      List<WeatherInfo>? data});
}

/// @nodoc
class _$ForecastCopyWithImpl<$Res> implements $ForecastCopyWith<$Res> {
  _$ForecastCopyWithImpl(this._self, this._then);

  final Forecast _self;
  final $Res Function(Forecast) _then;

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityName = freezed,
    Object? stateCode = freezed,
    Object? countryCode = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? timezone = freezed,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      cityName: freezed == cityName
          ? _self.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateCode: freezed == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num?,
      lon: freezed == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as num?,
      timezone: freezed == timezone
          ? _self.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfo>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Forecast extends Forecast {
  const _Forecast(
      {this.cityName,
      this.stateCode,
      this.countryCode,
      this.lat,
      this.lon,
      this.timezone,
      final List<WeatherInfo>? data})
      : _data = data,
        super._();
  factory _Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  @override
  final String? cityName;
  @override
  final String? stateCode;
  @override
  final String? countryCode;
  @override
  final num? lat;
  @override
  final num? lon;
  @override
  final String? timezone;
  final List<WeatherInfo>? _data;
  @override
  List<WeatherInfo>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForecastCopyWith<_Forecast> get copyWith =>
      __$ForecastCopyWithImpl<_Forecast>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ForecastToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Forecast &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cityName, stateCode, countryCode,
      lat, lon, timezone, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'Forecast(cityName: $cityName, stateCode: $stateCode, countryCode: $countryCode, lat: $lat, lon: $lon, timezone: $timezone, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ForecastCopyWith<$Res>
    implements $ForecastCopyWith<$Res> {
  factory _$ForecastCopyWith(_Forecast value, $Res Function(_Forecast) _then) =
      __$ForecastCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? cityName,
      String? stateCode,
      String? countryCode,
      num? lat,
      num? lon,
      String? timezone,
      List<WeatherInfo>? data});
}

/// @nodoc
class __$ForecastCopyWithImpl<$Res> implements _$ForecastCopyWith<$Res> {
  __$ForecastCopyWithImpl(this._self, this._then);

  final _Forecast _self;
  final $Res Function(_Forecast) _then;

  /// Create a copy of Forecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cityName = freezed,
    Object? stateCode = freezed,
    Object? countryCode = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? timezone = freezed,
    Object? data = freezed,
  }) {
    return _then(_Forecast(
      cityName: freezed == cityName
          ? _self.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateCode: freezed == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num?,
      lon: freezed == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as num?,
      timezone: freezed == timezone
          ? _self.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfo>?,
    ));
  }
}

/// @nodoc
mixin _$CurrentWeather {
  int? get count;
  List<WeatherInfo>? get data;

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurrentWeatherCopyWith<CurrentWeather> get copyWith =>
      _$CurrentWeatherCopyWithImpl<CurrentWeather>(
          this as CurrentWeather, _$identity);

  /// Serializes this CurrentWeather to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurrentWeather &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'CurrentWeather(count: $count, data: $data)';
  }
}

/// @nodoc
abstract mixin class $CurrentWeatherCopyWith<$Res> {
  factory $CurrentWeatherCopyWith(
          CurrentWeather value, $Res Function(CurrentWeather) _then) =
      _$CurrentWeatherCopyWithImpl;
  @useResult
  $Res call({int? count, List<WeatherInfo>? data});
}

/// @nodoc
class _$CurrentWeatherCopyWithImpl<$Res>
    implements $CurrentWeatherCopyWith<$Res> {
  _$CurrentWeatherCopyWithImpl(this._self, this._then);

  final CurrentWeather _self;
  final $Res Function(CurrentWeather) _then;

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfo>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _CurrentWeather implements CurrentWeather {
  const _CurrentWeather({this.count, final List<WeatherInfo>? data})
      : _data = data;
  factory _CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  @override
  final int? count;
  final List<WeatherInfo>? _data;
  @override
  List<WeatherInfo>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurrentWeatherCopyWith<_CurrentWeather> get copyWith =>
      __$CurrentWeatherCopyWithImpl<_CurrentWeather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CurrentWeatherToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurrentWeather &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'CurrentWeather(count: $count, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$CurrentWeatherCopyWith<$Res>
    implements $CurrentWeatherCopyWith<$Res> {
  factory _$CurrentWeatherCopyWith(
          _CurrentWeather value, $Res Function(_CurrentWeather) _then) =
      __$CurrentWeatherCopyWithImpl;
  @override
  @useResult
  $Res call({int? count, List<WeatherInfo>? data});
}

/// @nodoc
class __$CurrentWeatherCopyWithImpl<$Res>
    implements _$CurrentWeatherCopyWith<$Res> {
  __$CurrentWeatherCopyWithImpl(this._self, this._then);

  final _CurrentWeather _self;
  final $Res Function(_CurrentWeather) _then;

  /// Create a copy of CurrentWeather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? count = freezed,
    Object? data = freezed,
  }) {
    return _then(_CurrentWeather(
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfo>?,
    ));
  }
}

/// @nodoc
mixin _$WeatherInfo {
  num? get ts;
  DateTime? get timestampLocal;
  DateTime? get timestampUtc;
  String? get datetime;
  num? get snow;
  int? get snowDepth;
  num? get precip;
  num? get temp;
  num? get dewpt;
  num? get maxTemp;
  num? get minTemp;
  num? get appMaxTemp;
  num? get appMinTemp;
  int? get rh;
  int? get clouds;
  Weather? get weather;
  num? get slp;
  num? get pres;
  num? get uv;
  num? get maxDhi;
  num? get vis;
  num? get pop;
  num? get moonPhase;
  int? get sunriseTs;
  int? get sunsetTs;
  int? get moonriseTs;
  int? get moonsetTs;
  String? get pod;
  num? get windSpd;
  int? get windDir;
  String? get windCdir;
  String? get windCdirFull;
  double? get appTemp;
  int? get aqi;
  String? get cityName;
  String? get countryCode;
  double? get dhi;
  double? get dni;
  double? get elevAngle;
  double? get ghi;
  double? get gust;
  double? get hAngle;
  double? get lat;
  double? get lon;
  String? get obTime;
  double? get solarRad;
  List<String>? get sources;
  String? get stateCode;
  String? get station;
  String? get sunrise;
  String? get sunset;
  String? get timezone;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherInfoCopyWith<WeatherInfo> get copyWith =>
      _$WeatherInfoCopyWithImpl<WeatherInfo>(this as WeatherInfo, _$identity);

  /// Serializes this WeatherInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherInfo &&
            (identical(other.ts, ts) || other.ts == ts) &&
            (identical(other.timestampLocal, timestampLocal) ||
                other.timestampLocal == timestampLocal) &&
            (identical(other.timestampUtc, timestampUtc) ||
                other.timestampUtc == timestampUtc) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.snow, snow) || other.snow == snow) &&
            (identical(other.snowDepth, snowDepth) ||
                other.snowDepth == snowDepth) &&
            (identical(other.precip, precip) || other.precip == precip) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.dewpt, dewpt) || other.dewpt == dewpt) &&
            (identical(other.maxTemp, maxTemp) || other.maxTemp == maxTemp) &&
            (identical(other.minTemp, minTemp) || other.minTemp == minTemp) &&
            (identical(other.appMaxTemp, appMaxTemp) ||
                other.appMaxTemp == appMaxTemp) &&
            (identical(other.appMinTemp, appMinTemp) ||
                other.appMinTemp == appMinTemp) &&
            (identical(other.rh, rh) || other.rh == rh) &&
            (identical(other.clouds, clouds) || other.clouds == clouds) &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.slp, slp) || other.slp == slp) &&
            (identical(other.pres, pres) || other.pres == pres) &&
            (identical(other.uv, uv) || other.uv == uv) &&
            (identical(other.maxDhi, maxDhi) || other.maxDhi == maxDhi) &&
            (identical(other.vis, vis) || other.vis == vis) &&
            (identical(other.pop, pop) || other.pop == pop) &&
            (identical(other.moonPhase, moonPhase) ||
                other.moonPhase == moonPhase) &&
            (identical(other.sunriseTs, sunriseTs) ||
                other.sunriseTs == sunriseTs) &&
            (identical(other.sunsetTs, sunsetTs) ||
                other.sunsetTs == sunsetTs) &&
            (identical(other.moonriseTs, moonriseTs) ||
                other.moonriseTs == moonriseTs) &&
            (identical(other.moonsetTs, moonsetTs) ||
                other.moonsetTs == moonsetTs) &&
            (identical(other.pod, pod) || other.pod == pod) &&
            (identical(other.windSpd, windSpd) || other.windSpd == windSpd) &&
            (identical(other.windDir, windDir) || other.windDir == windDir) &&
            (identical(other.windCdir, windCdir) ||
                other.windCdir == windCdir) &&
            (identical(other.windCdirFull, windCdirFull) ||
                other.windCdirFull == windCdirFull) &&
            (identical(other.appTemp, appTemp) || other.appTemp == appTemp) &&
            (identical(other.aqi, aqi) || other.aqi == aqi) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.dhi, dhi) || other.dhi == dhi) &&
            (identical(other.dni, dni) || other.dni == dni) &&
            (identical(other.elevAngle, elevAngle) ||
                other.elevAngle == elevAngle) &&
            (identical(other.ghi, ghi) || other.ghi == ghi) &&
            (identical(other.gust, gust) || other.gust == gust) &&
            (identical(other.hAngle, hAngle) || other.hAngle == hAngle) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.obTime, obTime) || other.obTime == obTime) &&
            (identical(other.solarRad, solarRad) ||
                other.solarRad == solarRad) &&
            const DeepCollectionEquality().equals(other.sources, sources) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        ts,
        timestampLocal,
        timestampUtc,
        datetime,
        snow,
        snowDepth,
        precip,
        temp,
        dewpt,
        maxTemp,
        minTemp,
        appMaxTemp,
        appMinTemp,
        rh,
        clouds,
        weather,
        slp,
        pres,
        uv,
        maxDhi,
        vis,
        pop,
        moonPhase,
        sunriseTs,
        sunsetTs,
        moonriseTs,
        moonsetTs,
        pod,
        windSpd,
        windDir,
        windCdir,
        windCdirFull,
        appTemp,
        aqi,
        cityName,
        countryCode,
        dhi,
        dni,
        elevAngle,
        ghi,
        gust,
        hAngle,
        lat,
        lon,
        obTime,
        solarRad,
        const DeepCollectionEquality().hash(sources),
        stateCode,
        station,
        sunrise,
        sunset,
        timezone
      ]);

  @override
  String toString() {
    return 'WeatherInfo(ts: $ts, timestampLocal: $timestampLocal, timestampUtc: $timestampUtc, datetime: $datetime, snow: $snow, snowDepth: $snowDepth, precip: $precip, temp: $temp, dewpt: $dewpt, maxTemp: $maxTemp, minTemp: $minTemp, appMaxTemp: $appMaxTemp, appMinTemp: $appMinTemp, rh: $rh, clouds: $clouds, weather: $weather, slp: $slp, pres: $pres, uv: $uv, maxDhi: $maxDhi, vis: $vis, pop: $pop, moonPhase: $moonPhase, sunriseTs: $sunriseTs, sunsetTs: $sunsetTs, moonriseTs: $moonriseTs, moonsetTs: $moonsetTs, pod: $pod, windSpd: $windSpd, windDir: $windDir, windCdir: $windCdir, windCdirFull: $windCdirFull, appTemp: $appTemp, aqi: $aqi, cityName: $cityName, countryCode: $countryCode, dhi: $dhi, dni: $dni, elevAngle: $elevAngle, ghi: $ghi, gust: $gust, hAngle: $hAngle, lat: $lat, lon: $lon, obTime: $obTime, solarRad: $solarRad, sources: $sources, stateCode: $stateCode, station: $station, sunrise: $sunrise, sunset: $sunset, timezone: $timezone)';
  }
}

/// @nodoc
abstract mixin class $WeatherInfoCopyWith<$Res> {
  factory $WeatherInfoCopyWith(
          WeatherInfo value, $Res Function(WeatherInfo) _then) =
      _$WeatherInfoCopyWithImpl;
  @useResult
  $Res call(
      {num? ts,
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
      String? timezone});

  $WeatherCopyWith<$Res>? get weather;
}

/// @nodoc
class _$WeatherInfoCopyWithImpl<$Res> implements $WeatherInfoCopyWith<$Res> {
  _$WeatherInfoCopyWithImpl(this._self, this._then);

  final WeatherInfo _self;
  final $Res Function(WeatherInfo) _then;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ts = freezed,
    Object? timestampLocal = freezed,
    Object? timestampUtc = freezed,
    Object? datetime = freezed,
    Object? snow = freezed,
    Object? snowDepth = freezed,
    Object? precip = freezed,
    Object? temp = freezed,
    Object? dewpt = freezed,
    Object? maxTemp = freezed,
    Object? minTemp = freezed,
    Object? appMaxTemp = freezed,
    Object? appMinTemp = freezed,
    Object? rh = freezed,
    Object? clouds = freezed,
    Object? weather = freezed,
    Object? slp = freezed,
    Object? pres = freezed,
    Object? uv = freezed,
    Object? maxDhi = freezed,
    Object? vis = freezed,
    Object? pop = freezed,
    Object? moonPhase = freezed,
    Object? sunriseTs = freezed,
    Object? sunsetTs = freezed,
    Object? moonriseTs = freezed,
    Object? moonsetTs = freezed,
    Object? pod = freezed,
    Object? windSpd = freezed,
    Object? windDir = freezed,
    Object? windCdir = freezed,
    Object? windCdirFull = freezed,
    Object? appTemp = freezed,
    Object? aqi = freezed,
    Object? cityName = freezed,
    Object? countryCode = freezed,
    Object? dhi = freezed,
    Object? dni = freezed,
    Object? elevAngle = freezed,
    Object? ghi = freezed,
    Object? gust = freezed,
    Object? hAngle = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? obTime = freezed,
    Object? solarRad = freezed,
    Object? sources = freezed,
    Object? stateCode = freezed,
    Object? station = freezed,
    Object? sunrise = freezed,
    Object? sunset = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_self.copyWith(
      ts: freezed == ts
          ? _self.ts
          : ts // ignore: cast_nullable_to_non_nullable
              as num?,
      timestampLocal: freezed == timestampLocal
          ? _self.timestampLocal
          : timestampLocal // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timestampUtc: freezed == timestampUtc
          ? _self.timestampUtc
          : timestampUtc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datetime: freezed == datetime
          ? _self.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      snow: freezed == snow
          ? _self.snow
          : snow // ignore: cast_nullable_to_non_nullable
              as num?,
      snowDepth: freezed == snowDepth
          ? _self.snowDepth
          : snowDepth // ignore: cast_nullable_to_non_nullable
              as int?,
      precip: freezed == precip
          ? _self.precip
          : precip // ignore: cast_nullable_to_non_nullable
              as num?,
      temp: freezed == temp
          ? _self.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as num?,
      dewpt: freezed == dewpt
          ? _self.dewpt
          : dewpt // ignore: cast_nullable_to_non_nullable
              as num?,
      maxTemp: freezed == maxTemp
          ? _self.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      minTemp: freezed == minTemp
          ? _self.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      appMaxTemp: freezed == appMaxTemp
          ? _self.appMaxTemp
          : appMaxTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      appMinTemp: freezed == appMinTemp
          ? _self.appMinTemp
          : appMinTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      rh: freezed == rh
          ? _self.rh
          : rh // ignore: cast_nullable_to_non_nullable
              as int?,
      clouds: freezed == clouds
          ? _self.clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as int?,
      weather: freezed == weather
          ? _self.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      slp: freezed == slp
          ? _self.slp
          : slp // ignore: cast_nullable_to_non_nullable
              as num?,
      pres: freezed == pres
          ? _self.pres
          : pres // ignore: cast_nullable_to_non_nullable
              as num?,
      uv: freezed == uv
          ? _self.uv
          : uv // ignore: cast_nullable_to_non_nullable
              as num?,
      maxDhi: freezed == maxDhi
          ? _self.maxDhi
          : maxDhi // ignore: cast_nullable_to_non_nullable
              as num?,
      vis: freezed == vis
          ? _self.vis
          : vis // ignore: cast_nullable_to_non_nullable
              as num?,
      pop: freezed == pop
          ? _self.pop
          : pop // ignore: cast_nullable_to_non_nullable
              as num?,
      moonPhase: freezed == moonPhase
          ? _self.moonPhase
          : moonPhase // ignore: cast_nullable_to_non_nullable
              as num?,
      sunriseTs: freezed == sunriseTs
          ? _self.sunriseTs
          : sunriseTs // ignore: cast_nullable_to_non_nullable
              as int?,
      sunsetTs: freezed == sunsetTs
          ? _self.sunsetTs
          : sunsetTs // ignore: cast_nullable_to_non_nullable
              as int?,
      moonriseTs: freezed == moonriseTs
          ? _self.moonriseTs
          : moonriseTs // ignore: cast_nullable_to_non_nullable
              as int?,
      moonsetTs: freezed == moonsetTs
          ? _self.moonsetTs
          : moonsetTs // ignore: cast_nullable_to_non_nullable
              as int?,
      pod: freezed == pod
          ? _self.pod
          : pod // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpd: freezed == windSpd
          ? _self.windSpd
          : windSpd // ignore: cast_nullable_to_non_nullable
              as num?,
      windDir: freezed == windDir
          ? _self.windDir
          : windDir // ignore: cast_nullable_to_non_nullable
              as int?,
      windCdir: freezed == windCdir
          ? _self.windCdir
          : windCdir // ignore: cast_nullable_to_non_nullable
              as String?,
      windCdirFull: freezed == windCdirFull
          ? _self.windCdirFull
          : windCdirFull // ignore: cast_nullable_to_non_nullable
              as String?,
      appTemp: freezed == appTemp
          ? _self.appTemp
          : appTemp // ignore: cast_nullable_to_non_nullable
              as double?,
      aqi: freezed == aqi
          ? _self.aqi
          : aqi // ignore: cast_nullable_to_non_nullable
              as int?,
      cityName: freezed == cityName
          ? _self.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dhi: freezed == dhi
          ? _self.dhi
          : dhi // ignore: cast_nullable_to_non_nullable
              as double?,
      dni: freezed == dni
          ? _self.dni
          : dni // ignore: cast_nullable_to_non_nullable
              as double?,
      elevAngle: freezed == elevAngle
          ? _self.elevAngle
          : elevAngle // ignore: cast_nullable_to_non_nullable
              as double?,
      ghi: freezed == ghi
          ? _self.ghi
          : ghi // ignore: cast_nullable_to_non_nullable
              as double?,
      gust: freezed == gust
          ? _self.gust
          : gust // ignore: cast_nullable_to_non_nullable
              as double?,
      hAngle: freezed == hAngle
          ? _self.hAngle
          : hAngle // ignore: cast_nullable_to_non_nullable
              as double?,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      obTime: freezed == obTime
          ? _self.obTime
          : obTime // ignore: cast_nullable_to_non_nullable
              as String?,
      solarRad: freezed == solarRad
          ? _self.solarRad
          : solarRad // ignore: cast_nullable_to_non_nullable
              as double?,
      sources: freezed == sources
          ? _self.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stateCode: freezed == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      station: freezed == station
          ? _self.station
          : station // ignore: cast_nullable_to_non_nullable
              as String?,
      sunrise: freezed == sunrise
          ? _self.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as String?,
      sunset: freezed == sunset
          ? _self.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _self.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<$Res>? get weather {
    if (_self.weather == null) {
      return null;
    }

    return $WeatherCopyWith<$Res>(_self.weather!, (value) {
      return _then(_self.copyWith(weather: value));
    });
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _WeatherInfo extends WeatherInfo {
  const _WeatherInfo(
      {this.ts,
      this.timestampLocal,
      this.timestampUtc,
      this.datetime,
      this.snow,
      this.snowDepth,
      this.precip,
      this.temp,
      this.dewpt,
      this.maxTemp,
      this.minTemp,
      this.appMaxTemp,
      this.appMinTemp,
      this.rh,
      this.clouds,
      this.weather,
      this.slp,
      this.pres,
      this.uv,
      this.maxDhi,
      this.vis,
      this.pop,
      this.moonPhase,
      this.sunriseTs,
      this.sunsetTs,
      this.moonriseTs,
      this.moonsetTs,
      this.pod,
      this.windSpd,
      this.windDir,
      this.windCdir,
      this.windCdirFull,
      this.appTemp,
      this.aqi,
      this.cityName,
      this.countryCode,
      this.dhi,
      this.dni,
      this.elevAngle,
      this.ghi,
      this.gust,
      this.hAngle,
      this.lat,
      this.lon,
      this.obTime,
      this.solarRad,
      final List<String>? sources,
      this.stateCode,
      this.station,
      this.sunrise,
      this.sunset,
      this.timezone})
      : _sources = sources,
        super._();
  factory _WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);

  @override
  final num? ts;
  @override
  final DateTime? timestampLocal;
  @override
  final DateTime? timestampUtc;
  @override
  final String? datetime;
  @override
  final num? snow;
  @override
  final int? snowDepth;
  @override
  final num? precip;
  @override
  final num? temp;
  @override
  final num? dewpt;
  @override
  final num? maxTemp;
  @override
  final num? minTemp;
  @override
  final num? appMaxTemp;
  @override
  final num? appMinTemp;
  @override
  final int? rh;
  @override
  final int? clouds;
  @override
  final Weather? weather;
  @override
  final num? slp;
  @override
  final num? pres;
  @override
  final num? uv;
  @override
  final num? maxDhi;
  @override
  final num? vis;
  @override
  final num? pop;
  @override
  final num? moonPhase;
  @override
  final int? sunriseTs;
  @override
  final int? sunsetTs;
  @override
  final int? moonriseTs;
  @override
  final int? moonsetTs;
  @override
  final String? pod;
  @override
  final num? windSpd;
  @override
  final int? windDir;
  @override
  final String? windCdir;
  @override
  final String? windCdirFull;
  @override
  final double? appTemp;
  @override
  final int? aqi;
  @override
  final String? cityName;
  @override
  final String? countryCode;
  @override
  final double? dhi;
  @override
  final double? dni;
  @override
  final double? elevAngle;
  @override
  final double? ghi;
  @override
  final double? gust;
  @override
  final double? hAngle;
  @override
  final double? lat;
  @override
  final double? lon;
  @override
  final String? obTime;
  @override
  final double? solarRad;
  final List<String>? _sources;
  @override
  List<String>? get sources {
    final value = _sources;
    if (value == null) return null;
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? stateCode;
  @override
  final String? station;
  @override
  final String? sunrise;
  @override
  final String? sunset;
  @override
  final String? timezone;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherInfoCopyWith<_WeatherInfo> get copyWith =>
      __$WeatherInfoCopyWithImpl<_WeatherInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherInfo &&
            (identical(other.ts, ts) || other.ts == ts) &&
            (identical(other.timestampLocal, timestampLocal) ||
                other.timestampLocal == timestampLocal) &&
            (identical(other.timestampUtc, timestampUtc) ||
                other.timestampUtc == timestampUtc) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.snow, snow) || other.snow == snow) &&
            (identical(other.snowDepth, snowDepth) ||
                other.snowDepth == snowDepth) &&
            (identical(other.precip, precip) || other.precip == precip) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.dewpt, dewpt) || other.dewpt == dewpt) &&
            (identical(other.maxTemp, maxTemp) || other.maxTemp == maxTemp) &&
            (identical(other.minTemp, minTemp) || other.minTemp == minTemp) &&
            (identical(other.appMaxTemp, appMaxTemp) ||
                other.appMaxTemp == appMaxTemp) &&
            (identical(other.appMinTemp, appMinTemp) ||
                other.appMinTemp == appMinTemp) &&
            (identical(other.rh, rh) || other.rh == rh) &&
            (identical(other.clouds, clouds) || other.clouds == clouds) &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.slp, slp) || other.slp == slp) &&
            (identical(other.pres, pres) || other.pres == pres) &&
            (identical(other.uv, uv) || other.uv == uv) &&
            (identical(other.maxDhi, maxDhi) || other.maxDhi == maxDhi) &&
            (identical(other.vis, vis) || other.vis == vis) &&
            (identical(other.pop, pop) || other.pop == pop) &&
            (identical(other.moonPhase, moonPhase) ||
                other.moonPhase == moonPhase) &&
            (identical(other.sunriseTs, sunriseTs) ||
                other.sunriseTs == sunriseTs) &&
            (identical(other.sunsetTs, sunsetTs) ||
                other.sunsetTs == sunsetTs) &&
            (identical(other.moonriseTs, moonriseTs) ||
                other.moonriseTs == moonriseTs) &&
            (identical(other.moonsetTs, moonsetTs) ||
                other.moonsetTs == moonsetTs) &&
            (identical(other.pod, pod) || other.pod == pod) &&
            (identical(other.windSpd, windSpd) || other.windSpd == windSpd) &&
            (identical(other.windDir, windDir) || other.windDir == windDir) &&
            (identical(other.windCdir, windCdir) ||
                other.windCdir == windCdir) &&
            (identical(other.windCdirFull, windCdirFull) ||
                other.windCdirFull == windCdirFull) &&
            (identical(other.appTemp, appTemp) || other.appTemp == appTemp) &&
            (identical(other.aqi, aqi) || other.aqi == aqi) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.dhi, dhi) || other.dhi == dhi) &&
            (identical(other.dni, dni) || other.dni == dni) &&
            (identical(other.elevAngle, elevAngle) ||
                other.elevAngle == elevAngle) &&
            (identical(other.ghi, ghi) || other.ghi == ghi) &&
            (identical(other.gust, gust) || other.gust == gust) &&
            (identical(other.hAngle, hAngle) || other.hAngle == hAngle) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.obTime, obTime) || other.obTime == obTime) &&
            (identical(other.solarRad, solarRad) ||
                other.solarRad == solarRad) &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        ts,
        timestampLocal,
        timestampUtc,
        datetime,
        snow,
        snowDepth,
        precip,
        temp,
        dewpt,
        maxTemp,
        minTemp,
        appMaxTemp,
        appMinTemp,
        rh,
        clouds,
        weather,
        slp,
        pres,
        uv,
        maxDhi,
        vis,
        pop,
        moonPhase,
        sunriseTs,
        sunsetTs,
        moonriseTs,
        moonsetTs,
        pod,
        windSpd,
        windDir,
        windCdir,
        windCdirFull,
        appTemp,
        aqi,
        cityName,
        countryCode,
        dhi,
        dni,
        elevAngle,
        ghi,
        gust,
        hAngle,
        lat,
        lon,
        obTime,
        solarRad,
        const DeepCollectionEquality().hash(_sources),
        stateCode,
        station,
        sunrise,
        sunset,
        timezone
      ]);

  @override
  String toString() {
    return 'WeatherInfo(ts: $ts, timestampLocal: $timestampLocal, timestampUtc: $timestampUtc, datetime: $datetime, snow: $snow, snowDepth: $snowDepth, precip: $precip, temp: $temp, dewpt: $dewpt, maxTemp: $maxTemp, minTemp: $minTemp, appMaxTemp: $appMaxTemp, appMinTemp: $appMinTemp, rh: $rh, clouds: $clouds, weather: $weather, slp: $slp, pres: $pres, uv: $uv, maxDhi: $maxDhi, vis: $vis, pop: $pop, moonPhase: $moonPhase, sunriseTs: $sunriseTs, sunsetTs: $sunsetTs, moonriseTs: $moonriseTs, moonsetTs: $moonsetTs, pod: $pod, windSpd: $windSpd, windDir: $windDir, windCdir: $windCdir, windCdirFull: $windCdirFull, appTemp: $appTemp, aqi: $aqi, cityName: $cityName, countryCode: $countryCode, dhi: $dhi, dni: $dni, elevAngle: $elevAngle, ghi: $ghi, gust: $gust, hAngle: $hAngle, lat: $lat, lon: $lon, obTime: $obTime, solarRad: $solarRad, sources: $sources, stateCode: $stateCode, station: $station, sunrise: $sunrise, sunset: $sunset, timezone: $timezone)';
  }
}

/// @nodoc
abstract mixin class _$WeatherInfoCopyWith<$Res>
    implements $WeatherInfoCopyWith<$Res> {
  factory _$WeatherInfoCopyWith(
          _WeatherInfo value, $Res Function(_WeatherInfo) _then) =
      __$WeatherInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {num? ts,
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
      String? timezone});

  @override
  $WeatherCopyWith<$Res>? get weather;
}

/// @nodoc
class __$WeatherInfoCopyWithImpl<$Res> implements _$WeatherInfoCopyWith<$Res> {
  __$WeatherInfoCopyWithImpl(this._self, this._then);

  final _WeatherInfo _self;
  final $Res Function(_WeatherInfo) _then;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ts = freezed,
    Object? timestampLocal = freezed,
    Object? timestampUtc = freezed,
    Object? datetime = freezed,
    Object? snow = freezed,
    Object? snowDepth = freezed,
    Object? precip = freezed,
    Object? temp = freezed,
    Object? dewpt = freezed,
    Object? maxTemp = freezed,
    Object? minTemp = freezed,
    Object? appMaxTemp = freezed,
    Object? appMinTemp = freezed,
    Object? rh = freezed,
    Object? clouds = freezed,
    Object? weather = freezed,
    Object? slp = freezed,
    Object? pres = freezed,
    Object? uv = freezed,
    Object? maxDhi = freezed,
    Object? vis = freezed,
    Object? pop = freezed,
    Object? moonPhase = freezed,
    Object? sunriseTs = freezed,
    Object? sunsetTs = freezed,
    Object? moonriseTs = freezed,
    Object? moonsetTs = freezed,
    Object? pod = freezed,
    Object? windSpd = freezed,
    Object? windDir = freezed,
    Object? windCdir = freezed,
    Object? windCdirFull = freezed,
    Object? appTemp = freezed,
    Object? aqi = freezed,
    Object? cityName = freezed,
    Object? countryCode = freezed,
    Object? dhi = freezed,
    Object? dni = freezed,
    Object? elevAngle = freezed,
    Object? ghi = freezed,
    Object? gust = freezed,
    Object? hAngle = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? obTime = freezed,
    Object? solarRad = freezed,
    Object? sources = freezed,
    Object? stateCode = freezed,
    Object? station = freezed,
    Object? sunrise = freezed,
    Object? sunset = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_WeatherInfo(
      ts: freezed == ts
          ? _self.ts
          : ts // ignore: cast_nullable_to_non_nullable
              as num?,
      timestampLocal: freezed == timestampLocal
          ? _self.timestampLocal
          : timestampLocal // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timestampUtc: freezed == timestampUtc
          ? _self.timestampUtc
          : timestampUtc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datetime: freezed == datetime
          ? _self.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      snow: freezed == snow
          ? _self.snow
          : snow // ignore: cast_nullable_to_non_nullable
              as num?,
      snowDepth: freezed == snowDepth
          ? _self.snowDepth
          : snowDepth // ignore: cast_nullable_to_non_nullable
              as int?,
      precip: freezed == precip
          ? _self.precip
          : precip // ignore: cast_nullable_to_non_nullable
              as num?,
      temp: freezed == temp
          ? _self.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as num?,
      dewpt: freezed == dewpt
          ? _self.dewpt
          : dewpt // ignore: cast_nullable_to_non_nullable
              as num?,
      maxTemp: freezed == maxTemp
          ? _self.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      minTemp: freezed == minTemp
          ? _self.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      appMaxTemp: freezed == appMaxTemp
          ? _self.appMaxTemp
          : appMaxTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      appMinTemp: freezed == appMinTemp
          ? _self.appMinTemp
          : appMinTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      rh: freezed == rh
          ? _self.rh
          : rh // ignore: cast_nullable_to_non_nullable
              as int?,
      clouds: freezed == clouds
          ? _self.clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as int?,
      weather: freezed == weather
          ? _self.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      slp: freezed == slp
          ? _self.slp
          : slp // ignore: cast_nullable_to_non_nullable
              as num?,
      pres: freezed == pres
          ? _self.pres
          : pres // ignore: cast_nullable_to_non_nullable
              as num?,
      uv: freezed == uv
          ? _self.uv
          : uv // ignore: cast_nullable_to_non_nullable
              as num?,
      maxDhi: freezed == maxDhi
          ? _self.maxDhi
          : maxDhi // ignore: cast_nullable_to_non_nullable
              as num?,
      vis: freezed == vis
          ? _self.vis
          : vis // ignore: cast_nullable_to_non_nullable
              as num?,
      pop: freezed == pop
          ? _self.pop
          : pop // ignore: cast_nullable_to_non_nullable
              as num?,
      moonPhase: freezed == moonPhase
          ? _self.moonPhase
          : moonPhase // ignore: cast_nullable_to_non_nullable
              as num?,
      sunriseTs: freezed == sunriseTs
          ? _self.sunriseTs
          : sunriseTs // ignore: cast_nullable_to_non_nullable
              as int?,
      sunsetTs: freezed == sunsetTs
          ? _self.sunsetTs
          : sunsetTs // ignore: cast_nullable_to_non_nullable
              as int?,
      moonriseTs: freezed == moonriseTs
          ? _self.moonriseTs
          : moonriseTs // ignore: cast_nullable_to_non_nullable
              as int?,
      moonsetTs: freezed == moonsetTs
          ? _self.moonsetTs
          : moonsetTs // ignore: cast_nullable_to_non_nullable
              as int?,
      pod: freezed == pod
          ? _self.pod
          : pod // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpd: freezed == windSpd
          ? _self.windSpd
          : windSpd // ignore: cast_nullable_to_non_nullable
              as num?,
      windDir: freezed == windDir
          ? _self.windDir
          : windDir // ignore: cast_nullable_to_non_nullable
              as int?,
      windCdir: freezed == windCdir
          ? _self.windCdir
          : windCdir // ignore: cast_nullable_to_non_nullable
              as String?,
      windCdirFull: freezed == windCdirFull
          ? _self.windCdirFull
          : windCdirFull // ignore: cast_nullable_to_non_nullable
              as String?,
      appTemp: freezed == appTemp
          ? _self.appTemp
          : appTemp // ignore: cast_nullable_to_non_nullable
              as double?,
      aqi: freezed == aqi
          ? _self.aqi
          : aqi // ignore: cast_nullable_to_non_nullable
              as int?,
      cityName: freezed == cityName
          ? _self.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dhi: freezed == dhi
          ? _self.dhi
          : dhi // ignore: cast_nullable_to_non_nullable
              as double?,
      dni: freezed == dni
          ? _self.dni
          : dni // ignore: cast_nullable_to_non_nullable
              as double?,
      elevAngle: freezed == elevAngle
          ? _self.elevAngle
          : elevAngle // ignore: cast_nullable_to_non_nullable
              as double?,
      ghi: freezed == ghi
          ? _self.ghi
          : ghi // ignore: cast_nullable_to_non_nullable
              as double?,
      gust: freezed == gust
          ? _self.gust
          : gust // ignore: cast_nullable_to_non_nullable
              as double?,
      hAngle: freezed == hAngle
          ? _self.hAngle
          : hAngle // ignore: cast_nullable_to_non_nullable
              as double?,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      obTime: freezed == obTime
          ? _self.obTime
          : obTime // ignore: cast_nullable_to_non_nullable
              as String?,
      solarRad: freezed == solarRad
          ? _self.solarRad
          : solarRad // ignore: cast_nullable_to_non_nullable
              as double?,
      sources: freezed == sources
          ? _self._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stateCode: freezed == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      station: freezed == station
          ? _self.station
          : station // ignore: cast_nullable_to_non_nullable
              as String?,
      sunrise: freezed == sunrise
          ? _self.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as String?,
      sunset: freezed == sunset
          ? _self.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _self.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<$Res>? get weather {
    if (_self.weather == null) {
      return null;
    }

    return $WeatherCopyWith<$Res>(_self.weather!, (value) {
      return _then(_self.copyWith(weather: value));
    });
  }
}

/// @nodoc
mixin _$Weather {
  String? get icon;
  int? get code;
  String? get description;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<Weather> get copyWith =>
      _$WeatherCopyWithImpl<Weather>(this as Weather, _$identity);

  /// Serializes this Weather to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Weather &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, icon, code, description);

  @override
  String toString() {
    return 'Weather(icon: $icon, code: $code, description: $description)';
  }
}

/// @nodoc
abstract mixin class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) _then) =
      _$WeatherCopyWithImpl;
  @useResult
  $Res call({String? icon, int? code, String? description});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res> implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._self, this._then);

  final Weather _self;
  final $Res Function(Weather) _then;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? code = freezed,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Weather implements Weather {
  const _Weather({this.icon, this.code, this.description});
  factory _Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  @override
  final String? icon;
  @override
  final int? code;
  @override
  final String? description;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherCopyWith<_Weather> get copyWith =>
      __$WeatherCopyWithImpl<_Weather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Weather &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, icon, code, description);

  @override
  String toString() {
    return 'Weather(icon: $icon, code: $code, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) _then) =
      __$WeatherCopyWithImpl;
  @override
  @useResult
  $Res call({String? icon, int? code, String? description});
}

/// @nodoc
class __$WeatherCopyWithImpl<$Res> implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(this._self, this._then);

  final _Weather _self;
  final $Res Function(_Weather) _then;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? icon = freezed,
    Object? code = freezed,
    Object? description = freezed,
  }) {
    return _then(_Weather(
      icon: freezed == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
