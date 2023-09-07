import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/ekyc.dart';
import 'package:scheduler/presentation/ocr/ocr_util.dart';

import '../ocr_camera/ocr_camera_binding.dart';
import '../ocr_camera/ocr_camera_page.dart';

class OcrDetailController extends BaseController {
  double scale = 0;
  final Uint8List imageData;
  final CameraType type;
  OcrDetailController(this.imageData, this.type);

  Ekyc? ekyc;

  List<Barcode> qrs = [];
  RecognizedText? recognizedText;
  late OcrIDCard util;

  @override
  void onInit() {
    util = OcrIDCard();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    handlerImage();
  }

  Future<InputImage> getInputImageFromBytes(Uint8List data) async {
    final path = await getApplicationDocumentsDirectory();
    final file = await File('${path.path}/${type.name}.jpg').create();
    file.writeAsBytesSync(data);

    final decodedImage = await decodeImageFromList(data);
    util.imgWidth = decodedImage.width;
    util.imgHeight = decodedImage.height;
    return InputImage.fromFile(file);
  }

  Future<void> handlerImage() async {
    final inputImage = await getInputImageFromBytes(imageData);
    recognizedText = await getRecognisedText(inputImage);
    if (!recognizedText!.text.hasText) {
      showSnackBar("No text was recognized");
    }

    if (type == CameraType.font) {
      qrs = await getQrCode(inputImage);
      genFontCard();
    } else if (type == CameraType.back) {
      genBackCard();
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
        ekyc = Ekyc.fromQrCode(qr.rawValue!);
        if (ekyc != null) break;
      }
    }

    final e = ekyc ??= Ekyc();
    final rText = recognizedText;
    if (rText == null) return;
    util.analyzeFontCard(rText, e);
  }

  void genBackCard() {
    final e = ekyc ??= Ekyc();
    final rText = recognizedText;
    if (rText == null) return;
    analyzeBackCard(e);
  }

  void analyzeBackCard(Ekyc e) {}

  void onReTake() {
    Get.off(
      () => const OcrCameraPage(),
      binding: OcrCameraBinding(CameraType.font),
    );
  }

  void onNext() {
    if (type == CameraType.font) {
      Get.off(
        () => const OcrCameraPage(),
        binding: OcrCameraBinding(CameraType.back),
      );
    }
    if (type == CameraType.back) {
      Get.off(
        () => const OcrCameraPage(),
        binding: OcrCameraBinding(CameraType.portrait),
      );
    }
  }
}
