import 'package:flutter/src/material/app.dart';
import 'package:get_storage/get_storage.dart';
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
}
