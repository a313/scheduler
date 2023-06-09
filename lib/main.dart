import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scheduler/injection.dart';

import 'app.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    await DependencyInjection.injection();
    runApp(const MainApp());
  }, (error, stackTrace) {
    // DebugHelper.addException(ExceptionData(error: error, stack: stackTrace));
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
