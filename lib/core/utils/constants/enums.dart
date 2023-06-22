// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

enum SnackBarType {
  info,
  success,
  error,
  warning,
}

enum DateFieldMode {
  date,
  dateAndTime,
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

enum EventType {
  Origin,
  Modified,
  GeneradeClass,
  GeneradeReminder,
}

enum RepeatType {
  None,
  Daily,
  Weekly,
  Monthly,
  Yearly,
}

enum AlertType {
  None,
  AtTime,
  Before5Min,
  Before15Min,
  Before30Min,
  Before1Hour,
  Before2Hour,
  Before1Day,
  Before1Week
}

extension AlertTypeExt on AlertType {
  String get nameFormated {
    switch (this) {
      case AlertType.None:
        return 'None';
      case AlertType.AtTime:
        return 'At Time';
      case AlertType.Before5Min:
        return 'Before 5 Min';
      case AlertType.Before15Min:
        return 'Before 15 Min';
      case AlertType.Before30Min:
        return 'Before 30 Min';
      case AlertType.Before1Hour:
        return 'Before 1 Hour';
      case AlertType.Before2Hour:
        return 'Before 2 Hour';
      case AlertType.Before1Day:
        return 'Before 1 Day';
      case AlertType.Before1Week:
        return 'Before 1 Week';
    }
  }
}

enum OrderType {
  ASC,
  DESC,
}
