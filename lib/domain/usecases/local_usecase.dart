import 'package:scheduler/domain/repo_abs/local_data_abs.dart';

class LocalUseCases {
  final LocalData _;

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
}
