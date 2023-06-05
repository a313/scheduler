// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

enum SnackBarType {
  info,
  success,
  error,
  warning,
}

enum BiometricReason { login, active }

enum CTAType {
  unknown,
  @JsonValue("NO_ACTION")
  noAction,
  @JsonValue('WEBGAME')
  webGame,
  @JsonValue('WEB_INAPP')
  webInapp,
  @JsonValue('WEB_OUTAPP')
  webOutapp,
  @JsonValue('ACTION')
  action,
  @JsonValue('PAGE_IN_APP')
  namedPage,
  @JsonValue('NEW_PAGE')
  newsPage,
}

enum FrequencyUnit {
  @JsonValue('INSTANT')
  instant,
  @JsonValue('MINUTE')
  minute,
  @JsonValue('HOUR')
  hour,
  @JsonValue('DAY')
  day,
}
