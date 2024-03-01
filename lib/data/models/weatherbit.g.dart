// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherbit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForecastImpl _$$ForecastImplFromJson(Map<String, dynamic> json) =>
    _$ForecastImpl(
      cityName: json['city_name'] as String?,
      stateCode: json['state_code'] as String?,
      countryCode: json['country_code'] as String?,
      lat: json['lat'] as num?,
      lon: json['lon'] as num?,
      timezone: json['timezone'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WeatherInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ForecastImplToJson(_$ForecastImpl instance) =>
    <String, dynamic>{
      'city_name': instance.cityName,
      'state_code': instance.stateCode,
      'country_code': instance.countryCode,
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'data': instance.data,
    };

_$CurrentWeatherImpl _$$CurrentWeatherImplFromJson(Map<String, dynamic> json) =>
    _$CurrentWeatherImpl(
      count: json['count'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WeatherInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CurrentWeatherImplToJson(
        _$CurrentWeatherImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data,
    };

_$WeatherInfoImpl _$$WeatherInfoImplFromJson(Map<String, dynamic> json) =>
    _$WeatherInfoImpl(
      ts: json['ts'] as num?,
      timestampLocal: json['timestamp_local'] == null
          ? null
          : DateTime.parse(json['timestamp_local'] as String),
      timestampUtc: json['timestamp_utc'] == null
          ? null
          : DateTime.parse(json['timestamp_utc'] as String),
      datetime: json['datetime'] as String?,
      snow: json['snow'] as num?,
      snowDepth: json['snow_depth'] as int?,
      precip: json['precip'] as num?,
      temp: json['temp'] as num?,
      dewpt: json['dewpt'] as num?,
      maxTemp: json['max_temp'] as num?,
      minTemp: json['min_temp'] as num?,
      appMaxTemp: json['app_max_temp'] as num?,
      appMinTemp: json['app_min_temp'] as num?,
      rh: json['rh'] as int?,
      clouds: json['clouds'] as int?,
      weather: json['weather'] == null
          ? null
          : Weather.fromJson(json['weather'] as Map<String, dynamic>),
      slp: json['slp'] as num?,
      pres: json['pres'] as num?,
      uv: json['uv'] as num?,
      maxDhi: json['max_dhi'] as num?,
      vis: json['vis'] as num?,
      pop: json['pop'] as num?,
      moonPhase: json['moon_phase'] as num?,
      sunriseTs: json['sunrise_ts'] as int?,
      sunsetTs: json['sunset_ts'] as int?,
      moonriseTs: json['moonrise_ts'] as int?,
      moonsetTs: json['moonset_ts'] as int?,
      pod: json['pod'] as String?,
      windSpd: json['wind_spd'] as num?,
      windDir: json['wind_dir'] as int?,
      windCdir: json['wind_cdir'] as String?,
      windCdirFull: json['wind_cdir_full'] as String?,
      appTemp: (json['app_temp'] as num?)?.toDouble(),
      aqi: json['aqi'] as int?,
      cityName: json['city_name'] as String?,
      countryCode: json['country_code'] as String?,
      dhi: (json['dhi'] as num?)?.toDouble(),
      dni: (json['dni'] as num?)?.toDouble(),
      elevAngle: (json['elev_angle'] as num?)?.toDouble(),
      ghi: (json['ghi'] as num?)?.toDouble(),
      gust: (json['gust'] as num?)?.toDouble(),
      hAngle: (json['h_angle'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      obTime: json['ob_time'] as String?,
      solarRad: (json['solar_rad'] as num?)?.toDouble(),
      sources:
          (json['sources'] as List<dynamic>?)?.map((e) => e as String).toList(),
      stateCode: json['state_code'] as String?,
      station: json['station'] as String?,
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$$WeatherInfoImplToJson(_$WeatherInfoImpl instance) =>
    <String, dynamic>{
      'ts': instance.ts,
      'timestamp_local': instance.timestampLocal?.toIso8601String(),
      'timestamp_utc': instance.timestampUtc?.toIso8601String(),
      'datetime': instance.datetime,
      'snow': instance.snow,
      'snow_depth': instance.snowDepth,
      'precip': instance.precip,
      'temp': instance.temp,
      'dewpt': instance.dewpt,
      'max_temp': instance.maxTemp,
      'min_temp': instance.minTemp,
      'app_max_temp': instance.appMaxTemp,
      'app_min_temp': instance.appMinTemp,
      'rh': instance.rh,
      'clouds': instance.clouds,
      'weather': instance.weather,
      'slp': instance.slp,
      'pres': instance.pres,
      'uv': instance.uv,
      'max_dhi': instance.maxDhi,
      'vis': instance.vis,
      'pop': instance.pop,
      'moon_phase': instance.moonPhase,
      'sunrise_ts': instance.sunriseTs,
      'sunset_ts': instance.sunsetTs,
      'moonrise_ts': instance.moonriseTs,
      'moonset_ts': instance.moonsetTs,
      'pod': instance.pod,
      'wind_spd': instance.windSpd,
      'wind_dir': instance.windDir,
      'wind_cdir': instance.windCdir,
      'wind_cdir_full': instance.windCdirFull,
      'app_temp': instance.appTemp,
      'aqi': instance.aqi,
      'city_name': instance.cityName,
      'country_code': instance.countryCode,
      'dhi': instance.dhi,
      'dni': instance.dni,
      'elev_angle': instance.elevAngle,
      'ghi': instance.ghi,
      'gust': instance.gust,
      'h_angle': instance.hAngle,
      'lat': instance.lat,
      'lon': instance.lon,
      'ob_time': instance.obTime,
      'solar_rad': instance.solarRad,
      'sources': instance.sources,
      'state_code': instance.stateCode,
      'station': instance.station,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'timezone': instance.timezone,
    };

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      icon: json['icon'] as String?,
      code: json['code'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'code': instance.code,
      'description': instance.description,
    };
