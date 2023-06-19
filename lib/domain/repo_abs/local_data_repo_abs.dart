const PASS_INTRO = "_pass_intro";
const LAST_ROUTE = "_last_route";
const LAST_GEN_TIME = "_last_gen_time";

abstract class LocalDataRepo {
  void setPassIntro(bool value);
  bool didPassIntro();

  void savedLastRoute(String route);

  String? getLastRoute();

  DateTime? getLastGenerateTime();
  void savedLastGenerateTime(DateTime time);
}
