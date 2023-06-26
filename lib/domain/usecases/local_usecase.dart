import 'package:scheduler/domain/repo_abs/local_data_repo_abs.dart';

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

  List<String>? getRecentPage() {
    return _.getRecentPage();
  }

  void savedRecentPage(List<String> pages) {
    return _.savedRecentPage(pages);
  }
}
