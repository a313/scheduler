import 'package:flutter/material.dart';

import '../../../theme/app_dark_colors.dart';
import '../../../theme/app_light_colors.dart';

extension BuildContextExtension on BuildContext {
  bool get isLightMode => true;

  Color get transparent => Colors.transparent;

  Color get primaryDark =>
      isLightMode ? AppLightColors.primaryDark : AppDarkColors.primaryDark;
  Color get primaryLight =>
      isLightMode ? AppLightColors.primaryLight : AppDarkColors.primaryLight;
  Color get disableColor =>
      isLightMode ? AppLightColors.disableColor : AppDarkColors.disableColor;

  Color get funcBitterLemon => isLightMode
      ? AppLightColors.funcBitterLemon
      : AppDarkColors.funcBitterLemon;
  Color get func80 =>
      isLightMode ? AppLightColors.func80 : AppDarkColors.func80;
  Color get funcIcterine =>
      isLightMode ? AppLightColors.funcIcterine : AppDarkColors.funcIcterine;
  Color get funcCornflowerBlue => isLightMode
      ? AppLightColors.funcCornflowerBlue
      : AppDarkColors.funcCornflowerBlue;
  Color get funcRadicalRed => isLightMode
      ? AppLightColors.funcRadicalRed
      : AppDarkColors.funcRadicalRed;

  Color get neutral100 =>
      isLightMode ? AppLightColors.neutral100 : AppDarkColors.neutral1100;
  Color get neutral200 =>
      isLightMode ? AppLightColors.neutral200 : AppDarkColors.neutral1000;
  Color get neutral300 =>
      isLightMode ? AppLightColors.neutral300 : AppDarkColors.neutral900;
  Color get neutral400 =>
      isLightMode ? AppLightColors.neutral400 : AppDarkColors.neutral800;
  Color get neutral500 =>
      isLightMode ? AppLightColors.neutral500 : AppDarkColors.neutral700;
  Color get neutral600 =>
      isLightMode ? AppLightColors.neutral600 : AppDarkColors.neutral600;
  Color get neutral700 =>
      isLightMode ? AppLightColors.neutral700 : AppDarkColors.neutral500;
  Color get neutral800 =>
      isLightMode ? AppLightColors.neutral800 : AppDarkColors.neutral400;
  Color get neutral900 =>
      isLightMode ? AppLightColors.neutral900 : AppDarkColors.neutral300;
  Color get neutral1000 =>
      isLightMode ? AppLightColors.neutral1000 : AppDarkColors.neutral200;
  Color get neutral1100 =>
      isLightMode ? AppLightColors.neutral1100 : AppDarkColors.neutral100;
  Color get bgColor =>
      isLightMode ? AppLightColors.bgColor : AppDarkColors.bgColor;

  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  bool get isSmallScene => MediaQuery.of(this).size.width <= 340;
  bool get isMediumScene => MediaQuery.of(this).size.width <= 375;
}
