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
}
