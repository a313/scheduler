import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scheduler/data/models/weatherbit.dart';
import 'package:scheduler/domain/repo_abs/local_data_repo_abs.dart';

class LocalDataImpl extends LocalDataRepo {
  final GetStorage _;

  LocalDataImpl(this._);
  @override
  bool didPassIntro() {
    return _.read<bool>(PASS_INTRO) ?? false;
  }

  @override
  Future<void> setPassIntro(bool value) {
    return _.write(PASS_INTRO, value);
  }

  @override
  String? getLastRoute() {
    return _.read<String>(LAST_ROUTE);
  }

  @override
  Future<void> savedLastRoute(String route) {
    return _.write(LAST_ROUTE, route);
  }

  @override
  DateTime? getLastGenerateTime() {
    final millisecondsSinceEpoch = _.read<int>(LAST_GEN_TIME);
    if (millisecondsSinceEpoch == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  @override
  Future<void> savedLastGenerateTime(DateTime time) {
    return _.write(LAST_GEN_TIME, time.millisecondsSinceEpoch);
  }

  @override
  List<String>? getPinFeatures() {
    final t = _.read(PINNED_FEATURES);
    if (t == null) return null;
    return List<String>.from(t);
  }

  @override
  Future<void> savedPinFeatures(List<String> keys) {
    return _.write(PINNED_FEATURES, keys);
  }

  @override
  List<String>? getOtherFeatures() {
    final t = _.read(OTHER_FEATURES);
    if (t == null) return null;
    return List<String>.from(t);
  }

  @override
  Future<void> savedOtherFeatures(List<String> keys) {
    return _.write(OTHER_FEATURES, keys);
  }

  @override
  String? getLanguage() {
    return _.read(LANGUAGE);
  }

  @override
  Future<void> savedLanguage(String? lang) {
    return _.write(LANGUAGE, lang);
  }

  @override
  ThemeMode getThemeMode() {
    final key = _.read(THEME);
    if (key == 'light') return ThemeMode.light;
    if (key == 'dark') return ThemeMode.dark;
    return ThemeMode.system;
  }

  @override
  Future<void> savedThemeMode(String name) {
    return _.write(THEME, name);
  }

  @override
  CurrentWeather? getLastCurrentWeather() {
    final data = _.read(CURRENT_WEATHER);
    if (data is CurrentWeather) {
      return data;
    } else if (data is Map) {
      return CurrentWeather.fromJson(data as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  @override
  Forecast? getLastForecast() {
    final data = _.read(FORECAST);
    if (data is Forecast) {
      return data;
    } else if (data is Map) {
      return Forecast.fromJson(data as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  @override
  DateTime? getLastUpdateCurrentWeather() {
    final millisecondsSinceEpoch = _.read<int>(LAST_UPDATE_WEATHER);
    if (millisecondsSinceEpoch == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  @override
  DateTime? getLastUpdateForecastSummary() {
    final millisecondsSinceEpoch = _.read<int>(LAST_UPDATE_FORECAST);
    if (millisecondsSinceEpoch == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  @override
  Future<void> savedLastCurrentWeather(CurrentWeather data) {
    return _.write(CURRENT_WEATHER, data);
  }

  @override
  Future<void> savedLastForecast(Forecast data) {
    return _.write(FORECAST, data);
  }

  @override
  Future<void> savedLastUpdateCurrentWeather(DateTime time) {
    return _.write(LAST_UPDATE_WEATHER, time.millisecondsSinceEpoch);
  }

  @override
  Future<void> savedLastUpdateForecastSummary(DateTime time) {
    return _.write(LAST_UPDATE_FORECAST, time.millisecondsSinceEpoch);
  }

  @override
  DateTime? getLastPeriods() {
    final millisecondsSinceEpoch = _.read<int>(LAST_PERIODS);
    if (millisecondsSinceEpoch == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  @override
  Future<void> savedLastPeriods(DateTime time) {
    return _.write(LAST_PERIODS, time.millisecondsSinceEpoch);
  }

  @override
  int? getPeriodsDuration() {
    return _.read<int>(PERIODS_DURATION);
  }

  @override
  Future<void> savedPeriodsDuration(int dur) {
    return _.write(PERIODS_DURATION, dur);
  }
}
