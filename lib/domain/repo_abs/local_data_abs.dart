const PASS_INTRO = "_pass_intro";
const LAST_ROUTE = "_last_route";

abstract class LocalData {
  void setPassIntro(bool value);
  bool didPassIntro();

  void savedLastRoute(String route);

  String? getLastRoute();
}
