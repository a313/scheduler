import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_dark_colors.dart';
import 'app_light_colors.dart';

class AppTheme {
  final lightTheme = ThemeData.light().copyWith(
    textTheme: GoogleFonts.manropeTextTheme(),
    scaffoldBackgroundColor: AppLightColors.neutral100,
    primaryColor: AppLightColors.primaryLight,
    colorScheme: const ColorScheme.light(
        background: AppLightColors.neutral100,
        error: AppLightColors.funcRadicalRed),

    disabledColor: AppLightColors.neutral1100.withOpacity(0.24),
    cardColor: AppLightColors.neutral100,
    secondaryHeaderColor: AppLightColors.primaryLight,
    hintColor: AppLightColors.primaryDark,
    splashColor: AppLightColors.transparent,

    highlightColor: AppLightColors.neutral300,
    buttonTheme: const ButtonThemeData(
      height: 48,
      buttonColor: AppLightColors.primaryLight,
      disabledColor: AppLightColors.neutral200,
      hoverColor: AppLightColors.primaryLight,
      highlightColor: AppLightColors.primaryLight,
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

  final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppDarkColors.neutral100,
    primaryColor: AppDarkColors.primaryLight,
    colorScheme: const ColorScheme.light(
        background: AppDarkColors.neutral100,
        error: AppDarkColors.funcRadicalRed),

    disabledColor: AppDarkColors.neutral1100.withOpacity(0.24),
    cardColor: AppDarkColors.neutral100,
    secondaryHeaderColor: AppDarkColors.primaryLight,
    hintColor: AppDarkColors.primaryDark,
    splashColor: AppDarkColors.transparent,

    highlightColor: AppDarkColors.neutral300,
    buttonTheme: const ButtonThemeData(
      height: 48,
      buttonColor: AppDarkColors.primaryLight,
      disabledColor: AppDarkColors.neutral200,
      hoverColor: AppDarkColors.primaryLight,
      highlightColor: AppDarkColors.primaryLight,
    ),
    // inputDecorationTheme: const InputDecorationTheme(),
    appBarTheme: const AppBarTheme().copyWith(
      shadowColor: AppDarkColors.neutral200,
      color: AppDarkColors.neutral100,
      centerTitle: true,
      elevation: 0.5,
      iconTheme: const IconThemeData(color: AppDarkColors.primaryDark),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppDarkColors.primaryDark,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
