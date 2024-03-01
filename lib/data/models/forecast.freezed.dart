// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast.dart';

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
  List<Item>? get items => throw _privateConstructorUsedError;
  DateTime? get forecastDate => throw _privateConstructorUsedError;
  DateTime? get nextUpdate => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get point => throw _privateConstructorUsedError;
  String? get fingerprint => throw _privateConstructorUsedError;

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
      {List<Item>? items,
      DateTime? forecastDate,
      DateTime? nextUpdate,
      String? source,
      String? point,
      String? fingerprint});
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
    Object? items = freezed,
    Object? forecastDate = freezed,
    Object? nextUpdate = freezed,
    Object? source = freezed,
    Object? point = freezed,
    Object? fingerprint = freezed,
  }) {
    return _then(_value.copyWith(
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
      forecastDate: freezed == forecastDate
          ? _value.forecastDate
          : forecastDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextUpdate: freezed == nextUpdate
          ? _value.nextUpdate
          : nextUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as String?,
      fingerprint: freezed == fingerprint
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {List<Item>? items,
      DateTime? forecastDate,
      DateTime? nextUpdate,
      String? source,
      String? point,
      String? fingerprint});
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
    Object? items = freezed,
    Object? forecastDate = freezed,
    Object? nextUpdate = freezed,
    Object? source = freezed,
    Object? point = freezed,
    Object? fingerprint = freezed,
  }) {
    return _then(_$ForecastImpl(
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
      forecastDate: freezed == forecastDate
          ? _value.forecastDate
          : forecastDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextUpdate: freezed == nextUpdate
          ? _value.nextUpdate
          : nextUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as String?,
      fingerprint: freezed == fingerprint
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForecastImpl implements _Forecast {
  const _$ForecastImpl(
      {final List<Item>? items,
      this.forecastDate,
      this.nextUpdate,
      this.source,
      this.point,
      this.fingerprint})
      : _items = items;

  factory _$ForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastImplFromJson(json);

  final List<Item>? _items;
  @override
  List<Item>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? forecastDate;
  @override
  final DateTime? nextUpdate;
  @override
  final String? source;
  @override
  final String? point;
  @override
  final String? fingerprint;

  @override
  String toString() {
    return 'Forecast(items: $items, forecastDate: $forecastDate, nextUpdate: $nextUpdate, source: $source, point: $point, fingerprint: $fingerprint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.forecastDate, forecastDate) ||
                other.forecastDate == forecastDate) &&
            (identical(other.nextUpdate, nextUpdate) ||
                other.nextUpdate == nextUpdate) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.fingerprint, fingerprint) ||
                other.fingerprint == fingerprint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      forecastDate,
      nextUpdate,
      source,
      point,
      fingerprint);

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

abstract class _Forecast implements Forecast {
  const factory _Forecast(
      {final List<Item>? items,
      final DateTime? forecastDate,
      final DateTime? nextUpdate,
      final String? source,
      final String? point,
      final String? fingerprint}) = _$ForecastImpl;

  factory _Forecast.fromJson(Map<String, dynamic> json) =
      _$ForecastImpl.fromJson;

  @override
  List<Item>? get items;
  @override
  DateTime? get forecastDate;
  @override
  DateTime? get nextUpdate;
  @override
  String? get source;
  @override
  String? get point;
  @override
  String? get fingerprint;
  @override
  @JsonKey(ignore: true)
  _$$ForecastImplCopyWith<_$ForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  DateTime? get date => throw _privateConstructorUsedError;
  DateTime? get dateWithTimezone => throw _privateConstructorUsedError;
  int? get freshSnow => throw _privateConstructorUsedError;
  dynamic get snowHeight => throw _privateConstructorUsedError;
  Weather? get weather => throw _privateConstructorUsedError;
  Prec? get prec => throw _privateConstructorUsedError;
  int? get sunHours => throw _privateConstructorUsedError;
  dynamic get rainHours => throw _privateConstructorUsedError;
  SnowLine? get temperature => throw _privateConstructorUsedError;
  Wind? get wind => throw _privateConstructorUsedError;
  SnowLine? get windchill => throw _privateConstructorUsedError;
  SnowLine? get snowLine => throw _privateConstructorUsedError;
  Astronomy? get astronomy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {DateTime? date,
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
      Astronomy? astronomy});

  $WeatherCopyWith<$Res>? get weather;
  $PrecCopyWith<$Res>? get prec;
  $SnowLineCopyWith<$Res>? get temperature;
  $WindCopyWith<$Res>? get wind;
  $SnowLineCopyWith<$Res>? get windchill;
  $SnowLineCopyWith<$Res>? get snowLine;
  $AstronomyCopyWith<$Res>? get astronomy;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? dateWithTimezone = freezed,
    Object? freshSnow = freezed,
    Object? snowHeight = freezed,
    Object? weather = freezed,
    Object? prec = freezed,
    Object? sunHours = freezed,
    Object? rainHours = freezed,
    Object? temperature = freezed,
    Object? wind = freezed,
    Object? windchill = freezed,
    Object? snowLine = freezed,
    Object? astronomy = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateWithTimezone: freezed == dateWithTimezone
          ? _value.dateWithTimezone
          : dateWithTimezone // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      freshSnow: freezed == freshSnow
          ? _value.freshSnow
          : freshSnow // ignore: cast_nullable_to_non_nullable
              as int?,
      snowHeight: freezed == snowHeight
          ? _value.snowHeight
          : snowHeight // ignore: cast_nullable_to_non_nullable
              as dynamic,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      prec: freezed == prec
          ? _value.prec
          : prec // ignore: cast_nullable_to_non_nullable
              as Prec?,
      sunHours: freezed == sunHours
          ? _value.sunHours
          : sunHours // ignore: cast_nullable_to_non_nullable
              as int?,
      rainHours: freezed == rainHours
          ? _value.rainHours
          : rainHours // ignore: cast_nullable_to_non_nullable
              as dynamic,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as SnowLine?,
      wind: freezed == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as Wind?,
      windchill: freezed == windchill
          ? _value.windchill
          : windchill // ignore: cast_nullable_to_non_nullable
              as SnowLine?,
      snowLine: freezed == snowLine
          ? _value.snowLine
          : snowLine // ignore: cast_nullable_to_non_nullable
              as SnowLine?,
      astronomy: freezed == astronomy
          ? _value.astronomy
          : astronomy // ignore: cast_nullable_to_non_nullable
              as Astronomy?,
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

  @override
  @pragma('vm:prefer-inline')
  $PrecCopyWith<$Res>? get prec {
    if (_value.prec == null) {
      return null;
    }

    return $PrecCopyWith<$Res>(_value.prec!, (value) {
      return _then(_value.copyWith(prec: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SnowLineCopyWith<$Res>? get temperature {
    if (_value.temperature == null) {
      return null;
    }

    return $SnowLineCopyWith<$Res>(_value.temperature!, (value) {
      return _then(_value.copyWith(temperature: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WindCopyWith<$Res>? get wind {
    if (_value.wind == null) {
      return null;
    }

    return $WindCopyWith<$Res>(_value.wind!, (value) {
      return _then(_value.copyWith(wind: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SnowLineCopyWith<$Res>? get windchill {
    if (_value.windchill == null) {
      return null;
    }

    return $SnowLineCopyWith<$Res>(_value.windchill!, (value) {
      return _then(_value.copyWith(windchill: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SnowLineCopyWith<$Res>? get snowLine {
    if (_value.snowLine == null) {
      return null;
    }

    return $SnowLineCopyWith<$Res>(_value.snowLine!, (value) {
      return _then(_value.copyWith(snowLine: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AstronomyCopyWith<$Res>? get astronomy {
    if (_value.astronomy == null) {
      return null;
    }

    return $AstronomyCopyWith<$Res>(_value.astronomy!, (value) {
      return _then(_value.copyWith(astronomy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? date,
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
      Astronomy? astronomy});

  @override
  $WeatherCopyWith<$Res>? get weather;
  @override
  $PrecCopyWith<$Res>? get prec;
  @override
  $SnowLineCopyWith<$Res>? get temperature;
  @override
  $WindCopyWith<$Res>? get wind;
  @override
  $SnowLineCopyWith<$Res>? get windchill;
  @override
  $SnowLineCopyWith<$Res>? get snowLine;
  @override
  $AstronomyCopyWith<$Res>? get astronomy;
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$ItemCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? dateWithTimezone = freezed,
    Object? freshSnow = freezed,
    Object? snowHeight = freezed,
    Object? weather = freezed,
    Object? prec = freezed,
    Object? sunHours = freezed,
    Object? rainHours = freezed,
    Object? temperature = freezed,
    Object? wind = freezed,
    Object? windchill = freezed,
    Object? snowLine = freezed,
    Object? astronomy = freezed,
  }) {
    return _then(_$ItemImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateWithTimezone: freezed == dateWithTimezone
          ? _value.dateWithTimezone
          : dateWithTimezone // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      freshSnow: freezed == freshSnow
          ? _value.freshSnow
          : freshSnow // ignore: cast_nullable_to_non_nullable
              as int?,
      snowHeight: freezed == snowHeight
          ? _value.snowHeight
          : snowHeight // ignore: cast_nullable_to_non_nullable
              as dynamic,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
      prec: freezed == prec
          ? _value.prec
          : prec // ignore: cast_nullable_to_non_nullable
              as Prec?,
      sunHours: freezed == sunHours
          ? _value.sunHours
          : sunHours // ignore: cast_nullable_to_non_nullable
              as int?,
      rainHours: freezed == rainHours
          ? _value.rainHours
          : rainHours // ignore: cast_nullable_to_non_nullable
              as dynamic,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as SnowLine?,
      wind: freezed == wind
          ? _value.wind
          : wind // ignore: cast_nullable_to_non_nullable
              as Wind?,
      windchill: freezed == windchill
          ? _value.windchill
          : windchill // ignore: cast_nullable_to_non_nullable
              as SnowLine?,
      snowLine: freezed == snowLine
          ? _value.snowLine
          : snowLine // ignore: cast_nullable_to_non_nullable
              as SnowLine?,
      astronomy: freezed == astronomy
          ? _value.astronomy
          : astronomy // ignore: cast_nullable_to_non_nullable
              as Astronomy?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl implements _Item {
  const _$ItemImpl(
      {this.date,
      this.dateWithTimezone,
      this.freshSnow,
      this.snowHeight,
      this.weather,
      this.prec,
      this.sunHours,
      this.rainHours,
      this.temperature,
      this.wind,
      this.windchill,
      this.snowLine,
      this.astronomy});

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @override
  final DateTime? date;
  @override
  final DateTime? dateWithTimezone;
  @override
  final int? freshSnow;
  @override
  final dynamic snowHeight;
  @override
  final Weather? weather;
  @override
  final Prec? prec;
  @override
  final int? sunHours;
  @override
  final dynamic rainHours;
  @override
  final SnowLine? temperature;
  @override
  final Wind? wind;
  @override
  final SnowLine? windchill;
  @override
  final SnowLine? snowLine;
  @override
  final Astronomy? astronomy;

  @override
  String toString() {
    return 'Item(date: $date, dateWithTimezone: $dateWithTimezone, freshSnow: $freshSnow, snowHeight: $snowHeight, weather: $weather, prec: $prec, sunHours: $sunHours, rainHours: $rainHours, temperature: $temperature, wind: $wind, windchill: $windchill, snowLine: $snowLine, astronomy: $astronomy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dateWithTimezone, dateWithTimezone) ||
                other.dateWithTimezone == dateWithTimezone) &&
            (identical(other.freshSnow, freshSnow) ||
                other.freshSnow == freshSnow) &&
            const DeepCollectionEquality()
                .equals(other.snowHeight, snowHeight) &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.prec, prec) || other.prec == prec) &&
            (identical(other.sunHours, sunHours) ||
                other.sunHours == sunHours) &&
            const DeepCollectionEquality().equals(other.rainHours, rainHours) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.wind, wind) || other.wind == wind) &&
            (identical(other.windchill, windchill) ||
                other.windchill == windchill) &&
            (identical(other.snowLine, snowLine) ||
                other.snowLine == snowLine) &&
            (identical(other.astronomy, astronomy) ||
                other.astronomy == astronomy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      dateWithTimezone,
      freshSnow,
      const DeepCollectionEquality().hash(snowHeight),
      weather,
      prec,
      sunHours,
      const DeepCollectionEquality().hash(rainHours),
      temperature,
      wind,
      windchill,
      snowLine,
      astronomy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      __$$ItemImplCopyWithImpl<_$ItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {final DateTime? date,
      final DateTime? dateWithTimezone,
      final int? freshSnow,
      final dynamic snowHeight,
      final Weather? weather,
      final Prec? prec,
      final int? sunHours,
      final dynamic rainHours,
      final SnowLine? temperature,
      final Wind? wind,
      final SnowLine? windchill,
      final SnowLine? snowLine,
      final Astronomy? astronomy}) = _$ItemImpl;

  factory _Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;

  @override
  DateTime? get date;
  @override
  DateTime? get dateWithTimezone;
  @override
  int? get freshSnow;
  @override
  dynamic get snowHeight;
  @override
  Weather? get weather;
  @override
  Prec? get prec;
  @override
  int? get sunHours;
  @override
  dynamic get rainHours;
  @override
  SnowLine? get temperature;
  @override
  Wind? get wind;
  @override
  SnowLine? get windchill;
  @override
  SnowLine? get snowLine;
  @override
  Astronomy? get astronomy;
  @override
  @JsonKey(ignore: true)
  _$$ItemImplCopyWith<_$ItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Astronomy _$AstronomyFromJson(Map<String, dynamic> json) {
  return _Astronomy.fromJson(json);
}

/// @nodoc
mixin _$Astronomy {
  DateTime? get dawn => throw _privateConstructorUsedError;
  DateTime? get sunrise => throw _privateConstructorUsedError;
  DateTime? get suntransit => throw _privateConstructorUsedError;
  DateTime? get sunset => throw _privateConstructorUsedError;
  DateTime? get dusk => throw _privateConstructorUsedError;
  DateTime? get moonrise => throw _privateConstructorUsedError;
  DateTime? get moontransit => throw _privateConstructorUsedError;
  DateTime? get moonset => throw _privateConstructorUsedError;
  double? get moonphase => throw _privateConstructorUsedError;
  double? get moonzodiac => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AstronomyCopyWith<Astronomy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AstronomyCopyWith<$Res> {
  factory $AstronomyCopyWith(Astronomy value, $Res Function(Astronomy) then) =
      _$AstronomyCopyWithImpl<$Res, Astronomy>;
  @useResult
  $Res call(
      {DateTime? dawn,
      DateTime? sunrise,
      DateTime? suntransit,
      DateTime? sunset,
      DateTime? dusk,
      DateTime? moonrise,
      DateTime? moontransit,
      DateTime? moonset,
      double? moonphase,
      double? moonzodiac});
}

/// @nodoc
class _$AstronomyCopyWithImpl<$Res, $Val extends Astronomy>
    implements $AstronomyCopyWith<$Res> {
  _$AstronomyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dawn = freezed,
    Object? sunrise = freezed,
    Object? suntransit = freezed,
    Object? sunset = freezed,
    Object? dusk = freezed,
    Object? moonrise = freezed,
    Object? moontransit = freezed,
    Object? moonset = freezed,
    Object? moonphase = freezed,
    Object? moonzodiac = freezed,
  }) {
    return _then(_value.copyWith(
      dawn: freezed == dawn
          ? _value.dawn
          : dawn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sunrise: freezed == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suntransit: freezed == suntransit
          ? _value.suntransit
          : suntransit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sunset: freezed == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dusk: freezed == dusk
          ? _value.dusk
          : dusk // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      moonrise: freezed == moonrise
          ? _value.moonrise
          : moonrise // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      moontransit: freezed == moontransit
          ? _value.moontransit
          : moontransit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      moonset: freezed == moonset
          ? _value.moonset
          : moonset // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      moonphase: freezed == moonphase
          ? _value.moonphase
          : moonphase // ignore: cast_nullable_to_non_nullable
              as double?,
      moonzodiac: freezed == moonzodiac
          ? _value.moonzodiac
          : moonzodiac // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AstronomyImplCopyWith<$Res>
    implements $AstronomyCopyWith<$Res> {
  factory _$$AstronomyImplCopyWith(
          _$AstronomyImpl value, $Res Function(_$AstronomyImpl) then) =
      __$$AstronomyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? dawn,
      DateTime? sunrise,
      DateTime? suntransit,
      DateTime? sunset,
      DateTime? dusk,
      DateTime? moonrise,
      DateTime? moontransit,
      DateTime? moonset,
      double? moonphase,
      double? moonzodiac});
}

/// @nodoc
class __$$AstronomyImplCopyWithImpl<$Res>
    extends _$AstronomyCopyWithImpl<$Res, _$AstronomyImpl>
    implements _$$AstronomyImplCopyWith<$Res> {
  __$$AstronomyImplCopyWithImpl(
      _$AstronomyImpl _value, $Res Function(_$AstronomyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dawn = freezed,
    Object? sunrise = freezed,
    Object? suntransit = freezed,
    Object? sunset = freezed,
    Object? dusk = freezed,
    Object? moonrise = freezed,
    Object? moontransit = freezed,
    Object? moonset = freezed,
    Object? moonphase = freezed,
    Object? moonzodiac = freezed,
  }) {
    return _then(_$AstronomyImpl(
      dawn: freezed == dawn
          ? _value.dawn
          : dawn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sunrise: freezed == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      suntransit: freezed == suntransit
          ? _value.suntransit
          : suntransit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sunset: freezed == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dusk: freezed == dusk
          ? _value.dusk
          : dusk // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      moonrise: freezed == moonrise
          ? _value.moonrise
          : moonrise // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      moontransit: freezed == moontransit
          ? _value.moontransit
          : moontransit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      moonset: freezed == moonset
          ? _value.moonset
          : moonset // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      moonphase: freezed == moonphase
          ? _value.moonphase
          : moonphase // ignore: cast_nullable_to_non_nullable
              as double?,
      moonzodiac: freezed == moonzodiac
          ? _value.moonzodiac
          : moonzodiac // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AstronomyImpl implements _Astronomy {
  const _$AstronomyImpl(
      {this.dawn,
      this.sunrise,
      this.suntransit,
      this.sunset,
      this.dusk,
      this.moonrise,
      this.moontransit,
      this.moonset,
      this.moonphase,
      this.moonzodiac});

  factory _$AstronomyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AstronomyImplFromJson(json);

  @override
  final DateTime? dawn;
  @override
  final DateTime? sunrise;
  @override
  final DateTime? suntransit;
  @override
  final DateTime? sunset;
  @override
  final DateTime? dusk;
  @override
  final DateTime? moonrise;
  @override
  final DateTime? moontransit;
  @override
  final DateTime? moonset;
  @override
  final double? moonphase;
  @override
  final double? moonzodiac;

  @override
  String toString() {
    return 'Astronomy(dawn: $dawn, sunrise: $sunrise, suntransit: $suntransit, sunset: $sunset, dusk: $dusk, moonrise: $moonrise, moontransit: $moontransit, moonset: $moonset, moonphase: $moonphase, moonzodiac: $moonzodiac)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AstronomyImpl &&
            (identical(other.dawn, dawn) || other.dawn == dawn) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.suntransit, suntransit) ||
                other.suntransit == suntransit) &&
            (identical(other.sunset, sunset) || other.sunset == sunset) &&
            (identical(other.dusk, dusk) || other.dusk == dusk) &&
            (identical(other.moonrise, moonrise) ||
                other.moonrise == moonrise) &&
            (identical(other.moontransit, moontransit) ||
                other.moontransit == moontransit) &&
            (identical(other.moonset, moonset) || other.moonset == moonset) &&
            (identical(other.moonphase, moonphase) ||
                other.moonphase == moonphase) &&
            (identical(other.moonzodiac, moonzodiac) ||
                other.moonzodiac == moonzodiac));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dawn, sunrise, suntransit,
      sunset, dusk, moonrise, moontransit, moonset, moonphase, moonzodiac);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AstronomyImplCopyWith<_$AstronomyImpl> get copyWith =>
      __$$AstronomyImplCopyWithImpl<_$AstronomyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AstronomyImplToJson(
      this,
    );
  }
}

abstract class _Astronomy implements Astronomy {
  const factory _Astronomy(
      {final DateTime? dawn,
      final DateTime? sunrise,
      final DateTime? suntransit,
      final DateTime? sunset,
      final DateTime? dusk,
      final DateTime? moonrise,
      final DateTime? moontransit,
      final DateTime? moonset,
      final double? moonphase,
      final double? moonzodiac}) = _$AstronomyImpl;

  factory _Astronomy.fromJson(Map<String, dynamic> json) =
      _$AstronomyImpl.fromJson;

  @override
  DateTime? get dawn;
  @override
  DateTime? get sunrise;
  @override
  DateTime? get suntransit;
  @override
  DateTime? get sunset;
  @override
  DateTime? get dusk;
  @override
  DateTime? get moonrise;
  @override
  DateTime? get moontransit;
  @override
  DateTime? get moonset;
  @override
  double? get moonphase;
  @override
  double? get moonzodiac;
  @override
  @JsonKey(ignore: true)
  _$$AstronomyImplCopyWith<_$AstronomyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Prec _$PrecFromJson(Map<String, dynamic> json) {
  return _Prec.fromJson(json);
}

/// @nodoc
mixin _$Prec {
  double? get sum => throw _privateConstructorUsedError;
  double? get probability => throw _privateConstructorUsedError;
  double? get sumAsRain => throw _privateConstructorUsedError;
  double? get precClass => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrecCopyWith<Prec> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrecCopyWith<$Res> {
  factory $PrecCopyWith(Prec value, $Res Function(Prec) then) =
      _$PrecCopyWithImpl<$Res, Prec>;
  @useResult
  $Res call(
      {double? sum, double? probability, double? sumAsRain, double? precClass});
}

/// @nodoc
class _$PrecCopyWithImpl<$Res, $Val extends Prec>
    implements $PrecCopyWith<$Res> {
  _$PrecCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sum = freezed,
    Object? probability = freezed,
    Object? sumAsRain = freezed,
    Object? precClass = freezed,
  }) {
    return _then(_value.copyWith(
      sum: freezed == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as double?,
      probability: freezed == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as double?,
      sumAsRain: freezed == sumAsRain
          ? _value.sumAsRain
          : sumAsRain // ignore: cast_nullable_to_non_nullable
              as double?,
      precClass: freezed == precClass
          ? _value.precClass
          : precClass // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrecImplCopyWith<$Res> implements $PrecCopyWith<$Res> {
  factory _$$PrecImplCopyWith(
          _$PrecImpl value, $Res Function(_$PrecImpl) then) =
      __$$PrecImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? sum, double? probability, double? sumAsRain, double? precClass});
}

/// @nodoc
class __$$PrecImplCopyWithImpl<$Res>
    extends _$PrecCopyWithImpl<$Res, _$PrecImpl>
    implements _$$PrecImplCopyWith<$Res> {
  __$$PrecImplCopyWithImpl(_$PrecImpl _value, $Res Function(_$PrecImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sum = freezed,
    Object? probability = freezed,
    Object? sumAsRain = freezed,
    Object? precClass = freezed,
  }) {
    return _then(_$PrecImpl(
      sum: freezed == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as double?,
      probability: freezed == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as double?,
      sumAsRain: freezed == sumAsRain
          ? _value.sumAsRain
          : sumAsRain // ignore: cast_nullable_to_non_nullable
              as double?,
      precClass: freezed == precClass
          ? _value.precClass
          : precClass // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrecImpl implements _Prec {
  const _$PrecImpl(
      {this.sum, this.probability, this.sumAsRain, this.precClass});

  factory _$PrecImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrecImplFromJson(json);

  @override
  final double? sum;
  @override
  final double? probability;
  @override
  final double? sumAsRain;
  @override
  final double? precClass;

  @override
  String toString() {
    return 'Prec(sum: $sum, probability: $probability, sumAsRain: $sumAsRain, precClass: $precClass)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrecImpl &&
            (identical(other.sum, sum) || other.sum == sum) &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            (identical(other.sumAsRain, sumAsRain) ||
                other.sumAsRain == sumAsRain) &&
            (identical(other.precClass, precClass) ||
                other.precClass == precClass));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sum, probability, sumAsRain, precClass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrecImplCopyWith<_$PrecImpl> get copyWith =>
      __$$PrecImplCopyWithImpl<_$PrecImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrecImplToJson(
      this,
    );
  }
}

abstract class _Prec implements Prec {
  const factory _Prec(
      {final double? sum,
      final double? probability,
      final double? sumAsRain,
      final double? precClass}) = _$PrecImpl;

  factory _Prec.fromJson(Map<String, dynamic> json) = _$PrecImpl.fromJson;

  @override
  double? get sum;
  @override
  double? get probability;
  @override
  double? get sumAsRain;
  @override
  double? get precClass;
  @override
  @JsonKey(ignore: true)
  _$$PrecImplCopyWith<_$PrecImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SnowLine _$SnowLineFromJson(Map<String, dynamic> json) {
  return _SnowLine.fromJson(json);
}

/// @nodoc
mixin _$SnowLine {
  double? get avg => throw _privateConstructorUsedError;
  double? get min => throw _privateConstructorUsedError;
  double? get max => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnowLineCopyWith<SnowLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnowLineCopyWith<$Res> {
  factory $SnowLineCopyWith(SnowLine value, $Res Function(SnowLine) then) =
      _$SnowLineCopyWithImpl<$Res, SnowLine>;
  @useResult
  $Res call({double? avg, double? min, double? max, String? unit});
}

/// @nodoc
class _$SnowLineCopyWithImpl<$Res, $Val extends SnowLine>
    implements $SnowLineCopyWith<$Res> {
  _$SnowLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avg = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      avg: freezed == avg
          ? _value.avg
          : avg // ignore: cast_nullable_to_non_nullable
              as double?,
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SnowLineImplCopyWith<$Res>
    implements $SnowLineCopyWith<$Res> {
  factory _$$SnowLineImplCopyWith(
          _$SnowLineImpl value, $Res Function(_$SnowLineImpl) then) =
      __$$SnowLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? avg, double? min, double? max, String? unit});
}

/// @nodoc
class __$$SnowLineImplCopyWithImpl<$Res>
    extends _$SnowLineCopyWithImpl<$Res, _$SnowLineImpl>
    implements _$$SnowLineImplCopyWith<$Res> {
  __$$SnowLineImplCopyWithImpl(
      _$SnowLineImpl _value, $Res Function(_$SnowLineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avg = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$SnowLineImpl(
      avg: freezed == avg
          ? _value.avg
          : avg // ignore: cast_nullable_to_non_nullable
              as double?,
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SnowLineImpl implements _SnowLine {
  const _$SnowLineImpl({this.avg, this.min, this.max, this.unit});

  factory _$SnowLineImpl.fromJson(Map<String, dynamic> json) =>
      _$$SnowLineImplFromJson(json);

  @override
  final double? avg;
  @override
  final double? min;
  @override
  final double? max;
  @override
  final String? unit;

  @override
  String toString() {
    return 'SnowLine(avg: $avg, min: $min, max: $max, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SnowLineImpl &&
            (identical(other.avg, avg) || other.avg == avg) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, avg, min, max, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SnowLineImplCopyWith<_$SnowLineImpl> get copyWith =>
      __$$SnowLineImplCopyWithImpl<_$SnowLineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SnowLineImplToJson(
      this,
    );
  }
}

abstract class _SnowLine implements SnowLine {
  const factory _SnowLine(
      {final double? avg,
      final double? min,
      final double? max,
      final String? unit}) = _$SnowLineImpl;

  factory _SnowLine.fromJson(Map<String, dynamic> json) =
      _$SnowLineImpl.fromJson;

  @override
  double? get avg;
  @override
  double? get min;
  @override
  double? get max;
  @override
  String? get unit;
  @override
  @JsonKey(ignore: true)
  _$$SnowLineImplCopyWith<_$SnowLineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
mixin _$Weather {
  int? get state => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call({int? state, String? text, String? icon});
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
    Object? state = freezed,
    Object? text = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
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
  $Res call({int? state, String? text, String? icon});
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
    Object? state = freezed,
    Object? text = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$WeatherImpl(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherImpl implements _Weather {
  const _$WeatherImpl({this.state, this.text, this.icon});

  factory _$WeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherImplFromJson(json);

  @override
  final int? state;
  @override
  final String? text;
  @override
  final String? icon;

  @override
  String toString() {
    return 'Weather(state: $state, text: $text, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, text, icon);

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
      {final int? state,
      final String? text,
      final String? icon}) = _$WeatherImpl;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$WeatherImpl.fromJson;

  @override
  int? get state;
  @override
  String? get text;
  @override
  String? get icon;
  @override
  @JsonKey(ignore: true)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Wind _$WindFromJson(Map<String, dynamic> json) {
  return _Wind.fromJson(json);
}

/// @nodoc
mixin _$Wind {
  String? get unit => throw _privateConstructorUsedError;
  String? get direction => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  double? get avg => throw _privateConstructorUsedError;
  double? get min => throw _privateConstructorUsedError;
  double? get max => throw _privateConstructorUsedError;
  Gusts? get gusts => throw _privateConstructorUsedError;
  bool? get significationWind => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WindCopyWith<Wind> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WindCopyWith<$Res> {
  factory $WindCopyWith(Wind value, $Res Function(Wind) then) =
      _$WindCopyWithImpl<$Res, Wind>;
  @useResult
  $Res call(
      {String? unit,
      String? direction,
      String? text,
      double? avg,
      double? min,
      double? max,
      Gusts? gusts,
      bool? significationWind});

  $GustsCopyWith<$Res>? get gusts;
}

/// @nodoc
class _$WindCopyWithImpl<$Res, $Val extends Wind>
    implements $WindCopyWith<$Res> {
  _$WindCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = freezed,
    Object? direction = freezed,
    Object? text = freezed,
    Object? avg = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? gusts = freezed,
    Object? significationWind = freezed,
  }) {
    return _then(_value.copyWith(
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      avg: freezed == avg
          ? _value.avg
          : avg // ignore: cast_nullable_to_non_nullable
              as double?,
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double?,
      gusts: freezed == gusts
          ? _value.gusts
          : gusts // ignore: cast_nullable_to_non_nullable
              as Gusts?,
      significationWind: freezed == significationWind
          ? _value.significationWind
          : significationWind // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GustsCopyWith<$Res>? get gusts {
    if (_value.gusts == null) {
      return null;
    }

    return $GustsCopyWith<$Res>(_value.gusts!, (value) {
      return _then(_value.copyWith(gusts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WindImplCopyWith<$Res> implements $WindCopyWith<$Res> {
  factory _$$WindImplCopyWith(
          _$WindImpl value, $Res Function(_$WindImpl) then) =
      __$$WindImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? unit,
      String? direction,
      String? text,
      double? avg,
      double? min,
      double? max,
      Gusts? gusts,
      bool? significationWind});

  @override
  $GustsCopyWith<$Res>? get gusts;
}

/// @nodoc
class __$$WindImplCopyWithImpl<$Res>
    extends _$WindCopyWithImpl<$Res, _$WindImpl>
    implements _$$WindImplCopyWith<$Res> {
  __$$WindImplCopyWithImpl(_$WindImpl _value, $Res Function(_$WindImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = freezed,
    Object? direction = freezed,
    Object? text = freezed,
    Object? avg = freezed,
    Object? min = freezed,
    Object? max = freezed,
    Object? gusts = freezed,
    Object? significationWind = freezed,
  }) {
    return _then(_$WindImpl(
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      avg: freezed == avg
          ? _value.avg
          : avg // ignore: cast_nullable_to_non_nullable
              as double?,
      min: freezed == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as double?,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as double?,
      gusts: freezed == gusts
          ? _value.gusts
          : gusts // ignore: cast_nullable_to_non_nullable
              as Gusts?,
      significationWind: freezed == significationWind
          ? _value.significationWind
          : significationWind // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WindImpl implements _Wind {
  const _$WindImpl(
      {this.unit,
      this.direction,
      this.text,
      this.avg,
      this.min,
      this.max,
      this.gusts,
      this.significationWind});

  factory _$WindImpl.fromJson(Map<String, dynamic> json) =>
      _$$WindImplFromJson(json);

  @override
  final String? unit;
  @override
  final String? direction;
  @override
  final String? text;
  @override
  final double? avg;
  @override
  final double? min;
  @override
  final double? max;
  @override
  final Gusts? gusts;
  @override
  final bool? significationWind;

  @override
  String toString() {
    return 'Wind(unit: $unit, direction: $direction, text: $text, avg: $avg, min: $min, max: $max, gusts: $gusts, significationWind: $significationWind)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WindImpl &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.avg, avg) || other.avg == avg) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.gusts, gusts) || other.gusts == gusts) &&
            (identical(other.significationWind, significationWind) ||
                other.significationWind == significationWind));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, unit, direction, text, avg, min,
      max, gusts, significationWind);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WindImplCopyWith<_$WindImpl> get copyWith =>
      __$$WindImplCopyWithImpl<_$WindImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WindImplToJson(
      this,
    );
  }
}

abstract class _Wind implements Wind {
  const factory _Wind(
      {final String? unit,
      final String? direction,
      final String? text,
      final double? avg,
      final double? min,
      final double? max,
      final Gusts? gusts,
      final bool? significationWind}) = _$WindImpl;

  factory _Wind.fromJson(Map<String, dynamic> json) = _$WindImpl.fromJson;

  @override
  String? get unit;
  @override
  String? get direction;
  @override
  String? get text;
  @override
  double? get avg;
  @override
  double? get min;
  @override
  double? get max;
  @override
  Gusts? get gusts;
  @override
  bool? get significationWind;
  @override
  @JsonKey(ignore: true)
  _$$WindImplCopyWith<_$WindImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Gusts _$GustsFromJson(Map<String, dynamic> json) {
  return _Gusts.fromJson(json);
}

/// @nodoc
mixin _$Gusts {
  double? get value => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GustsCopyWith<Gusts> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GustsCopyWith<$Res> {
  factory $GustsCopyWith(Gusts value, $Res Function(Gusts) then) =
      _$GustsCopyWithImpl<$Res, Gusts>;
  @useResult
  $Res call({double? value, String? text});
}

/// @nodoc
class _$GustsCopyWithImpl<$Res, $Val extends Gusts>
    implements $GustsCopyWith<$Res> {
  _$GustsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GustsImplCopyWith<$Res> implements $GustsCopyWith<$Res> {
  factory _$$GustsImplCopyWith(
          _$GustsImpl value, $Res Function(_$GustsImpl) then) =
      __$$GustsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? value, String? text});
}

/// @nodoc
class __$$GustsImplCopyWithImpl<$Res>
    extends _$GustsCopyWithImpl<$Res, _$GustsImpl>
    implements _$$GustsImplCopyWith<$Res> {
  __$$GustsImplCopyWithImpl(
      _$GustsImpl _value, $Res Function(_$GustsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? text = freezed,
  }) {
    return _then(_$GustsImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GustsImpl implements _Gusts {
  const _$GustsImpl({this.value, this.text});

  factory _$GustsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GustsImplFromJson(json);

  @override
  final double? value;
  @override
  final String? text;

  @override
  String toString() {
    return 'Gusts(value: $value, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GustsImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GustsImplCopyWith<_$GustsImpl> get copyWith =>
      __$$GustsImplCopyWithImpl<_$GustsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GustsImplToJson(
      this,
    );
  }
}

abstract class _Gusts implements Gusts {
  const factory _Gusts({final double? value, final String? text}) = _$GustsImpl;

  factory _Gusts.fromJson(Map<String, dynamic> json) = _$GustsImpl.fromJson;

  @override
  double? get value;
  @override
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$GustsImplCopyWith<_$GustsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
