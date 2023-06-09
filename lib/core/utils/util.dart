import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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

  static Future<XFile?> pickImage(
      {required ImageSource source,
      double maxHeight = 300,
      double maxWidth = 300,
      int imageQuality = 90}) async {
    final ImagePicker picker = ImagePicker();

    final image = await picker.pickImage(
      source: source,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      imageQuality: imageQuality,
    );

    return image;
  }

  static Future<File> saveFileToLocal(
      {required String filePath, String? name}) async {
    final file = File(filePath);
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = name ?? basename(filePath);
    final saved = await file.copy('${appDir.path}/$fileName');
    return saved;
  }
}
