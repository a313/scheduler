const PASS_INTRO = "_pass_intro";
const LAST_ROUTE = "_last_route";

abstract class LocalDataRepo {
  void setPassIntro(bool value);
  bool didPassIntro();

  void savedLastRoute(String route);

  String? getLastRoute();
}
