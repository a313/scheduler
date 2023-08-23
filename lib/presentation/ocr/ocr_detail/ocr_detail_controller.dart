import 'dart:typed_data';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheduler/core/state_management/base_controller.dart';

class OcrDetailController extends BaseController with StateMixin<Uint8List> {
  final XFile image;
  final RecognizedText data;
  double scale = 0;

  OcrDetailController(
    this.image,
    this.data,
  );

  @override
  Future<void> onReady() async {
    super.onReady();
    final imgData = await image.readAsBytes();
    decodeImageFromList(
      imgData,
      (result) {
        scale = Get.width / result.width;
        change(imgData, status: RxStatus.success());
      },
    );
  }
}
