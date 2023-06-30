import 'package:flutter/material.dart';
import 'package:scheduler/domain/repo_abs/local_data_repo_abs.dart';

import '../entities/feature.dart';

class LocalUseCases {
  final LocalDataRepo _;

  LocalUseCases(this._);
  void setPassIntro(bool value) {
    _.setPassIntro(value);
  }

  bool didPassIntro() {
    return _.didPassIntro();
  }

  void savedLastRoute(String route) {
    return _.savedLastRoute(route);
  }

  String? getLastRoute() {
    return _.getLastRoute();
  }

  DateTime? getLastGenerateTime() {
    return _.getLastGenerateTime();
  }

  void savedLastGenerateTime(DateTime time) {
    return _.savedLastGenerateTime(time);
  }

  List<String> getPinFeatures() {
    return _.getPinFeatures() ??
        [eventPage, timeTablePage, reminderPage, reportPage];
  }

  void savedPinFeatures(List<String> keys) {
    return _.savedPinFeatures(keys);
  }

  List<String> getOtherFeatures() {
    return _.getOtherFeatures() ?? [classPage, studentPage, hexPage];
  }

  void savedOtherFeatures(List<String> keys) {
    return _.savedOtherFeatures(keys);
  }

  String? getLanguage() {
    return _.getLanguage();
  }

  void savedLanguage(String? lang) {
    return _.savedLanguage(lang);
  }

  ThemeMode getThemeMode() {
    return _.getThemeMode();
  }

  void savedThemeMode(ThemeMode mode) {
    return _.savedThemeMode(mode.name);
  }
}
