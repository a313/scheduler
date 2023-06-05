import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:scheduler/routes/pages.dart';
import 'package:scheduler/routes/routes.dart';
import 'package:scheduler/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('vi', 'VI'),
      supportedLocales: const [Locale('vi', 'VI')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme().lightTheme,
      getPages: AppPages.pages,
      initialRoute: Routes.onboarding,
    );
  }
}
