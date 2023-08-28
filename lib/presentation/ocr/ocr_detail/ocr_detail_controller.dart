import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/transform_image.dart';
import 'package:scheduler/core/utils/util.dart';

class OcrDetailController extends BaseController {
  double scale = 0;
  final String path;
  String? qrPath;
  final CameraType type;
  OcrDetailController(this.path, this.type);
  late Image image;
  late String appPath;

  @override
  Future<void> onReady() async {
    super.onReady();
    handlerImage();
    final dic = await getApplicationDocumentsDirectory();
    appPath = '${dic.path}/${type.name}';
  }

  Future<void> handlerImage() async {
    final inputImage = InputImage.fromFilePath(path);
    log(inputImage.toJson().toString());
    final result = await getRecognisedText(inputImage);

    if (result.text.isEmpty) {
      showSnackBar("No text was recognized");
    }

    final qrs = await getQrCode(inputImage);
    update();
    if (qrs.isEmpty) {
      showSnackBar("Can't recognized Qr");
    }
  }

  Future<void> readQr() async {
    final cropped = getQrCropped();
    qrPath = '${appPath}_qr.jpg';
    File(qrPath!).writeAsBytesSync(cropped);
  }

  @override
  void onClose() {
    File(path).delete();
    File('${appPath}_qr.jpg').delete();
    super.onClose();
  }

  Uint8List getQrCropped() {
    final f = File(path);
    final img.Image? image = img.decodeImage(f.readAsBytesSync());
    if (image != null) {
      return TransformImage.cropQr(image);
    }
    return Uint8List(0);
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
}
