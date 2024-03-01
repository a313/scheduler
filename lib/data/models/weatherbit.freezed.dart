// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weatherbit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return _Forecast.fromJson(json);
}

/// @nodoc
mixin _$Forecast {
  String? get cityName => throw _privateConstructorUsedError;
  String? get stateCode => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  num? get lat => throw _privateConstructorUsedError;
  num? get lon => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  List<WeatherInfo>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastCopyWith<Forecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastCopyWith<$Res> {
  factory $ForecastCopyWith(Forecast value, $Res Function(Forecast) then) =
      _$ForecastCopyWithImpl<$Res, Forecast>;
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
class _$ForecastCopyWithImpl<$Res, $Val extends Forecast>
    implements $ForecastCopyWith<$Res> {
  _$ForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateCode: freezed == stateCode
          ? _value.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as num?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfo>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForecastImplCopyWith<$Res>
    implements $ForecastCopyWith<$Res> {
  factory _$$ForecastImplCopyWith(
          _$ForecastImpl value, $Res Function(_$ForecastImpl) then) =
      __$$ForecastImplCopyWithImpl<$Res>;
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
class __$$ForecastImplCopyWithImpl<$Res>
    extends _$ForecastCopyWithImpl<$Res, _$ForecastImpl>
    implements _$$ForecastImplCopyWith<$Res> {
  __$$ForecastImplCopyWithImpl(
      _$ForecastImpl _value, $Res Function(_$ForecastImpl) _then)
      : super(_value, _then);

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
    return _then(_$ForecastImpl(
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateCode: freezed == stateCode
          ? _value.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as num?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfo>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ForecastImpl extends _Forecast {
  const _$ForecastImpl(
      {this.cityName,
      this.stateCode,
      this.countryCode,
      this.lat,
      this.lon,
      this.timezone,
      final List<WeatherInfo>? data})
      : _data = data,
        super._();

  factory _$ForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastImplFromJson(json);

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

  @override
  String toString() {
    return 'Forecast(cityName: $cityName, stateCode: $stateCode, countryCode: $countryCode, lat: $lat, lon: $lon, timezone: $timezone, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cityName, stateCode, countryCode,
      lat, lon, timezone, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastImplCopyWith<_$ForecastImpl> get copyWith =>
      __$$ForecastImplCopyWithImpl<_$ForecastImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastImplToJson(
      this,
    );
  }
}

abstract class _Forecast extends Forecast {
  const factory _Forecast(
      {final String? cityName,
      final String? stateCode,
      final String? countryCode,
      final num? lat,
      final num? lon,
      final String? timezone,
      final List<WeatherInfo>? data}) = _$ForecastImpl;
  const _Forecast._() : super._();

  factory _Forecast.fromJson(Map<String, dynamic> json) =
      _$ForecastImpl.fromJson;

  @override
  String? get cityName;
  @override
  String? get stateCode;
  @override
  String? get countryCode;
  @override
  num? get lat;
  @override
  num? get lon;
  @override
  String? get timezone;
  @override
  List<WeatherInfo>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ForecastImplCopyWith<_$ForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) {
  return _CurrentWeather.fromJson(json);
}

/// @nodoc
mixin _$CurrentWeather {
  int? get count => throw _privateConstructorUsedError;
  List<WeatherInfo>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentWeatherCopyWith<CurrentWeather> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWeatherCopyWith<$Res> {
  factory $CurrentWeatherCopyWith(
          CurrentWeather value, $Res Function(CurrentWeather) then) =
      _$CurrentWeatherCopyWithImpl<$Res, CurrentWeather>;
  @useResult
  $Res call({int? count, List<WeatherInfo>? data});
}

/// @nodoc
class _$CurrentWeatherCopyWithImpl<$Res, $Val extends CurrentWeather>
    implements $CurrentWeatherCopyWith<$Res> {
  _$CurrentWeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfo>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentWeatherImplCopyWith<$Res>
    implements $CurrentWeatherCopyWith<$Res> {
  factory _$$CurrentWeatherImplCopyWith(_$CurrentWeatherImpl value,
          $Res Function(_$CurrentWeatherImpl) then) =
      __$$CurrentWeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? count, List<WeatherInfo>? data});
}

/// @nodoc
class __$$CurrentWeatherImplCopyWithImpl<$Res>
    extends _$CurrentWeatherCopyWithImpl<$Res, _$CurrentWeatherImpl>
    implements _$$CurrentWeatherImplCopyWith<$Res> {
  __$$CurrentWeatherImplCopyWithImpl(
      _$CurrentWeatherImpl _value, $Res Function(_$CurrentWeatherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CurrentWeatherImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WeatherInfo>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CurrentWeatherImpl implements _CurrentWeather {
  const _$CurrentWeatherImpl({this.count, final List<WeatherInfo>? data})
      : _data = data;

  factory _$CurrentWeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentWeatherImplFromJson(json);

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

  @override
  String toString() {
    return 'CurrentWeather(count: $count, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWeatherImpl &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentWeatherImplCopyWith<_$CurrentWeatherImpl> get copyWith =>
      __$$CurrentWeatherImplCopyWithImpl<_$CurrentWeatherImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentWeatherImplToJson(
      this,
    );
  }
}

abstract class _CurrentWeather implements CurrentWeather {
  const factory _CurrentWeather(
      {final int? count, final List<WeatherInfo>? data}) = _$CurrentWeatherImpl;

  factory _CurrentWeather.fromJson(Map<String, dynamic> json) =
      _$CurrentWeatherImpl.fromJson;

  @override
  int? get count;
  @override
  List<WeatherInfo>? get data;
  @override
  @JsonKey(ignore: true)
  _$$CurrentWeatherImplCopyWith<_$CurrentWeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) {
  return _WeatherInfo.fromJson(json);
}

/// @nodoc
mixin _$WeatherInfo {
  num? get ts => throw _privateConstructorUsedError;
  DateTime? get timestampLocal => throw _privateConstructorUsedError;
  DateTime? get timestampUtc => throw _privateConstructorUsedError;
  String? get datetime => throw _privateConstructorUsedError;
  num? get snow => throw _privateConstructorUsedError;
  int? get snowDepth => throw _privateConstructorUsedError;
  num? get precip => throw _privateConstructorUsedError;
  num? get temp => throw _privateConstructorUsedError;
  num? get dewpt => throw _privateConstructorUsedError;
  num? get maxTemp => throw _privateConstructorUsedError;
  num? get minTemp => throw _privateConstructorUsedError;
  num? get appMaxTemp => throw _privateConstructorUsedError;
  num? get appMinTemp => throw _privateConstructorUsedError;
  int? get rh => throw _privateConstructorUsedError;
  int? get clouds => throw _privateConstructorUsedError;
  Weather? get weather => throw _privateConstructorUsedError;
  num? get slp => throw _privateConstructorUsedError;
  num? get pres => throw _privateConstructorUsedError;
  num? get uv => throw _privateConstructorUsedError;
  num? get maxDhi => throw _privateConstructorUsedError;
  num? get vis => throw _privateConstructorUsedError;
  num? get pop => throw _privateConstructorUsedError;
  num? get moonPhase => throw _privateConstructorUsedError;
  int? get sunriseTs => throw _privateConstructorUsedError;
  int? get sunsetTs => throw _privateConstructorUsedError;
  int? get moonriseTs => throw _privateConstructorUsedError;
  int? get moonsetTs => throw _privateConstructorUsedError;
  String? get pod => throw _privateConstructorUsedError;
  num? get windSpd => throw _privateConstructorUsedError;
  int? get windDir => throw _privateConstructorUsedError;
  String? get windCdir => throw _privateConstructorUsedError;
  String? get windCdirFull => throw _privateConstructorUsedError;
  double? get appTemp => throw _privateConstructorUsedError;
  int? get aqi => throw _privateConstructorUsedError;
  String? get cityName => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  double? get dhi => throw _privateConstructorUsedError;
  double? get dni => throw _privateConstructorUsedError;
  double? get elevAngle => throw _privateConstructorUsedError;
  double? get ghi => throw _privateConstructorUsedError;
  double? get gust => throw _privateConstructorUsedError;
  double? get hAngle => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  String? get obTime => throw _privateConstructorUsedError;
  double? get solarRad => throw _privateConstructorUsedError;
  List<String>? get sources => throw _privateConstructorUsedError;
  String? get stateCode => throw _privateConstructorUsedError;
  String? get station => throw _privateConstructorUsedError;
  String? get sunrise => throw _privateConstructorUsedError;
  String? get sunset => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherInfoCopyWith<WeatherInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherInfoCopyWith<$Res> {
  factory $WeatherInfoCopyWith(
          WeatherInfo value, $Res Function(WeatherInfo) then) =
      _$WeatherInfoCopyWithImpl<$Res, WeatherInfo>;
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
class _$WeatherInfoCopyWithImpl<$Res, $Val extends WeatherInfo>
    implements $WeatherInfoCopyWith<$Res> {
  _$WeatherInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      ts: freezed == ts
          ? _value.ts
          : ts // ignore: cast_nullable_to_non_nullable
              as num?,
      timestampLocal: freezed == timestampLocal
          ? _value.timestampLocal
          : timestampLocal // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timestampUtc: freezed == timestampUtc
          ? _value.timestampUtc
          : timestampUtc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      snow: freezed == snow
          ? _value.snow
          : snow // ignore: cast_nullable_to_non_nullable
              as num?,
      snowDepth: freezed == snowDepth
          ? _value.snowDepth
          : snowDepth // ignore: cast_nullable_to_non_nullable
              as int?,
      precip: freezed == precip
          ? _value.precip
          : precip // ignore: cast_nullable_to_non_nullable
              as num?,
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as num?,
      dewpt: freezed == dewpt
          ? _value.dewpt
          : dewpt // ignore: cast_nullable_to_non_nullable
              as num?,
      maxTemp: freezed == maxTemp
          ? _value.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      minTemp: freezed == minTemp
          ? _value.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      appMaxTemp: freezed == appMaxTemp
          ? _value.appMaxTemp
          : appMaxTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      appMinTemp: freezed == appMinTemp
          ? _value.appMinTemp
          : appMinTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      rh: freezed == rh
          ? _value.rh
          : rh // ignore: cast_nullable_to_non_nullable
              as int?,
      clouds: freezed == clouds
          ? _value.clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as int?,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      slp: freezed == slp
          ? _value.slp
          : slp // ignore: cast_nullable_to_non_nullable
              as num?,
      pres: freezed == pres
          ? _value.pres
          : pres // ignore: cast_nullable_to_non_nullable
              as num?,
      uv: freezed == uv
          ? _value.uv
          : uv // ignore: cast_nullable_to_non_nullable
              as num?,
      maxDhi: freezed == maxDhi
          ? _value.maxDhi
          : maxDhi // ignore: cast_nullable_to_non_nullable
              as num?,
      vis: freezed == vis
          ? _value.vis
          : vis // ignore: cast_nullable_to_non_nullable
              as num?,
      pop: freezed == pop
          ? _value.pop
          : pop // ignore: cast_nullable_to_non_nullable
              as num?,
      moonPhase: freezed == moonPhase
          ? _value.moonPhase
          : moonPhase // ignore: cast_nullable_to_non_nullable
              as num?,
      sunriseTs: freezed == sunriseTs
          ? _value.sunriseTs
          : sunriseTs // ignore: cast_nullable_to_non_nullable
              as int?,
      sunsetTs: freezed == sunsetTs
          ? _value.sunsetTs
          : sunsetTs // ignore: cast_nullable_to_non_nullable
              as int?,
      moonriseTs: freezed == moonriseTs
          ? _value.moonriseTs
          : moonriseTs // ignore: cast_nullable_to_non_nullable
              as int?,
      moonsetTs: freezed == moonsetTs
          ? _value.moonsetTs
          : moonsetTs // ignore: cast_nullable_to_non_nullable
              as int?,
      pod: freezed == pod
          ? _value.pod
          : pod // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpd: freezed == windSpd
          ? _value.windSpd
          : windSpd // ignore: cast_nullable_to_non_nullable
              as num?,
      windDir: freezed == windDir
          ? _value.windDir
          : windDir // ignore: cast_nullable_to_non_nullable
              as int?,
      windCdir: freezed == windCdir
          ? _value.windCdir
          : windCdir // ignore: cast_nullable_to_non_nullable
              as String?,
      windCdirFull: freezed == windCdirFull
          ? _value.windCdirFull
          : windCdirFull // ignore: cast_nullable_to_non_nullable
              as String?,
      appTemp: freezed == appTemp
          ? _value.appTemp
          : appTemp // ignore: cast_nullable_to_non_nullable
              as double?,
      aqi: freezed == aqi
          ? _value.aqi
          : aqi // ignore: cast_nullable_to_non_nullable
              as int?,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dhi: freezed == dhi
          ? _value.dhi
          : dhi // ignore: cast_nullable_to_non_nullable
              as double?,
      dni: freezed == dni
          ? _value.dni
          : dni // ignore: cast_nullable_to_non_nullable
              as double?,
      elevAngle: freezed == elevAngle
          ? _value.elevAngle
          : elevAngle // ignore: cast_nullable_to_non_nullable
              as double?,
      ghi: freezed == ghi
          ? _value.ghi
          : ghi // ignore: cast_nullable_to_non_nullable
              as double?,
      gust: freezed == gust
          ? _value.gust
          : gust // ignore: cast_nullable_to_non_nullable
              as double?,
      hAngle: freezed == hAngle
          ? _value.hAngle
          : hAngle // ignore: cast_nullable_to_non_nullable
              as double?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      obTime: freezed == obTime
          ? _value.obTime
          : obTime // ignore: cast_nullable_to_non_nullable
              as String?,
      solarRad: freezed == solarRad
          ? _value.solarRad
          : solarRad // ignore: cast_nullable_to_non_nullable
              as double?,
      sources: freezed == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stateCode: freezed == stateCode
          ? _value.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      station: freezed == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as String?,
      sunrise: freezed == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as String?,
      sunset: freezed == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<$Res>? get weather {
    if (_value.weather == null) {
      return null;
    }

    return $WeatherCopyWith<$Res>(_value.weather!, (value) {
      return _then(_value.copyWith(weather: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherInfoImplCopyWith<$Res>
    implements $WeatherInfoCopyWith<$Res> {
  factory _$$WeatherInfoImplCopyWith(
          _$WeatherInfoImpl value, $Res Function(_$WeatherInfoImpl) then) =
      __$$WeatherInfoImplCopyWithImpl<$Res>;
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
class __$$WeatherInfoImplCopyWithImpl<$Res>
    extends _$WeatherInfoCopyWithImpl<$Res, _$WeatherInfoImpl>
    implements _$$WeatherInfoImplCopyWith<$Res> {
  __$$WeatherInfoImplCopyWithImpl(
      _$WeatherInfoImpl _value, $Res Function(_$WeatherInfoImpl) _then)
      : super(_value, _then);

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
    return _then(_$WeatherInfoImpl(
      ts: freezed == ts
          ? _value.ts
          : ts // ignore: cast_nullable_to_non_nullable
              as num?,
      timestampLocal: freezed == timestampLocal
          ? _value.timestampLocal
          : timestampLocal // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timestampUtc: freezed == timestampUtc
          ? _value.timestampUtc
          : timestampUtc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      snow: freezed == snow
          ? _value.snow
          : snow // ignore: cast_nullable_to_non_nullable
              as num?,
      snowDepth: freezed == snowDepth
          ? _value.snowDepth
          : snowDepth // ignore: cast_nullable_to_non_nullable
              as int?,
      precip: freezed == precip
          ? _value.precip
          : precip // ignore: cast_nullable_to_non_nullable
              as num?,
      temp: freezed == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as num?,
      dewpt: freezed == dewpt
          ? _value.dewpt
          : dewpt // ignore: cast_nullable_to_non_nullable
              as num?,
      maxTemp: freezed == maxTemp
          ? _value.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      minTemp: freezed == minTemp
          ? _value.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      appMaxTemp: freezed == appMaxTemp
          ? _value.appMaxTemp
          : appMaxTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      appMinTemp: freezed == appMinTemp
          ? _value.appMinTemp
          : appMinTemp // ignore: cast_nullable_to_non_nullable
              as num?,
      rh: freezed == rh
          ? _value.rh
          : rh // ignore: cast_nullable_to_non_nullable
              as int?,
      clouds: freezed == clouds
          ? _value.clouds
          : clouds // ignore: cast_nullable_to_non_nullable
              as int?,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      slp: freezed == slp
          ? _value.slp
          : slp // ignore: cast_nullable_to_non_nullable
              as num?,
      pres: freezed == pres
          ? _value.pres
          : pres // ignore: cast_nullable_to_non_nullable
              as num?,
      uv: freezed == uv
          ? _value.uv
          : uv // ignore: cast_nullable_to_non_nullable
              as num?,
      maxDhi: freezed == maxDhi
          ? _value.maxDhi
          : maxDhi // ignore: cast_nullable_to_non_nullable
              as num?,
      vis: freezed == vis
          ? _value.vis
          : vis // ignore: cast_nullable_to_non_nullable
              as num?,
      pop: freezed == pop
          ? _value.pop
          : pop // ignore: cast_nullable_to_non_nullable
              as num?,
      moonPhase: freezed == moonPhase
          ? _value.moonPhase
          : moonPhase // ignore: cast_nullable_to_non_nullable
              as num?,
      sunriseTs: freezed == sunriseTs
          ? _value.sunriseTs
          : sunriseTs // ignore: cast_nullable_to_non_nullable
              as int?,
      sunsetTs: freezed == sunsetTs
          ? _value.sunsetTs
          : sunsetTs // ignore: cast_nullable_to_non_nullable
              as int?,
      moonriseTs: freezed == moonriseTs
          ? _value.moonriseTs
          : moonriseTs // ignore: cast_nullable_to_non_nullable
              as int?,
      moonsetTs: freezed == moonsetTs
          ? _value.moonsetTs
          : moonsetTs // ignore: cast_nullable_to_non_nullable
              as int?,
      pod: freezed == pod
          ? _value.pod
          : pod // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpd: freezed == windSpd
          ? _value.windSpd
          : windSpd // ignore: cast_nullable_to_non_nullable
              as num?,
      windDir: freezed == windDir
          ? _value.windDir
          : windDir // ignore: cast_nullable_to_non_nullable
              as int?,
      windCdir: freezed == windCdir
          ? _value.windCdir
          : windCdir // ignore: cast_nullable_to_non_nullable
              as String?,
      windCdirFull: freezed == windCdirFull
          ? _value.windCdirFull
          : windCdirFull // ignore: cast_nullable_to_non_nullable
              as String?,
      appTemp: freezed == appTemp
          ? _value.appTemp
          : appTemp // ignore: cast_nullable_to_non_nullable
              as double?,
      aqi: freezed == aqi
          ? _value.aqi
          : aqi // ignore: cast_nullable_to_non_nullable
              as int?,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dhi: freezed == dhi
          ? _value.dhi
          : dhi // ignore: cast_nullable_to_non_nullable
              as double?,
      dni: freezed == dni
          ? _value.dni
          : dni // ignore: cast_nullable_to_non_nullable
              as double?,
      elevAngle: freezed == elevAngle
          ? _value.elevAngle
          : elevAngle // ignore: cast_nullable_to_non_nullable
              as double?,
      ghi: freezed == ghi
          ? _value.ghi
          : ghi // ignore: cast_nullable_to_non_nullable
              as double?,
      gust: freezed == gust
          ? _value.gust
          : gust // ignore: cast_nullable_to_non_nullable
              as double?,
      hAngle: freezed == hAngle
          ? _value.hAngle
          : hAngle // ignore: cast_nullable_to_non_nullable
              as double?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
      obTime: freezed == obTime
          ? _value.obTime
          : obTime // ignore: cast_nullable_to_non_nullable
              as String?,
      solarRad: freezed == solarRad
          ? _value.solarRad
          : solarRad // ignore: cast_nullable_to_non_nullable
              as double?,
      sources: freezed == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      stateCode: freezed == stateCode
          ? _value.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      station: freezed == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as String?,
      sunrise: freezed == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as String?,
      sunset: freezed == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as String?,
      timezone: freezed == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WeatherInfoImpl extends _WeatherInfo {
  const _$WeatherInfoImpl(
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

  factory _$WeatherInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherInfoImplFromJson(json);

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

  @override
  String toString() {
    return 'WeatherInfo(ts: $ts, timestampLocal: $timestampLocal, timestampUtc: $timestampUtc, datetime: $datetime, snow: $snow, snowDepth: $snowDepth, precip: $precip, temp: $temp, dewpt: $dewpt, maxTemp: $maxTemp, minTemp: $minTemp, appMaxTemp: $appMaxTemp, appMinTemp: $appMinTemp, rh: $rh, clouds: $clouds, weather: $weather, slp: $slp, pres: $pres, uv: $uv, maxDhi: $maxDhi, vis: $vis, pop: $pop, moonPhase: $moonPhase, sunriseTs: $sunriseTs, sunsetTs: $sunsetTs, moonriseTs: $moonriseTs, moonsetTs: $moonsetTs, pod: $pod, windSpd: $windSpd, windDir: $windDir, windCdir: $windCdir, windCdirFull: $windCdirFull, appTemp: $appTemp, aqi: $aqi, cityName: $cityName, countryCode: $countryCode, dhi: $dhi, dni: $dni, elevAngle: $elevAngle, ghi: $ghi, gust: $gust, hAngle: $hAngle, lat: $lat, lon: $lon, obTime: $obTime, solarRad: $solarRad, sources: $sources, stateCode: $stateCode, station: $station, sunrise: $sunrise, sunset: $sunset, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherInfoImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherInfoImplCopyWith<_$WeatherInfoImpl> get copyWith =>
      __$$WeatherInfoImplCopyWithImpl<_$WeatherInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherInfoImplToJson(
      this,
    );
  }
}

abstract class _WeatherInfo extends WeatherInfo {
  const factory _WeatherInfo(
      {final num? ts,
      final DateTime? timestampLocal,
      final DateTime? timestampUtc,
      final String? datetime,
      final num? snow,
      final int? snowDepth,
      final num? precip,
      final num? temp,
      final num? dewpt,
      final num? maxTemp,
      final num? minTemp,
      final num? appMaxTemp,
      final num? appMinTemp,
      final int? rh,
      final int? clouds,
      final Weather? weather,
      final num? slp,
      final num? pres,
      final num? uv,
      final num? maxDhi,
      final num? vis,
      final num? pop,
      final num? moonPhase,
      final int? sunriseTs,
      final int? sunsetTs,
      final int? moonriseTs,
      final int? moonsetTs,
      final String? pod,
      final num? windSpd,
      final int? windDir,
      final String? windCdir,
      final String? windCdirFull,
      final double? appTemp,
      final int? aqi,
      final String? cityName,
      final String? countryCode,
      final double? dhi,
      final double? dni,
      final double? elevAngle,
      final double? ghi,
      final double? gust,
      final double? hAngle,
      final double? lat,
      final double? lon,
      final String? obTime,
      final double? solarRad,
      final List<String>? sources,
      final String? stateCode,
      final String? station,
      final String? sunrise,
      final String? sunset,
      final String? timezone}) = _$WeatherInfoImpl;
  const _WeatherInfo._() : super._();

  factory _WeatherInfo.fromJson(Map<String, dynamic> json) =
      _$WeatherInfoImpl.fromJson;

  @override
  num? get ts;
  @override
  DateTime? get timestampLocal;
  @override
  DateTime? get timestampUtc;
  @override
  String? get datetime;
  @override
  num? get snow;
  @override
  int? get snowDepth;
  @override
  num? get precip;
  @override
  num? get temp;
  @override
  num? get dewpt;
  @override
  num? get maxTemp;
  @override
  num? get minTemp;
  @override
  num? get appMaxTemp;
  @override
  num? get appMinTemp;
  @override
  int? get rh;
  @override
  int? get clouds;
  @override
  Weather? get weather;
  @override
  num? get slp;
  @override
  num? get pres;
  @override
  num? get uv;
  @override
  num? get maxDhi;
  @override
  num? get vis;
  @override
  num? get pop;
  @override
  num? get moonPhase;
  @override
  int? get sunriseTs;
  @override
  int? get sunsetTs;
  @override
  int? get moonriseTs;
  @override
  int? get moonsetTs;
  @override
  String? get pod;
  @override
  num? get windSpd;
  @override
  int? get windDir;
  @override
  String? get windCdir;
  @override
  String? get windCdirFull;
  @override
  double? get appTemp;
  @override
  int? get aqi;
  @override
  String? get cityName;
  @override
  String? get countryCode;
  @override
  double? get dhi;
  @override
  double? get dni;
  @override
  double? get elevAngle;
  @override
  double? get ghi;
  @override
  double? get gust;
  @override
  double? get hAngle;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  String? get obTime;
  @override
  double? get solarRad;
  @override
  List<String>? get sources;
  @override
  String? get stateCode;
  @override
  String? get station;
  @override
  String? get sunrise;
  @override
  String? get sunset;
  @override
  String? get timezone;
  @override
  @JsonKey(ignore: true)
  _$$WeatherInfoImplCopyWith<_$WeatherInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
mixin _$Weather {
  String? get icon => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call({String? icon, int? code, String? description});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res, $Val extends Weather>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? code = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherImplCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$WeatherImplCopyWith(
          _$WeatherImpl value, $Res Function(_$WeatherImpl) then) =
      __$$WeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? icon, int? code, String? description});
}

/// @nodoc
class __$$WeatherImplCopyWithImpl<$Res>
    extends _$WeatherCopyWithImpl<$Res, _$WeatherImpl>
    implements _$$WeatherImplCopyWith<$Res> {
  __$$WeatherImplCopyWithImpl(
      _$WeatherImpl _value, $Res Function(_$WeatherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? code = freezed,
    Object? description = freezed,
  }) {
    return _then(_$WeatherImpl(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WeatherImpl implements _Weather {
  const _$WeatherImpl({this.icon, this.code, this.description});

  factory _$WeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherImplFromJson(json);

  @override
  final String? icon;
  @override
  final int? code;
  @override
  final String? description;

  @override
  String toString() {
    return 'Weather(icon: $icon, code: $code, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, icon, code, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      __$$WeatherImplCopyWithImpl<_$WeatherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherImplToJson(
      this,
    );
  }
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {final String? icon,
      final int? code,
      final String? description}) = _$WeatherImpl;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$WeatherImpl.fromJson;

  @override
  String? get icon;
  @override
  int? get code;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
