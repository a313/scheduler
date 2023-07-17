import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scheduler/injection.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'app.dart';
// ignore: unused_import
import 'core/utils/helper/sql_helper.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();

    if (kDebugMode) {
      // await DbHelper().replaceDatabase();
    }

    await DependencyInjection.injection();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
    tz.initializeTimeZones();

    runApp(const MainApp());
  }, (error, stackTrace) {
    debugPrint(stackTrace.toString());
    // DebugHelper.addException(ExceptionData(error: error, stack: stackTrace));
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
