import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/usecases/local_usecase.dart';
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
  @override
  void initState() {
    LocalUseCases useCases = Get.find();
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
    super.initState();
  }

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
      initialRoute: initialRoute,
    );
  }
}
