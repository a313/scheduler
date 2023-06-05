import 'package:flutter/material.dart';

import 'app_light_colors.dart';

class AppTheme {
  final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppLightColors.neutral100,
    primaryColor: AppLightColors.primaryOrange,
    colorScheme: const ColorScheme.light(
        background: AppLightColors.neutral100,
        error: AppLightColors.funcRadicalRed),

    disabledColor: AppLightColors.neutral1100.withOpacity(0.24),
    cardColor: AppLightColors.neutral100,
    secondaryHeaderColor: AppLightColors.primaryOrange,
    hintColor: AppLightColors.primaryDark,
    splashColor: AppLightColors.transparent,

    highlightColor: AppLightColors.neutral300,
    buttonTheme: const ButtonThemeData(
      height: 48,
      buttonColor: AppLightColors.primaryOrange,
      disabledColor: AppLightColors.neutral200,
      hoverColor: AppLightColors.primaryOrange,
      highlightColor: AppLightColors.primaryOrange,
    ),
    // inputDecorationTheme: const InputDecorationTheme(),
    appBarTheme: const AppBarTheme().copyWith(
      shadowColor: AppLightColors.neutral200,
      color: AppLightColors.neutral100,
      centerTitle: true,
      elevation: 0.5,
      iconTheme: const IconThemeData(color: AppLightColors.primaryDark),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppLightColors.primaryDark,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  final darkTheme = ThemeData.dark();
}
