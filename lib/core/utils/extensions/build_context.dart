import 'package:flutter/material.dart';

import '../../../theme/app_light_colors.dart';

extension BuildContextExtension on BuildContext {
  Color get transparent => Colors.transparent;

  Color get primaryDark => AppLightColors.primaryDark;
  Color get primaryOrange => AppLightColors.primaryOrange;
  Color get disableColor => AppLightColors.disableColor;

  Color get funcBitterLemon => AppLightColors.funcBitterLemon;
  Color get func80 => AppLightColors.func80;
  Color get funcIcterine => AppLightColors.funcIcterine;
  Color get funcCornflowerBlue => AppLightColors.funcCornflowerBlue;
  Color get funcRadicalRed => AppLightColors.funcRadicalRed;

  Color get neutral100 => AppLightColors.neutral100;
  Color get neutral200 => AppLightColors.neutral200;
  Color get neutral300 => AppLightColors.neutral300;
  Color get neutral400 => AppLightColors.neutral400;
  Color get neutral500 => AppLightColors.neutral500;
  Color get neutral600 => AppLightColors.neutral600;
  Color get neutral700 => AppLightColors.neutral700;
  Color get neutral800 => AppLightColors.neutral800;
  Color get neutral900 => AppLightColors.neutral900;
  Color get neutral1000 => AppLightColors.neutral1000;
  Color get neutral1100 => AppLightColors.neutral1100;
  Color get bgColor => AppLightColors.bgColor;

  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  bool get isSmallScene => MediaQuery.of(this).size.width <= 340;
  bool get isMediumScene => MediaQuery.of(this).size.width <= 375;
}
