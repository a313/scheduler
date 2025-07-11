import 'dart:async';

import 'package:aio/core/utils/util.dart';
import 'package:aio/device_info.dart';
import 'package:aio/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'app.dart';
// ignore: unused_import
import 'core/utils/helper/sql_helper.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await GetStorage.init();
    if (kDebugMode) {
      // await DbHelper().replaceDatabase();
      // Utils().cloneDb();
    }
    await DependencyInjection.injection();
    await DeviceInfo().getDeviceInfo();

    if (isMobile) {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('app_icon');
      const DarwinInitializationSettings initializationSettingsDarwin =
          DarwinInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
      );

      const InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
        macOS: initializationSettingsDarwin,
      );
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    }
    tz.initializeTimeZones();

    runApp(const MainApp());
  }, (error, stackTrace) {
    debugPrint(stackTrace.toString());
    // DebugHelper.addException(ExceptionData(error: error, stack: stackTrace));
    if (isMobile) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
  });
}
