import 'package:get/get.dart';

export 'constants/borders.dart';
export 'constants/date_format.dart';
export 'constants/durations.dart';
export 'constants/enums.dart';
export 'constants/error_code.dart';
export 'constants/paddings.dart';
export 'constants/sized_boxs.dart';
export 'constants/strings.dart';
export 'extensions/app_lifecycle_ext.dart';
export 'extensions/build_context.dart';
export 'extensions/color_context.dart';
export 'extensions/date_time.dart';
export 'extensions/durations.dart';
export 'extensions/map_ext.dart';
export 'extensions/nums.dart';
export 'extensions/scroll_controller.dart';
export 'extensions/string.dart';
export 'extensions/string_nullsafety.dart';
export 'extensions/widgets_ext.dart';
export 'helper/helper.dart';

class Utils {
  static String hexToAscii(String source) {
    source = source.removeAllWhitespace;
    return List.generate(
      source.length ~/ 2,
      (i) => String.fromCharCode(
          int.parse(source.substring(i * 2, (i * 2) + 2), radix: 16)),
    ).join();
  }
}
