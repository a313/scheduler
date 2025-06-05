import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';
import 'package:aio/device_info.dart';

const SHOW_EVENT_TRACKING_LOG = true;

abstract class EventTracking {
  final String name;

  Map<String, String>? other;
  String? click;
  bool? state;
  int? index;
  int? timeStamp;
  int? delta;

  EventTracking({required this.name});

  Map<String, String> get params => _getParams();

  Map<String, String> _getParams() {
    final Map<String, String> p = {
      "current_route": Get.currentRoute,
      "previous_route": Get.previousRoute,
      "time_stamp": timeStamp?.toString() ?? "",
      "delta": delta?.toString() ?? "",
      "device": DeviceInfo().deviceUUID ?? '',
    };

    if (other != null) p.addAll(other!);
    return p;
  }
}

class EventManager {
  static final FirebaseAnalytics _firebaseAnalytics =
      FirebaseAnalytics.instance;

  factory EventManager() => _instance ??= EventManager._();
  static EventManager? _instance;

  EventManager._();

  static void fire(EventTracking event) {
    final now = DateTime.now();
    event.timeStamp = now.millisecondsSinceEpoch;
    _firebaseAnalytics.logEvent(name: event.name, parameters: event.params);
    log("name:${event.name} params:${event.params.toString()}",
        name: "Event Tracking");
  }
}
