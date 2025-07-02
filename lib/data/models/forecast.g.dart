// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Forecast _$ForecastFromJson(Map<String, dynamic> json) => _Forecast(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
  forecastDate:
      json['forecastDate'] == null
          ? null
          : DateTime.parse(json['forecastDate'] as String),
  nextUpdate:
      json['nextUpdate'] == null
          ? null
          : DateTime.parse(json['nextUpdate'] as String),
  source: json['source'] as String?,
  point: json['point'] as String?,
  fingerprint: json['fingerprint'] as String?,
);

Map<String, dynamic> _$ForecastToJson(_Forecast instance) => <String, dynamic>{
  'items': instance.items,
  'forecastDate': instance.forecastDate?.toIso8601String(),
  'nextUpdate': instance.nextUpdate?.toIso8601String(),
  'source': instance.source,
  'point': instance.point,
  'fingerprint': instance.fingerprint,
};

_Item _$ItemFromJson(Map<String, dynamic> json) => _Item(
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  dateWithTimezone:
      json['dateWithTimezone'] == null
          ? null
          : DateTime.parse(json['dateWithTimezone'] as String),
  freshSnow: (json['freshSnow'] as num?)?.toInt(),
  snowHeight: json['snowHeight'],
  weather:
      json['weather'] == null
          ? null
          : Weather.fromJson(json['weather'] as Map<String, dynamic>),
  prec:
      json['prec'] == null
          ? null
          : Prec.fromJson(json['prec'] as Map<String, dynamic>),
  sunHours: (json['sunHours'] as num?)?.toInt(),
  rainHours: json['rainHours'],
  temperature:
      json['temperature'] == null
          ? null
          : SnowLine.fromJson(json['temperature'] as Map<String, dynamic>),
  wind:
      json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
  windchill:
      json['windchill'] == null
          ? null
          : SnowLine.fromJson(json['windchill'] as Map<String, dynamic>),
  snowLine:
      json['snowLine'] == null
          ? null
          : SnowLine.fromJson(json['snowLine'] as Map<String, dynamic>),
  astronomy:
      json['astronomy'] == null
          ? null
          : Astronomy.fromJson(json['astronomy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(_Item instance) => <String, dynamic>{
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

_Astronomy _$AstronomyFromJson(Map<String, dynamic> json) => _Astronomy(
  dawn: json['dawn'] == null ? null : DateTime.parse(json['dawn'] as String),
  sunrise:
      json['sunrise'] == null
          ? null
          : DateTime.parse(json['sunrise'] as String),
  suntransit:
      json['suntransit'] == null
          ? null
          : DateTime.parse(json['suntransit'] as String),
  sunset:
      json['sunset'] == null ? null : DateTime.parse(json['sunset'] as String),
  dusk: json['dusk'] == null ? null : DateTime.parse(json['dusk'] as String),
  moonrise:
      json['moonrise'] == null
          ? null
          : DateTime.parse(json['moonrise'] as String),
  moontransit:
      json['moontransit'] == null
          ? null
          : DateTime.parse(json['moontransit'] as String),
  moonset:
      json['moonset'] == null
          ? null
          : DateTime.parse(json['moonset'] as String),
  moonphase: (json['moonphase'] as num?)?.toDouble(),
  moonzodiac: (json['moonzodiac'] as num?)?.toDouble(),
);

Map<String, dynamic> _$AstronomyToJson(_Astronomy instance) =>
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

_Prec _$PrecFromJson(Map<String, dynamic> json) => _Prec(
  sum: (json['sum'] as num?)?.toDouble(),
  probability: (json['probability'] as num?)?.toDouble(),
  sumAsRain: (json['sumAsRain'] as num?)?.toDouble(),
  precClass: (json['precClass'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PrecToJson(_Prec instance) => <String, dynamic>{
  'sum': instance.sum,
  'probability': instance.probability,
  'sumAsRain': instance.sumAsRain,
  'precClass': instance.precClass,
};

_SnowLine _$SnowLineFromJson(Map<String, dynamic> json) => _SnowLine(
  avg: (json['avg'] as num?)?.toDouble(),
  min: (json['min'] as num?)?.toDouble(),
  max: (json['max'] as num?)?.toDouble(),
  unit: json['unit'] as String?,
);

Map<String, dynamic> _$SnowLineToJson(_SnowLine instance) => <String, dynamic>{
  'avg': instance.avg,
  'min': instance.min,
  'max': instance.max,
  'unit': instance.unit,
};

_Weather _$WeatherFromJson(Map<String, dynamic> json) => _Weather(
  state: (json['state'] as num?)?.toInt(),
  text: json['text'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$WeatherToJson(_Weather instance) => <String, dynamic>{
  'state': instance.state,
  'text': instance.text,
  'icon': instance.icon,
};

_Wind _$WindFromJson(Map<String, dynamic> json) => _Wind(
  unit: json['unit'] as String?,
  direction: json['direction'] as String?,
  text: json['text'] as String?,
  avg: (json['avg'] as num?)?.toDouble(),
  min: (json['min'] as num?)?.toDouble(),
  max: (json['max'] as num?)?.toDouble(),
  gusts:
      json['gusts'] == null
          ? null
          : Gusts.fromJson(json['gusts'] as Map<String, dynamic>),
  significationWind: json['significationWind'] as bool?,
);

Map<String, dynamic> _$WindToJson(_Wind instance) => <String, dynamic>{
  'unit': instance.unit,
  'direction': instance.direction,
  'text': instance.text,
  'avg': instance.avg,
  'min': instance.min,
  'max': instance.max,
  'gusts': instance.gusts,
  'significationWind': instance.significationWind,
};

_Gusts _$GustsFromJson(Map<String, dynamic> json) => _Gusts(
  value: (json['value'] as num?)?.toDouble(),
  text: json['text'] as String?,
);

Map<String, dynamic> _$GustsToJson(_Gusts instance) => <String, dynamic>{
  'value': instance.value,
  'text': instance.text,
};
