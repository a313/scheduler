import 'dart:io';

import 'package:get/get.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:aio/core/state_management/base_controller.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/domain/entities/ekyc.dart';
import 'package:aio/presentation/ocr/ocr_util.dart';

import '../ocr_camera/ocr_camera_binding.dart';
import '../ocr_camera/ocr_camera_page.dart';

class OcrDetailController extends BaseController {
  double scale = 0;
  final File file;
  final CameraType type;
  OcrDetailController(this.file, this.type, this.origin);

  final Ekyc origin;
  late Ekyc current;

  List<Barcode> qrs = [];
  RecognizedText? recognizedText;
  late OcrIDCard util;

  @override
  void onInit() {
    util = OcrIDCard();
    super.onInit();
    current = origin.copyWith();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    handlerImage();
  }

  // Future<InputImage> getInputImageFromBytes(Uint8List data) async {
  //   final path = await getApplicationDocumentsDirectory();
  //   final file = await File('${path.path}/${type.name}.jpg').create();
  //   file.writeAsBytesSync(data);

  //   final decodedImage = await decodeImageFromList(data);
  //   util.imgWidth = decodedImage.width;
  //   util.imgHeight = decodedImage.height;
  //   if (type == CameraType.font) {
  //     current.frontIdentifyImage = file.path;
  //   } else if (type == CameraType.back) {
  //     current.backIdentifyImage = file.path;
  //   }
  //   return InputImage.fromFile(file);
  // }

  Future<void> handlerImage() async {
    final inputImage = InputImage.fromFile(File(file.path));
    recognizedText = await getRecognisedText(inputImage);
    if (!recognizedText!.text.hasText) {
      showSnackBar("No text was recognized");
    }

    if (type == CameraType.font) {
      qrs = await getQrCode(inputImage);
      genFontCard();
      current.frontIdentifyImage = file.path;
    } else if (type == CameraType.back) {
      genBackCard();
      current.backIdentifyImage = file.path;
    }
    update();
  }

  Future<RecognizedText> getRecognisedText(InputImage inputImage) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final recognisedText = await textRecognizer.processImage(inputImage);
    await textRecognizer.close();
    return recognisedText;
  }

  Future<List<Barcode>> getQrCode(InputImage inputImage) async {
    final List<BarcodeFormat> formats = [BarcodeFormat.all];
    final scanner = BarcodeScanner(formats: formats);
    final List<Barcode> barcodes = await scanner.processImage(inputImage);
    await scanner.close();
    return barcodes;
  }

  void genFontCard() {
    if (qrs.isNotEmpty) {
      for (var qr in qrs) {
        final e = Ekyc.fromQrCode(qr.rawValue!);
        if (e != null) {
          current = e;
        }
        break;
      }
    }

    final rText = recognizedText;
    if (rText == null) return;
    util.analyzeFontCard(rText, current);
  }

  void genBackCard() {
    final rText = recognizedText;
    if (rText == null) return;
    util.analyzeBackCard(rText, current);
  }

  void onReTake() {
    Get.off(
      () => const OcrCameraPage(),
      binding: OcrCameraBinding(type, origin),
    );
  }

  void onNext() {
    if (type == CameraType.font) {
      Get.off(
        () => const OcrCameraPage(),
        binding: OcrCameraBinding(CameraType.back, current),
      );
    } else if (type == CameraType.back) {
      Get.off(
        () => const OcrCameraPage(),
        binding: OcrCameraBinding(CameraType.portrait, current),
      );
    }
  }
}
