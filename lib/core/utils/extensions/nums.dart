import 'dart:math';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension CustomNumExtension on num {
  String toDecimalPattern({String local = "vi"}) {
    final oCcy = NumberFormat.decimalPattern(local);
    return oCcy.format(this);
  }

  String compactNumber() {
    if (this >= 1000000000) return toBillion();
    if (this >= 1000000) return toMillion();
    if (this >= 1000) return toThousand();
    return toDecimalPattern();
  }

  String toBillion({String local = "vi", String symbol = "B"}) {
    final d = this / 1000000000.0;
    return "${d.floorWithFractionDigits(1).toStringAsFixed(1)}$symbol";
  }

  String toMillion({String local = "vi", String symbol = "M"}) {
    final d = this / 1000000.0;
    return "${d.floorWithFractionDigits(1).toStringAsFixed(1)}$symbol";
  }

  String toThousand({String local = "vi", String symbol = "K"}) {
    final d = this / 1000.0;
    return "${d.floorWithFractionDigits(1).toStringAsFixed(1)}$symbol";
  }

  String toCurrency({String symbol = " VNĐ"}) {
    final oCcy = NumberFormat.decimalPattern("vi");

    return "${oCcy.format(this)}$symbol";
  }

  String toCurrencyWithVisible(bool visible, {String symbol = " VNĐ"}) {
    if (visible) {
      final oCcy = NumberFormat.decimalPattern("vi");
      return "${oCcy.format(this)}$symbol";
    } else {
      return "******$symbol";
    }
  }

  num floorWithFractionDigits(int fractionDigits) {
    final p = pow(10, fractionDigits);
    return (this * p).floor() / p;
  }

  String formatWithSeparator({String separator = ","}) {
    return toString().replaceAll(RegExp(r'\.'), separator);
  }

  String toExpiredFormat() {
    final duration = Duration(seconds: toInt());
    String formattedDuration;
    if (duration.inHours > 0) {
      formattedDuration =
          "${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 360).toString().padLeft(2, '0')}";
    } else {
      formattedDuration =
          "${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
    }

    return formattedDuration;
  }

  bool get toBool => this == 1;

  String get getDayOfWeek {
    switch (this) {
      case 1:
        return 'Mon'.tr;
      case 2:
        return 'Tue'.tr;
      case 3:
        return 'Wed'.tr;
      case 4:
        return 'Thu'.tr;
      case 5:
        return 'Fri'.tr;
      case 6:
        return 'Sat'.tr;
      case 7:
        return 'Sun'.tr;
      default:
        return 'UNKNOWN';
    }
  }
}

extension BoolExt on bool {
  int get toInt => this == true ? 1 : 0;
}

extension CustomNumNulsafetyExtension on num? {
  String toCurrencyOrNull({String symbol = " VNĐ", required String onNull}) {
    if (this == null) return onNull;

    final oCcy = NumberFormat.decimalPattern("vi");
    return "${oCcy.format(this)}$symbol";
  }

  String toCurrencyWithVisibleOrNull(bool visible,
      {String symbol = " VNĐ", required String onNull}) {
    if (this == null) return onNull;

    if (visible) {
      final oCcy = NumberFormat.decimalPattern("vi");
      return "${oCcy.format(this)}$symbol";
    } else {
      return "******$symbol";
    }
  }
}
