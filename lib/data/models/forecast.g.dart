// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForecastImpl _$$ForecastImplFromJson(Map<String, dynamic> json) =>
    _$ForecastImpl(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      forecastDate: json['forecastDate'] == null
          ? null
          : DateTime.parse(json['forecastDate'] as String),
      nextUpdate: json['nextUpdate'] == null
          ? null
          : DateTime.parse(json['nextUpdate'] as String),
      source: json['source'] as String?,
      point: json['point'] as String?,
      fingerprint: json['fingerprint'] as String?,
    );

Map<String, dynamic> _$$ForecastImplToJson(_$ForecastImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'forecastDate': instance.forecastDate?.toIso8601String(),
      'nextUpdate': instance.nextUpdate?.toIso8601String(),
      'source': instance.source,
      'point': instance.point,
      'fingerprint': instance.fingerprint,
    };

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      dateWithTimezone: json['dateWithTimezone'] == null
          ? null
          : DateTime.parse(json['dateWithTimezone'] as String),
      freshSnow: (json['freshSnow'] as num?)?.toInt(),
      snowHeight: json['snowHeight'],
      weather: json['weather'] == null
          ? null
          : Weather.fromJson(json['weather'] as Map<String, dynamic>),
      prec: json['prec'] == null
          ? null
          : Prec.fromJson(json['prec'] as Map<String, dynamic>),
      sunHours: (json['sunHours'] as num?)?.toInt(),
      rainHours: json['rainHours'],
      temperature: json['temperature'] == null
          ? null
          : SnowLine.fromJson(json['temperature'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      windchill: json['windchill'] == null
          ? null
          : SnowLine.fromJson(json['windchill'] as Map<String, dynamic>),
      snowLine: json['snowLine'] == null
          ? null
          : SnowLine.fromJson(json['snowLine'] as Map<String, dynamic>),
      astronomy: json['astronomy'] == null
          ? null
          : Astronomy.fromJson(json['astronomy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'dateWithTimezone': instance.dateWithTimezone?.toIso8601String(),
      'freshSnow': instance.freshSnow,
      'snowHeight': instance.snowHeight,
      'weather': instance.weather,
      'prec': instance.prec,
      'sunHours': instance.sunHours,
      'rainHours': instance.rainHours,
      'temperature': instance.temperature,
      'wind': instance.wind,
      'windchill': instance.windchill,
      'snowLine': instance.snowLine,
      'astronomy': instance.astronomy,
    };

_$AstronomyImpl _$$AstronomyImplFromJson(Map<String, dynamic> json) =>
    _$AstronomyImpl(
      dawn:
          json['dawn'] == null ? null : DateTime.parse(json['dawn'] as String),
      sunrise: json['sunrise'] == null
          ? null
          : DateTime.parse(json['sunrise'] as String),
      suntransit: json['suntransit'] == null
          ? null
          : DateTime.parse(json['suntransit'] as String),
      sunset: json['sunset'] == null
          ? null
          : DateTime.parse(json['sunset'] as String),
      dusk:
          json['dusk'] == null ? null : DateTime.parse(json['dusk'] as String),
      moonrise: json['moonrise'] == null
          ? null
          : DateTime.parse(json['moonrise'] as String),
      moontransit: json['moontransit'] == null
          ? null
          : DateTime.parse(json['moontransit'] as String),
      moonset: json['moonset'] == null
          ? null
          : DateTime.parse(json['moonset'] as String),
      moonphase: (json['moonphase'] as num?)?.toDouble(),
      moonzodiac: (json['moonzodiac'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AstronomyImplToJson(_$AstronomyImpl instance) =>
    <String, dynamic>{
      'dawn': instance.dawn?.toIso8601String(),
      'sunrise': instance.sunrise?.toIso8601String(),
      'suntransit': instance.suntransit?.toIso8601String(),
      'sunset': instance.sunset?.toIso8601String(),
      'dusk': instance.dusk?.toIso8601String(),
      'moonrise': instance.moonrise?.toIso8601String(),
      'moontransit': instance.moontransit?.toIso8601String(),
      'moonset': instance.moonset?.toIso8601String(),
      'moonphase': instance.moonphase,
      'moonzodiac': instance.moonzodiac,
    };

_$PrecImpl _$$PrecImplFromJson(Map<String, dynamic> json) => _$PrecImpl(
      sum: (json['sum'] as num?)?.toDouble(),
      probability: (json['probability'] as num?)?.toDouble(),
      sumAsRain: (json['sumAsRain'] as num?)?.toDouble(),
      precClass: (json['precClass'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PrecImplToJson(_$PrecImpl instance) =>
    <String, dynamic>{
      'sum': instance.sum,
      'probability': instance.probability,
      'sumAsRain': instance.sumAsRain,
      'precClass': instance.precClass,
    };

_$SnowLineImpl _$$SnowLineImplFromJson(Map<String, dynamic> json) =>
    _$SnowLineImpl(
      avg: (json['avg'] as num?)?.toDouble(),
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$SnowLineImplToJson(_$SnowLineImpl instance) =>
    <String, dynamic>{
      'avg': instance.avg,
      'min': instance.min,
      'max': instance.max,
      'unit': instance.unit,
    };

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      state: (json['state'] as num?)?.toInt(),
      text: json['text'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'text': instance.text,
      'icon': instance.icon,
    };

_$WindImpl _$$WindImplFromJson(Map<String, dynamic> json) => _$WindImpl(
      unit: json['unit'] as String?,
      direction: json['direction'] as String?,
      text: json['text'] as String?,
      avg: (json['avg'] as num?)?.toDouble(),
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      gusts: json['gusts'] == null
          ? null
          : Gusts.fromJson(json['gusts'] as Map<String, dynamic>),
      significationWind: json['significationWind'] as bool?,
    );

Map<String, dynamic> _$$WindImplToJson(_$WindImpl instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'direction': instance.direction,
      'text': instance.text,
      'avg': instance.avg,
      'min': instance.min,
      'max': instance.max,
      'gusts': instance.gusts,
      'significationWind': instance.significationWind,
    };

_$GustsImpl _$$GustsImplFromJson(Map<String, dynamic> json) => _$GustsImpl(
      value: (json['value'] as num?)?.toDouble(),
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$GustsImplToJson(_$GustsImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'text': instance.text,
    };
