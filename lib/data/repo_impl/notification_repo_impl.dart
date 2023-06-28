import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:scheduler/domain/repo_abs/notification_repo_abs.dart';
import 'package:timezone/timezone.dart';

class NotificationRepoImpl extends NotificationRepo {
  late FlutterLocalNotificationsPlugin _;

  NotificationRepoImpl() {
    _ = FlutterLocalNotificationsPlugin();
    init();
  }
  void init() {
    _.initialize(
        const InitializationSettings(iOS: DarwinInitializationSettings()));
  }

  @override
  void cancelAll() {
    _.cancelAll();
  }

  @override
  void show(String title, String desc) {
    _.show(0, title, desc, const NotificationDetails());
  }

  @override
  void createNoti(int id, String title, String desc, DateTime time) {
    log('CreateNoti $title - $desc At:${time.toIso8601String()}');
    const detail = NotificationDetails(
      iOS: DarwinNotificationDetails(sound: 'sound/meoi.caf'),
      android: AndroidNotificationDetails(
        'android_id',
        'android_name',
        sound: RawResourceAndroidNotificationSound('assets/sound/meoi.mp4'),
      ),
    );
    _.zonedSchedule(id, title, desc, TZDateTime.from(time.toUtc(), UTC), detail,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
