import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/usecases/local_usecase.dart';
import 'package:scheduler/lang/languages.dart';
import 'package:scheduler/routes/pages.dart';
import 'package:scheduler/routes/routes.dart';
import 'package:scheduler/theme/app_theme.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late String initialRoute;
  LocalUseCases useCases = Get.find();
  Locale? locale;
  @override
  void initState() {
    if (useCases.didPassIntro()) {
      final lastRoute = useCases.getLastRoute();
      if (lastRoute.hasText) {
        initialRoute = lastRoute!;
      } else {
        initialRoute = Routes.home;
      }
    } else {
      initialRoute = Routes.onboarding;
    }
    final lang = useCases.getLanguage();
    if (lang == null) {
      locale = Get.deviceLocale;
    } else {
      locale = Locale(lang);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: locale,
      translations: Languages(),
      supportedLocales: const [Locale('vi', 'VI'), Locale('en', 'US')],
      fallbackLocale: const Locale('en', 'US'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: useCases.getThemeMode(),
      getPages: AppPages.pages,
      initialRoute: initialRoute,
    );
  }
}
