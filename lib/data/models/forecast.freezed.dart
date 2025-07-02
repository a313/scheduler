// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Forecast {

 List<Item>? get items; DateTime? get forecastDate; DateTime? get nextUpdate; String? get source; String? get point; String? get fingerprint;
/// Create a copy of Forecast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastCopyWith<Forecast> get copyWith => _$ForecastCopyWithImpl<Forecast>(this as Forecast, _$identity);

  /// Serializes this Forecast to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Forecast&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.forecastDate, forecastDate) || other.forecastDate == forecastDate)&&(identical(other.nextUpdate, nextUpdate) || other.nextUpdate == nextUpdate)&&(identical(other.source, source) || other.source == source)&&(identical(other.point, point) || other.point == point)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),forecastDate,nextUpdate,source,point,fingerprint);

@override
String toString() {
  return 'Forecast(items: $items, forecastDate: $forecastDate, nextUpdate: $nextUpdate, source: $source, point: $point, fingerprint: $fingerprint)';
}


}

/// @nodoc
abstract mixin class $ForecastCopyWith<$Res>  {
  factory $ForecastCopyWith(Forecast value, $Res Function(Forecast) _then) = _$ForecastCopyWithImpl;
@useResult
$Res call({
 List<Item>? items, DateTime? forecastDate, DateTime? nextUpdate, String? source, String? point, String? fingerprint
});




}
/// @nodoc
class _$ForecastCopyWithImpl<$Res>
    implements $ForecastCopyWith<$Res> {
  _$ForecastCopyWithImpl(this._self, this._then);

  final Forecast _self;
  final $Res Function(Forecast) _then;

/// Create a copy of Forecast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = freezed,Object? forecastDate = freezed,Object? nextUpdate = freezed,Object? source = freezed,Object? point = freezed,Object? fingerprint = freezed,}) {
  return _then(_self.copyWith(
items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Item>?,forecastDate: freezed == forecastDate ? _self.forecastDate : forecastDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextUpdate: freezed == nextUpdate ? _self.nextUpdate : nextUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,point: freezed == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as String?,fingerprint: freezed == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Forecast implements Forecast {
  const _Forecast({final  List<Item>? items, this.forecastDate, this.nextUpdate, this.source, this.point, this.fingerprint}): _items = items;
  factory _Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);

 final  List<Item>? _items;
@override List<Item>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime? forecastDate;
@override final  DateTime? nextUpdate;
@override final  String? source;
@override final  String? point;
@override final  String? fingerprint;

/// Create a copy of Forecast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastCopyWith<_Forecast> get copyWith => __$ForecastCopyWithImpl<_Forecast>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Forecast&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.forecastDate, forecastDate) || other.forecastDate == forecastDate)&&(identical(other.nextUpdate, nextUpdate) || other.nextUpdate == nextUpdate)&&(identical(other.source, source) || other.source == source)&&(identical(other.point, point) || other.point == point)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),forecastDate,nextUpdate,source,point,fingerprint);

@override
String toString() {
  return 'Forecast(items: $items, forecastDate: $forecastDate, nextUpdate: $nextUpdate, source: $source, point: $point, fingerprint: $fingerprint)';
}


}

/// @nodoc
abstract mixin class _$ForecastCopyWith<$Res> implements $ForecastCopyWith<$Res> {
  factory _$ForecastCopyWith(_Forecast value, $Res Function(_Forecast) _then) = __$ForecastCopyWithImpl;
@override @useResult
$Res call({
 List<Item>? items, DateTime? forecastDate, DateTime? nextUpdate, String? source, String? point, String? fingerprint
});




}
/// @nodoc
class __$ForecastCopyWithImpl<$Res>
    implements _$ForecastCopyWith<$Res> {
  __$ForecastCopyWithImpl(this._self, this._then);

  final _Forecast _self;
  final $Res Function(_Forecast) _then;

/// Create a copy of Forecast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = freezed,Object? forecastDate = freezed,Object? nextUpdate = freezed,Object? source = freezed,Object? point = freezed,Object? fingerprint = freezed,}) {
  return _then(_Forecast(
items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Item>?,forecastDate: freezed == forecastDate ? _self.forecastDate : forecastDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextUpdate: freezed == nextUpdate ? _self.nextUpdate : nextUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,point: freezed == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as String?,fingerprint: freezed == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Item {

 DateTime? get date; DateTime? get dateWithTimezone; int? get freshSnow; dynamic get snowHeight; Weather? get weather; Prec? get prec; int? get sunHours; dynamic get rainHours; SnowLine? get temperature; Wind? get wind; SnowLine? get windchill; SnowLine? get snowLine; Astronomy? get astronomy;
/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemCopyWith<Item> get copyWith => _$ItemCopyWithImpl<Item>(this as Item, _$identity);

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Item&&(identical(other.date, date) || other.date == date)&&(identical(other.dateWithTimezone, dateWithTimezone) || other.dateWithTimezone == dateWithTimezone)&&(identical(other.freshSnow, freshSnow) || other.freshSnow == freshSnow)&&const DeepCollectionEquality().equals(other.snowHeight, snowHeight)&&(identical(other.weather, weather) || other.weather == weather)&&(identical(other.prec, prec) || other.prec == prec)&&(identical(other.sunHours, sunHours) || other.sunHours == sunHours)&&const DeepCollectionEquality().equals(other.rainHours, rainHours)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.wind, wind) || other.wind == wind)&&(identical(other.windchill, windchill) || other.windchill == windchill)&&(identical(other.snowLine, snowLine) || other.snowLine == snowLine)&&(identical(other.astronomy, astronomy) || other.astronomy == astronomy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,dateWithTimezone,freshSnow,const DeepCollectionEquality().hash(snowHeight),weather,prec,sunHours,const DeepCollectionEquality().hash(rainHours),temperature,wind,windchill,snowLine,astronomy);

@override
String toString() {
  return 'Item(date: $date, dateWithTimezone: $dateWithTimezone, freshSnow: $freshSnow, snowHeight: $snowHeight, weather: $weather, prec: $prec, sunHours: $sunHours, rainHours: $rainHours, temperature: $temperature, wind: $wind, windchill: $windchill, snowLine: $snowLine, astronomy: $astronomy)';
}


}

/// @nodoc
abstract mixin class $ItemCopyWith<$Res>  {
  factory $ItemCopyWith(Item value, $Res Function(Item) _then) = _$ItemCopyWithImpl;
@useResult
$Res call({
 DateTime? date, DateTime? dateWithTimezone, int? freshSnow, dynamic snowHeight, Weather? weather, Prec? prec, int? sunHours, dynamic rainHours, SnowLine? temperature, Wind? wind, SnowLine? windchill, SnowLine? snowLine, Astronomy? astronomy
});


$WeatherCopyWith<$Res>? get weather;$PrecCopyWith<$Res>? get prec;$SnowLineCopyWith<$Res>? get temperature;$WindCopyWith<$Res>? get wind;$SnowLineCopyWith<$Res>? get windchill;$SnowLineCopyWith<$Res>? get snowLine;$AstronomyCopyWith<$Res>? get astronomy;

}
/// @nodoc
class _$ItemCopyWithImpl<$Res>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._self, this._then);

  final Item _self;
  final $Res Function(Item) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? dateWithTimezone = freezed,Object? freshSnow = freezed,Object? snowHeight = freezed,Object? weather = freezed,Object? prec = freezed,Object? sunHours = freezed,Object? rainHours = freezed,Object? temperature = freezed,Object? wind = freezed,Object? windchill = freezed,Object? snowLine = freezed,Object? astronomy = freezed,}) {
  return _then(_self.copyWith(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,dateWithTimezone: freezed == dateWithTimezone ? _self.dateWithTimezone : dateWithTimezone // ignore: cast_nullable_to_non_nullable
as DateTime?,freshSnow: freezed == freshSnow ? _self.freshSnow : freshSnow // ignore: cast_nullable_to_non_nullable
as int?,snowHeight: freezed == snowHeight ? _self.snowHeight : snowHeight // ignore: cast_nullable_to_non_nullable
as dynamic,weather: freezed == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as Weather?,prec: freezed == prec ? _self.prec : prec // ignore: cast_nullable_to_non_nullable
as Prec?,sunHours: freezed == sunHours ? _self.sunHours : sunHours // ignore: cast_nullable_to_non_nullable
as int?,rainHours: freezed == rainHours ? _self.rainHours : rainHours // ignore: cast_nullable_to_non_nullable
as dynamic,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as SnowLine?,wind: freezed == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as Wind?,windchill: freezed == windchill ? _self.windchill : windchill // ignore: cast_nullable_to_non_nullable
as SnowLine?,snowLine: freezed == snowLine ? _self.snowLine : snowLine // ignore: cast_nullable_to_non_nullable
as SnowLine?,astronomy: freezed == astronomy ? _self.astronomy : astronomy // ignore: cast_nullable_to_non_nullable
as Astronomy?,
  ));
}
/// Create a copy of Item
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
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrecCopyWith<$Res>? get prec {
    if (_self.prec == null) {
    return null;
  }

  return $PrecCopyWith<$Res>(_self.prec!, (value) {
    return _then(_self.copyWith(prec: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnowLineCopyWith<$Res>? get temperature {
    if (_self.temperature == null) {
    return null;
  }

  return $SnowLineCopyWith<$Res>(_self.temperature!, (value) {
    return _then(_self.copyWith(temperature: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WindCopyWith<$Res>? get wind {
    if (_self.wind == null) {
    return null;
  }

  return $WindCopyWith<$Res>(_self.wind!, (value) {
    return _then(_self.copyWith(wind: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnowLineCopyWith<$Res>? get windchill {
    if (_self.windchill == null) {
    return null;
  }

  return $SnowLineCopyWith<$Res>(_self.windchill!, (value) {
    return _then(_self.copyWith(windchill: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnowLineCopyWith<$Res>? get snowLine {
    if (_self.snowLine == null) {
    return null;
  }

  return $SnowLineCopyWith<$Res>(_self.snowLine!, (value) {
    return _then(_self.copyWith(snowLine: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AstronomyCopyWith<$Res>? get astronomy {
    if (_self.astronomy == null) {
    return null;
  }

  return $AstronomyCopyWith<$Res>(_self.astronomy!, (value) {
    return _then(_self.copyWith(astronomy: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Item implements Item {
  const _Item({this.date, this.dateWithTimezone, this.freshSnow, this.snowHeight, this.weather, this.prec, this.sunHours, this.rainHours, this.temperature, this.wind, this.windchill, this.snowLine, this.astronomy});
  factory _Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

@override final  DateTime? date;
@override final  DateTime? dateWithTimezone;
@override final  int? freshSnow;
@override final  dynamic snowHeight;
@override final  Weather? weather;
@override final  Prec? prec;
@override final  int? sunHours;
@override final  dynamic rainHours;
@override final  SnowLine? temperature;
@override final  Wind? wind;
@override final  SnowLine? windchill;
@override final  SnowLine? snowLine;
@override final  Astronomy? astronomy;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemCopyWith<_Item> get copyWith => __$ItemCopyWithImpl<_Item>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Item&&(identical(other.date, date) || other.date == date)&&(identical(other.dateWithTimezone, dateWithTimezone) || other.dateWithTimezone == dateWithTimezone)&&(identical(other.freshSnow, freshSnow) || other.freshSnow == freshSnow)&&const DeepCollectionEquality().equals(other.snowHeight, snowHeight)&&(identical(other.weather, weather) || other.weather == weather)&&(identical(other.prec, prec) || other.prec == prec)&&(identical(other.sunHours, sunHours) || other.sunHours == sunHours)&&const DeepCollectionEquality().equals(other.rainHours, rainHours)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.wind, wind) || other.wind == wind)&&(identical(other.windchill, windchill) || other.windchill == windchill)&&(identical(other.snowLine, snowLine) || other.snowLine == snowLine)&&(identical(other.astronomy, astronomy) || other.astronomy == astronomy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,dateWithTimezone,freshSnow,const DeepCollectionEquality().hash(snowHeight),weather,prec,sunHours,const DeepCollectionEquality().hash(rainHours),temperature,wind,windchill,snowLine,astronomy);

@override
String toString() {
  return 'Item(date: $date, dateWithTimezone: $dateWithTimezone, freshSnow: $freshSnow, snowHeight: $snowHeight, weather: $weather, prec: $prec, sunHours: $sunHours, rainHours: $rainHours, temperature: $temperature, wind: $wind, windchill: $windchill, snowLine: $snowLine, astronomy: $astronomy)';
}


}

/// @nodoc
abstract mixin class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) _then) = __$ItemCopyWithImpl;
@override @useResult
$Res call({
 DateTime? date, DateTime? dateWithTimezone, int? freshSnow, dynamic snowHeight, Weather? weather, Prec? prec, int? sunHours, dynamic rainHours, SnowLine? temperature, Wind? wind, SnowLine? windchill, SnowLine? snowLine, Astronomy? astronomy
});


@override $WeatherCopyWith<$Res>? get weather;@override $PrecCopyWith<$Res>? get prec;@override $SnowLineCopyWith<$Res>? get temperature;@override $WindCopyWith<$Res>? get wind;@override $SnowLineCopyWith<$Res>? get windchill;@override $SnowLineCopyWith<$Res>? get snowLine;@override $AstronomyCopyWith<$Res>? get astronomy;

}
/// @nodoc
class __$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(this._self, this._then);

  final _Item _self;
  final $Res Function(_Item) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? dateWithTimezone = freezed,Object? freshSnow = freezed,Object? snowHeight = freezed,Object? weather = freezed,Object? prec = freezed,Object? sunHours = freezed,Object? rainHours = freezed,Object? temperature = freezed,Object? wind = freezed,Object? windchill = freezed,Object? snowLine = freezed,Object? astronomy = freezed,}) {
  return _then(_Item(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,dateWithTimezone: freezed == dateWithTimezone ? _self.dateWithTimezone : dateWithTimezone // ignore: cast_nullable_to_non_nullable
as DateTime?,freshSnow: freezed == freshSnow ? _self.freshSnow : freshSnow // ignore: cast_nullable_to_non_nullable
as int?,snowHeight: freezed == snowHeight ? _self.snowHeight : snowHeight // ignore: cast_nullable_to_non_nullable
as dynamic,weather: freezed == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as Weather?,prec: freezed == prec ? _self.prec : prec // ignore: cast_nullable_to_non_nullable
as Prec?,sunHours: freezed == sunHours ? _self.sunHours : sunHours // ignore: cast_nullable_to_non_nullable
as int?,rainHours: freezed == rainHours ? _self.rainHours : rainHours // ignore: cast_nullable_to_non_nullable
as dynamic,temperature: freezed == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as SnowLine?,wind: freezed == wind ? _self.wind : wind // ignore: cast_nullable_to_non_nullable
as Wind?,windchill: freezed == windchill ? _self.windchill : windchill // ignore: cast_nullable_to_non_nullable
as SnowLine?,snowLine: freezed == snowLine ? _self.snowLine : snowLine // ignore: cast_nullable_to_non_nullable
as SnowLine?,astronomy: freezed == astronomy ? _self.astronomy : astronomy // ignore: cast_nullable_to_non_nullable
as Astronomy?,
  ));
}

/// Create a copy of Item
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
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrecCopyWith<$Res>? get prec {
    if (_self.prec == null) {
    return null;
  }

  return $PrecCopyWith<$Res>(_self.prec!, (value) {
    return _then(_self.copyWith(prec: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnowLineCopyWith<$Res>? get temperature {
    if (_self.temperature == null) {
    return null;
  }

  return $SnowLineCopyWith<$Res>(_self.temperature!, (value) {
    return _then(_self.copyWith(temperature: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WindCopyWith<$Res>? get wind {
    if (_self.wind == null) {
    return null;
  }

  return $WindCopyWith<$Res>(_self.wind!, (value) {
    return _then(_self.copyWith(wind: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnowLineCopyWith<$Res>? get windchill {
    if (_self.windchill == null) {
    return null;
  }

  return $SnowLineCopyWith<$Res>(_self.windchill!, (value) {
    return _then(_self.copyWith(windchill: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SnowLineCopyWith<$Res>? get snowLine {
    if (_self.snowLine == null) {
    return null;
  }

  return $SnowLineCopyWith<$Res>(_self.snowLine!, (value) {
    return _then(_self.copyWith(snowLine: value));
  });
}/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AstronomyCopyWith<$Res>? get astronomy {
    if (_self.astronomy == null) {
    return null;
  }

  return $AstronomyCopyWith<$Res>(_self.astronomy!, (value) {
    return _then(_self.copyWith(astronomy: value));
  });
}
}


/// @nodoc
mixin _$Astronomy {

 DateTime? get dawn; DateTime? get sunrise; DateTime? get suntransit; DateTime? get sunset; DateTime? get dusk; DateTime? get moonrise; DateTime? get moontransit; DateTime? get moonset; double? get moonphase; double? get moonzodiac;
/// Create a copy of Astronomy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AstronomyCopyWith<Astronomy> get copyWith => _$AstronomyCopyWithImpl<Astronomy>(this as Astronomy, _$identity);

  /// Serializes this Astronomy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Astronomy&&(identical(other.dawn, dawn) || other.dawn == dawn)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.suntransit, suntransit) || other.suntransit == suntransit)&&(identical(other.sunset, sunset) || other.sunset == sunset)&&(identical(other.dusk, dusk) || other.dusk == dusk)&&(identical(other.moonrise, moonrise) || other.moonrise == moonrise)&&(identical(other.moontransit, moontransit) || other.moontransit == moontransit)&&(identical(other.moonset, moonset) || other.moonset == moonset)&&(identical(other.moonphase, moonphase) || other.moonphase == moonphase)&&(identical(other.moonzodiac, moonzodiac) || other.moonzodiac == moonzodiac));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dawn,sunrise,suntransit,sunset,dusk,moonrise,moontransit,moonset,moonphase,moonzodiac);

@override
String toString() {
  return 'Astronomy(dawn: $dawn, sunrise: $sunrise, suntransit: $suntransit, sunset: $sunset, dusk: $dusk, moonrise: $moonrise, moontransit: $moontransit, moonset: $moonset, moonphase: $moonphase, moonzodiac: $moonzodiac)';
}


}

/// @nodoc
abstract mixin class $AstronomyCopyWith<$Res>  {
  factory $AstronomyCopyWith(Astronomy value, $Res Function(Astronomy) _then) = _$AstronomyCopyWithImpl;
@useResult
$Res call({
 DateTime? dawn, DateTime? sunrise, DateTime? suntransit, DateTime? sunset, DateTime? dusk, DateTime? moonrise, DateTime? moontransit, DateTime? moonset, double? moonphase, double? moonzodiac
});




}
/// @nodoc
class _$AstronomyCopyWithImpl<$Res>
    implements $AstronomyCopyWith<$Res> {
  _$AstronomyCopyWithImpl(this._self, this._then);

  final Astronomy _self;
  final $Res Function(Astronomy) _then;

/// Create a copy of Astronomy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dawn = freezed,Object? sunrise = freezed,Object? suntransit = freezed,Object? sunset = freezed,Object? dusk = freezed,Object? moonrise = freezed,Object? moontransit = freezed,Object? moonset = freezed,Object? moonphase = freezed,Object? moonzodiac = freezed,}) {
  return _then(_self.copyWith(
dawn: freezed == dawn ? _self.dawn : dawn // ignore: cast_nullable_to_non_nullable
as DateTime?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as DateTime?,suntransit: freezed == suntransit ? _self.suntransit : suntransit // ignore: cast_nullable_to_non_nullable
as DateTime?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as DateTime?,dusk: freezed == dusk ? _self.dusk : dusk // ignore: cast_nullable_to_non_nullable
as DateTime?,moonrise: freezed == moonrise ? _self.moonrise : moonrise // ignore: cast_nullable_to_non_nullable
as DateTime?,moontransit: freezed == moontransit ? _self.moontransit : moontransit // ignore: cast_nullable_to_non_nullable
as DateTime?,moonset: freezed == moonset ? _self.moonset : moonset // ignore: cast_nullable_to_non_nullable
as DateTime?,moonphase: freezed == moonphase ? _self.moonphase : moonphase // ignore: cast_nullable_to_non_nullable
as double?,moonzodiac: freezed == moonzodiac ? _self.moonzodiac : moonzodiac // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Astronomy implements Astronomy {
  const _Astronomy({this.dawn, this.sunrise, this.suntransit, this.sunset, this.dusk, this.moonrise, this.moontransit, this.moonset, this.moonphase, this.moonzodiac});
  factory _Astronomy.fromJson(Map<String, dynamic> json) => _$AstronomyFromJson(json);

@override final  DateTime? dawn;
@override final  DateTime? sunrise;
@override final  DateTime? suntransit;
@override final  DateTime? sunset;
@override final  DateTime? dusk;
@override final  DateTime? moonrise;
@override final  DateTime? moontransit;
@override final  DateTime? moonset;
@override final  double? moonphase;
@override final  double? moonzodiac;

/// Create a copy of Astronomy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AstronomyCopyWith<_Astronomy> get copyWith => __$AstronomyCopyWithImpl<_Astronomy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AstronomyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Astronomy&&(identical(other.dawn, dawn) || other.dawn == dawn)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.suntransit, suntransit) || other.suntransit == suntransit)&&(identical(other.sunset, sunset) || other.sunset == sunset)&&(identical(other.dusk, dusk) || other.dusk == dusk)&&(identical(other.moonrise, moonrise) || other.moonrise == moonrise)&&(identical(other.moontransit, moontransit) || other.moontransit == moontransit)&&(identical(other.moonset, moonset) || other.moonset == moonset)&&(identical(other.moonphase, moonphase) || other.moonphase == moonphase)&&(identical(other.moonzodiac, moonzodiac) || other.moonzodiac == moonzodiac));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dawn,sunrise,suntransit,sunset,dusk,moonrise,moontransit,moonset,moonphase,moonzodiac);

@override
String toString() {
  return 'Astronomy(dawn: $dawn, sunrise: $sunrise, suntransit: $suntransit, sunset: $sunset, dusk: $dusk, moonrise: $moonrise, moontransit: $moontransit, moonset: $moonset, moonphase: $moonphase, moonzodiac: $moonzodiac)';
}


}

/// @nodoc
abstract mixin class _$AstronomyCopyWith<$Res> implements $AstronomyCopyWith<$Res> {
  factory _$AstronomyCopyWith(_Astronomy value, $Res Function(_Astronomy) _then) = __$AstronomyCopyWithImpl;
@override @useResult
$Res call({
 DateTime? dawn, DateTime? sunrise, DateTime? suntransit, DateTime? sunset, DateTime? dusk, DateTime? moonrise, DateTime? moontransit, DateTime? moonset, double? moonphase, double? moonzodiac
});




}
/// @nodoc
class __$AstronomyCopyWithImpl<$Res>
    implements _$AstronomyCopyWith<$Res> {
  __$AstronomyCopyWithImpl(this._self, this._then);

  final _Astronomy _self;
  final $Res Function(_Astronomy) _then;

/// Create a copy of Astronomy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dawn = freezed,Object? sunrise = freezed,Object? suntransit = freezed,Object? sunset = freezed,Object? dusk = freezed,Object? moonrise = freezed,Object? moontransit = freezed,Object? moonset = freezed,Object? moonphase = freezed,Object? moonzodiac = freezed,}) {
  return _then(_Astronomy(
dawn: freezed == dawn ? _self.dawn : dawn // ignore: cast_nullable_to_non_nullable
as DateTime?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as DateTime?,suntransit: freezed == suntransit ? _self.suntransit : suntransit // ignore: cast_nullable_to_non_nullable
as DateTime?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as DateTime?,dusk: freezed == dusk ? _self.dusk : dusk // ignore: cast_nullable_to_non_nullable
as DateTime?,moonrise: freezed == moonrise ? _self.moonrise : moonrise // ignore: cast_nullable_to_non_nullable
as DateTime?,moontransit: freezed == moontransit ? _self.moontransit : moontransit // ignore: cast_nullable_to_non_nullable
as DateTime?,moonset: freezed == moonset ? _self.moonset : moonset // ignore: cast_nullable_to_non_nullable
as DateTime?,moonphase: freezed == moonphase ? _self.moonphase : moonphase // ignore: cast_nullable_to_non_nullable
as double?,moonzodiac: freezed == moonzodiac ? _self.moonzodiac : moonzodiac // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$Prec {

 double? get sum; double? get probability; double? get sumAsRain; double? get precClass;
/// Create a copy of Prec
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrecCopyWith<Prec> get copyWith => _$PrecCopyWithImpl<Prec>(this as Prec, _$identity);

  /// Serializes this Prec to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Prec&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.probability, probability) || other.probability == probability)&&(identical(other.sumAsRain, sumAsRain) || other.sumAsRain == sumAsRain)&&(identical(other.precClass, precClass) || other.precClass == precClass));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sum,probability,sumAsRain,precClass);

@override
String toString() {
  return 'Prec(sum: $sum, probability: $probability, sumAsRain: $sumAsRain, precClass: $precClass)';
}


}

/// @nodoc
abstract mixin class $PrecCopyWith<$Res>  {
  factory $PrecCopyWith(Prec value, $Res Function(Prec) _then) = _$PrecCopyWithImpl;
@useResult
$Res call({
 double? sum, double? probability, double? sumAsRain, double? precClass
});




}
/// @nodoc
class _$PrecCopyWithImpl<$Res>
    implements $PrecCopyWith<$Res> {
  _$PrecCopyWithImpl(this._self, this._then);

  final Prec _self;
  final $Res Function(Prec) _then;

/// Create a copy of Prec
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sum = freezed,Object? probability = freezed,Object? sumAsRain = freezed,Object? precClass = freezed,}) {
  return _then(_self.copyWith(
sum: freezed == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as double?,probability: freezed == probability ? _self.probability : probability // ignore: cast_nullable_to_non_nullable
as double?,sumAsRain: freezed == sumAsRain ? _self.sumAsRain : sumAsRain // ignore: cast_nullable_to_non_nullable
as double?,precClass: freezed == precClass ? _self.precClass : precClass // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Prec implements Prec {
  const _Prec({this.sum, this.probability, this.sumAsRain, this.precClass});
  factory _Prec.fromJson(Map<String, dynamic> json) => _$PrecFromJson(json);

@override final  double? sum;
@override final  double? probability;
@override final  double? sumAsRain;
@override final  double? precClass;

/// Create a copy of Prec
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrecCopyWith<_Prec> get copyWith => __$PrecCopyWithImpl<_Prec>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrecToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Prec&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.probability, probability) || other.probability == probability)&&(identical(other.sumAsRain, sumAsRain) || other.sumAsRain == sumAsRain)&&(identical(other.precClass, precClass) || other.precClass == precClass));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sum,probability,sumAsRain,precClass);

@override
String toString() {
  return 'Prec(sum: $sum, probability: $probability, sumAsRain: $sumAsRain, precClass: $precClass)';
}


}

/// @nodoc
abstract mixin class _$PrecCopyWith<$Res> implements $PrecCopyWith<$Res> {
  factory _$PrecCopyWith(_Prec value, $Res Function(_Prec) _then) = __$PrecCopyWithImpl;
@override @useResult
$Res call({
 double? sum, double? probability, double? sumAsRain, double? precClass
});




}
/// @nodoc
class __$PrecCopyWithImpl<$Res>
    implements _$PrecCopyWith<$Res> {
  __$PrecCopyWithImpl(this._self, this._then);

  final _Prec _self;
  final $Res Function(_Prec) _then;

/// Create a copy of Prec
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sum = freezed,Object? probability = freezed,Object? sumAsRain = freezed,Object? precClass = freezed,}) {
  return _then(_Prec(
sum: freezed == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as double?,probability: freezed == probability ? _self.probability : probability // ignore: cast_nullable_to_non_nullable
as double?,sumAsRain: freezed == sumAsRain ? _self.sumAsRain : sumAsRain // ignore: cast_nullable_to_non_nullable
as double?,precClass: freezed == precClass ? _self.precClass : precClass // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$SnowLine {

 double? get avg; double? get min; double? get max; String? get unit;
/// Create a copy of SnowLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnowLineCopyWith<SnowLine> get copyWith => _$SnowLineCopyWithImpl<SnowLine>(this as SnowLine, _$identity);

  /// Serializes this SnowLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnowLine&&(identical(other.avg, avg) || other.avg == avg)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avg,min,max,unit);

@override
String toString() {
  return 'SnowLine(avg: $avg, min: $min, max: $max, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $SnowLineCopyWith<$Res>  {
  factory $SnowLineCopyWith(SnowLine value, $Res Function(SnowLine) _then) = _$SnowLineCopyWithImpl;
@useResult
$Res call({
 double? avg, double? min, double? max, String? unit
});




}
/// @nodoc
class _$SnowLineCopyWithImpl<$Res>
    implements $SnowLineCopyWith<$Res> {
  _$SnowLineCopyWithImpl(this._self, this._then);

  final SnowLine _self;
  final $Res Function(SnowLine) _then;

/// Create a copy of SnowLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avg = freezed,Object? min = freezed,Object? max = freezed,Object? unit = freezed,}) {
  return _then(_self.copyWith(
avg: freezed == avg ? _self.avg : avg // ignore: cast_nullable_to_non_nullable
as double?,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SnowLine implements SnowLine {
  const _SnowLine({this.avg, this.min, this.max, this.unit});
  factory _SnowLine.fromJson(Map<String, dynamic> json) => _$SnowLineFromJson(json);

@override final  double? avg;
@override final  double? min;
@override final  double? max;
@override final  String? unit;

/// Create a copy of SnowLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnowLineCopyWith<_SnowLine> get copyWith => __$SnowLineCopyWithImpl<_SnowLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SnowLineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnowLine&&(identical(other.avg, avg) || other.avg == avg)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avg,min,max,unit);

@override
String toString() {
  return 'SnowLine(avg: $avg, min: $min, max: $max, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$SnowLineCopyWith<$Res> implements $SnowLineCopyWith<$Res> {
  factory _$SnowLineCopyWith(_SnowLine value, $Res Function(_SnowLine) _then) = __$SnowLineCopyWithImpl;
@override @useResult
$Res call({
 double? avg, double? min, double? max, String? unit
});




}
/// @nodoc
class __$SnowLineCopyWithImpl<$Res>
    implements _$SnowLineCopyWith<$Res> {
  __$SnowLineCopyWithImpl(this._self, this._then);

  final _SnowLine _self;
  final $Res Function(_SnowLine) _then;

/// Create a copy of SnowLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avg = freezed,Object? min = freezed,Object? max = freezed,Object? unit = freezed,}) {
  return _then(_SnowLine(
avg: freezed == avg ? _self.avg : avg // ignore: cast_nullable_to_non_nullable
as double?,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Weather {

 int? get state; String? get text; String? get icon;
/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherCopyWith<Weather> get copyWith => _$WeatherCopyWithImpl<Weather>(this as Weather, _$identity);

  /// Serializes this Weather to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Weather&&(identical(other.state, state) || other.state == state)&&(identical(other.text, text) || other.text == text)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,text,icon);

@override
String toString() {
  return 'Weather(state: $state, text: $text, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $WeatherCopyWith<$Res>  {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) _then) = _$WeatherCopyWithImpl;
@useResult
$Res call({
 int? state, String? text, String? icon
});




}
/// @nodoc
class _$WeatherCopyWithImpl<$Res>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._self, this._then);

  final Weather _self;
  final $Res Function(Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = freezed,Object? text = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as int?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Weather implements Weather {
  const _Weather({this.state, this.text, this.icon});
  factory _Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

@override final  int? state;
@override final  String? text;
@override final  String? icon;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherCopyWith<_Weather> get copyWith => __$WeatherCopyWithImpl<_Weather>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Weather&&(identical(other.state, state) || other.state == state)&&(identical(other.text, text) || other.text == text)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,text,icon);

@override
String toString() {
  return 'Weather(state: $state, text: $text, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) _then) = __$WeatherCopyWithImpl;
@override @useResult
$Res call({
 int? state, String? text, String? icon
});




}
/// @nodoc
class __$WeatherCopyWithImpl<$Res>
    implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(this._self, this._then);

  final _Weather _self;
  final $Res Function(_Weather) _then;

/// Create a copy of Weather
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = freezed,Object? text = freezed,Object? icon = freezed,}) {
  return _then(_Weather(
state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as int?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Wind {

 String? get unit; String? get direction; String? get text; double? get avg; double? get min; double? get max; Gusts? get gusts; bool? get significationWind;
/// Create a copy of Wind
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WindCopyWith<Wind> get copyWith => _$WindCopyWithImpl<Wind>(this as Wind, _$identity);

  /// Serializes this Wind to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Wind&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.text, text) || other.text == text)&&(identical(other.avg, avg) || other.avg == avg)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.gusts, gusts) || other.gusts == gusts)&&(identical(other.significationWind, significationWind) || other.significationWind == significationWind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unit,direction,text,avg,min,max,gusts,significationWind);

@override
String toString() {
  return 'Wind(unit: $unit, direction: $direction, text: $text, avg: $avg, min: $min, max: $max, gusts: $gusts, significationWind: $significationWind)';
}


}

/// @nodoc
abstract mixin class $WindCopyWith<$Res>  {
  factory $WindCopyWith(Wind value, $Res Function(Wind) _then) = _$WindCopyWithImpl;
@useResult
$Res call({
 String? unit, String? direction, String? text, double? avg, double? min, double? max, Gusts? gusts, bool? significationWind
});


$GustsCopyWith<$Res>? get gusts;

}
/// @nodoc
class _$WindCopyWithImpl<$Res>
    implements $WindCopyWith<$Res> {
  _$WindCopyWithImpl(this._self, this._then);

  final Wind _self;
  final $Res Function(Wind) _then;

/// Create a copy of Wind
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unit = freezed,Object? direction = freezed,Object? text = freezed,Object? avg = freezed,Object? min = freezed,Object? max = freezed,Object? gusts = freezed,Object? significationWind = freezed,}) {
  return _then(_self.copyWith(
unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,direction: freezed == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,avg: freezed == avg ? _self.avg : avg // ignore: cast_nullable_to_non_nullable
as double?,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double?,gusts: freezed == gusts ? _self.gusts : gusts // ignore: cast_nullable_to_non_nullable
as Gusts?,significationWind: freezed == significationWind ? _self.significationWind : significationWind // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of Wind
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GustsCopyWith<$Res>? get gusts {
    if (_self.gusts == null) {
    return null;
  }

  return $GustsCopyWith<$Res>(_self.gusts!, (value) {
    return _then(_self.copyWith(gusts: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Wind implements Wind {
  const _Wind({this.unit, this.direction, this.text, this.avg, this.min, this.max, this.gusts, this.significationWind});
  factory _Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

@override final  String? unit;
@override final  String? direction;
@override final  String? text;
@override final  double? avg;
@override final  double? min;
@override final  double? max;
@override final  Gusts? gusts;
@override final  bool? significationWind;

/// Create a copy of Wind
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WindCopyWith<_Wind> get copyWith => __$WindCopyWithImpl<_Wind>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WindToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Wind&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.text, text) || other.text == text)&&(identical(other.avg, avg) || other.avg == avg)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.gusts, gusts) || other.gusts == gusts)&&(identical(other.significationWind, significationWind) || other.significationWind == significationWind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unit,direction,text,avg,min,max,gusts,significationWind);

@override
String toString() {
  return 'Wind(unit: $unit, direction: $direction, text: $text, avg: $avg, min: $min, max: $max, gusts: $gusts, significationWind: $significationWind)';
}


}

/// @nodoc
abstract mixin class _$WindCopyWith<$Res> implements $WindCopyWith<$Res> {
  factory _$WindCopyWith(_Wind value, $Res Function(_Wind) _then) = __$WindCopyWithImpl;
@override @useResult
$Res call({
 String? unit, String? direction, String? text, double? avg, double? min, double? max, Gusts? gusts, bool? significationWind
});


@override $GustsCopyWith<$Res>? get gusts;

}
/// @nodoc
class __$WindCopyWithImpl<$Res>
    implements _$WindCopyWith<$Res> {
  __$WindCopyWithImpl(this._self, this._then);

  final _Wind _self;
  final $Res Function(_Wind) _then;

/// Create a copy of Wind
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unit = freezed,Object? direction = freezed,Object? text = freezed,Object? avg = freezed,Object? min = freezed,Object? max = freezed,Object? gusts = freezed,Object? significationWind = freezed,}) {
  return _then(_Wind(
unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,direction: freezed == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,avg: freezed == avg ? _self.avg : avg // ignore: cast_nullable_to_non_nullable
as double?,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double?,gusts: freezed == gusts ? _self.gusts : gusts // ignore: cast_nullable_to_non_nullable
as Gusts?,significationWind: freezed == significationWind ? _self.significationWind : significationWind // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of Wind
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GustsCopyWith<$Res>? get gusts {
    if (_self.gusts == null) {
    return null;
  }

  return $GustsCopyWith<$Res>(_self.gusts!, (value) {
    return _then(_self.copyWith(gusts: value));
  });
}
}


/// @nodoc
mixin _$Gusts {

 double? get value; String? get text;
/// Create a copy of Gusts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GustsCopyWith<Gusts> get copyWith => _$GustsCopyWithImpl<Gusts>(this as Gusts, _$identity);

  /// Serializes this Gusts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Gusts&&(identical(other.value, value) || other.value == value)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,text);

@override
String toString() {
  return 'Gusts(value: $value, text: $text)';
}


}

/// @nodoc
abstract mixin class $GustsCopyWith<$Res>  {
  factory $GustsCopyWith(Gusts value, $Res Function(Gusts) _then) = _$GustsCopyWithImpl;
@useResult
$Res call({
 double? value, String? text
});




}
/// @nodoc
class _$GustsCopyWithImpl<$Res>
    implements $GustsCopyWith<$Res> {
  _$GustsCopyWithImpl(this._self, this._then);

  final Gusts _self;
  final $Res Function(Gusts) _then;

/// Create a copy of Gusts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = freezed,Object? text = freezed,}) {
  return _then(_self.copyWith(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Gusts implements Gusts {
  const _Gusts({this.value, this.text});
  factory _Gusts.fromJson(Map<String, dynamic> json) => _$GustsFromJson(json);

@override final  double? value;
@override final  String? text;

/// Create a copy of Gusts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GustsCopyWith<_Gusts> get copyWith => __$GustsCopyWithImpl<_Gusts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GustsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Gusts&&(identical(other.value, value) || other.value == value)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,text);

@override
String toString() {
  return 'Gusts(value: $value, text: $text)';
}


}

/// @nodoc
abstract mixin class _$GustsCopyWith<$Res> implements $GustsCopyWith<$Res> {
  factory _$GustsCopyWith(_Gusts value, $Res Function(_Gusts) _then) = __$GustsCopyWithImpl;
@override @useResult
$Res call({
 double? value, String? text
});




}
/// @nodoc
class __$GustsCopyWithImpl<$Res>
    implements _$GustsCopyWith<$Res> {
  __$GustsCopyWithImpl(this._self, this._then);

  final _Gusts _self;
  final $Res Function(_Gusts) _then;

/// Create a copy of Gusts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = freezed,Object? text = freezed,}) {
  return _then(_Gusts(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
