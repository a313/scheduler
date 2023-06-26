const PASS_INTRO = "_pass_intro";
const LAST_ROUTE = "_last_route";
const LAST_GEN_TIME = "_last_gen_time";
const RECENT_PAGE = "_recent_page";

abstract class LocalDataRepo {
  void setPassIntro(bool value);
  bool didPassIntro();

  void savedLastRoute(String route);

  String? getLastRoute();

  DateTime? getLastGenerateTime();
  void savedLastGenerateTime(DateTime time);

  List<String>? getRecentPage();

  void savedRecentPage(List<String> pages);
}
