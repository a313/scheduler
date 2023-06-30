const PASS_INTRO = "_pass_intro";
const LAST_ROUTE = "_last_route";
const LAST_GEN_TIME = "_last_gen_time";
const PINNED_FEATURES = "_pinned";
const OTHER_FEATURES = "_other";
const LANGUAGE = "_lang";

abstract class LocalDataRepo {
  void setPassIntro(bool value);
  bool didPassIntro();

  void savedLastRoute(String route);

  String? getLastRoute();

  DateTime? getLastGenerateTime();
  void savedLastGenerateTime(DateTime time);

  List<String>? getPinFeatures();

  void savedPinFeatures(List<String> keys);

  List<String>? getOtherFeatures();

  void savedOtherFeatures(List<String> keys);

  String? getLanguage();

  void savedLanguage(String? lang);
}
