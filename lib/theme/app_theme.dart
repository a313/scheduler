import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduler/theme/app_light_colors.dart';

class AppTheme {
  final lightTheme = ThemeData.light(useMaterial3: false).copyWith(
    textTheme: GoogleFonts.openSansTextTheme(),
    iconTheme: const IconThemeData(color: AppLightColors.iconColor, size: 28),
    scaffoldBackgroundColor: AppLightColors.neutral100,
    primaryColor: AppLightColors.primaryLight,
    // colorScheme: const ColorScheme.light(
    //   background: AppLightColors.neutral100,
    //   error: AppLightColors.funcRadicalRed,
    // ),
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    disabledColor: AppLightColors.neutral1100.withOpacity(0.24),
    cardColor: AppLightColors.neutral100,
    secondaryHeaderColor: AppLightColors.primaryLight,
    hintColor: AppLightColors.primaryDark,
    buttonTheme: const ButtonThemeData(
      height: 48,
      buttonColor: AppLightColors.primaryLight,
      disabledColor: AppLightColors.neutral200,
      hoverColor: AppLightColors.primaryLight,
      highlightColor: AppLightColors.primaryLight,
    ),

    appBarTheme: const AppBarTheme().copyWith(
        color: AppLightColors.primaryDark,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppLightColors.neutral100),
        actionsIconTheme:
            const IconThemeData(color: AppLightColors.neutral800)),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppLightColors.primaryDark,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  final darkTheme = ThemeData.dark(useMaterial3: false).copyWith(
    textTheme: GoogleFonts.openSansTextTheme(),
    //   iconTheme: const IconThemeData(color: AppDarkColors.iconColor, size: 28),
    //   scaffoldBackgroundColor: AppDarkColors.neutral200,
    //   primaryColor: AppDarkColors.neutral1100,
    //   colorScheme: const ColorScheme.dark(
    //     background: AppDarkColors.neutral100,
    //     error: AppDarkColors.funcRadicalRed,
    //   ),
    //   highlightColor: Colors.transparent,
    //   splashColor: Colors.transparent,
    //   hoverColor: Colors.transparent,
    //   disabledColor: AppDarkColors.neutral100.withOpacity(0.24),
    //   cardColor: AppDarkColors.neutral100,
    //   secondaryHeaderColor: AppDarkColors.primaryLight,
    //   hintColor: AppDarkColors.primaryDark,
    //   buttonTheme: const ButtonThemeData(
    //     height: 48,
    //     buttonColor: AppDarkColors.primaryLight,
    //     disabledColor: AppDarkColors.neutral200,
    //     hoverColor: AppDarkColors.primaryLight,
    //     highlightColor: AppDarkColors.primaryLight,
    //   ),
    //   appBarTheme: const AppBarTheme(
    //     color: AppDarkColors.neutral100,
    //     centerTitle: true,
    //     elevation: 0,
    //     iconTheme: IconThemeData(color: AppDarkColors.funcCornflowerBlue),
    //   ),
    //   textSelectionTheme: const TextSelectionThemeData(
    //     cursorColor: AppDarkColors.primaryDark,
    //   ),
  );
}
