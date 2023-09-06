import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/ekyc.dart';

class OcrDetailController extends BaseController {
  double scale = 0;
  final Uint8List imageData;
  final CameraType type;
  OcrDetailController(this.imageData, this.type);

  Ekyc? ekyc;
  Offset topLeft = const Offset(0, 0);
  Offset bottomCenter = const Offset(0, 0);
  Offset center = const Offset(0, 0);
  List<Offset> offsets = [];

  List<Barcode> qrs = [];
  RecognizedText? recognizedText;
  int imgWidth = 0, imgHeight = 0;
  double dH = 0, dW = 0;
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
    imgWidth = decodedImage.width;
    imgHeight = decodedImage.height;
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
    }
    genEkycFont();
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

  void genEkycFont() {
    if (qrs.isNotEmpty) {
      for (var qr in qrs) {
        ekyc = Ekyc.fromQrCode(qr.rawValue!);
        if (ekyc != null) break;
      }
    }
    final e = ekyc ??= Ekyc();
    final rText = recognizedText;
    if (rText == null) return;

    analyzeData(e);
  }

  CardType findCardType(RecognizedText t) {
    if (t.text.contains('SOCIALIST') ||
        t.text.contains('REPUBLIC') ||
        t.text.contains('Independence') ||
        t.text.contains('Freedom') ||
        t.text.contains('Full name:') ||
        t.text.contains('Sex:') ||
        t.text.contains('Nationality:') ||
        t.text.contains('Place of origin:') ||
        t.text.contains('Place of residence:')) return CardType.cccd_chip;
    return CardType.cccd;
  }

  String? findIdentifyNumber(RecognizedText t, CardType type) {
    if (type == CardType.cccd_chip) {
      for (int i = 3; i < 7; i++) {
        final b = t.blocks[i];
        for (final l in b.lines) {
          for (final e in l.elements) {
            if (CustomStringExtension(e.text).isNumericOnly &&
                e.text.length > 10) {
              center = e.boundingBox.center;
              offsets.add(center);
              return e.text.padLeft(12, '0');
            }
          }
        }
      }
    } else {
      for (int i = 1; i < 5; i++) {
        final b = t.blocks[i];
        for (final e in b.lines) {
          if (e.text.numericOnly().length > 10) {
            print(e.text);
            center = e.boundingBox.center;
            offsets.add(center);
            final pattern = lookPatterns(
                e.text, ['Số:', 'số:', 's6;', 'S6:', ':', ';', '.']);
            if (pattern != null) {
              return e.text.split(pattern).last.numericOnly();
            }
            return e.text.numericOnly().substring(e.text.length - 12);
          }
        }
      }
    }
    return null;
  }

  Offset findTopLeft(RecognizedText rText, CardType cardType) {
    final b = rText.blocks.first;
    final tC = b.cornerPoints[0];
    return Offset(tC.x.toDouble(), tC.y.toDouble());
  }

  Offset calFullNameOffset(CardType cardType) {
    Offset result;
    if (cardType == CardType.cccd_chip) {
      result = Offset(center.dx - 0.5 * dW, center.dy + 0.31 * dH);
    } else {
      result = Offset(center.dx, center.dy + 0.45 * dH);
    }
    return result;
  }

  Offset calDateOfBirthOffset(CardType cardType) {
    Offset result = Offset.zero;
    if (cardType == CardType.cccd_chip) {
      result = Offset(center.dx + 0.3 * dW, center.dy + 0.47 * dH);
    } else {
      result = Offset(center.dx + 0.15 * dW, center.dy + 0.85 * dH);
    }
    return result;
  }

  Offset calSexOffset(CardType cardType) {
    Offset result = Offset.zero;
    if (cardType == CardType.cccd_chip) {
      result = Offset(center.dx - 0.15 * dW, center.dy + 0.63 * dH);
    } else {
      result = Offset(center.dx - 0.51 * dW, center.dy + 1.13 * dH);
    }
    return result;
  }

  Offset calNationalityOffset(CardType cardType) {
    Offset result = Offset.zero;
    if (cardType == CardType.cccd_chip) {
      result = Offset(center.dx + 1.1 * dW, center.dy + 0.6 * dH);
    } else {
      result = Offset(center.dx + 0.55 * dW, center.dy + 1.13 * dH);
    }
    return result;
  }

  Offset calPoOOffset(CardType cardType) {
    Offset result = Offset.zero;
    if (cardType == CardType.cccd_chip) {
      result = Offset(center.dx - 0.15 * dW, center.dy + 0.9 * dH);
    } else {
      result = Offset(center.dx - 0.15 * dW, center.dy + 1.45 * dH);
    }
    return result;
  }

  Offset calExpiredDateOffset(CardType cardType) {
    Offset result = Offset.zero;
    if (cardType == CardType.cccd_chip) {
      result = Offset(center.dx - 1.3 * dW, center.dy + 1.1 * dH);
    } else {
      result = Offset(center.dx - 1.3 * dW, center.dy + 2.21 * dH);
    }
    return result;
  }

  List<Offset> calPoROffset(CardType cardType) {
    List<Offset> result = [Offset.zero, Offset.zero];
    if (cardType == CardType.cccd_chip) {
      result = [
        Offset(center.dx + 0.6 * dW, center.dy + 1.05 * dH),
        Offset(center.dx - 0.7 * dW, center.dy + 1.2 * dH),
      ];
    } else {
      result = [
        Offset(center.dx, center.dy + 1.86 * dH),
        Offset(center.dx, center.dy + 2.15 * dH),
      ];
    }
    return result;
  }

  void analyzeData(Ekyc e) {
    ekyc = e;
    final cardType = findCardType(recognizedText!);
    log(recognizedText!.text);
    log(cardType.toString());
    final identifyNumber = findIdentifyNumber(recognizedText!, cardType);
    log('IdentifyNumber: $identifyNumber');
    topLeft = findTopLeft(recognizedText!, cardType);
    dW = center.dx - topLeft.dx;
    dH = center.dy - topLeft.dy;

    final fnOffset = calFullNameOffset(cardType);
    final dobOffset = calDateOfBirthOffset(cardType);
    final sexOffset = calSexOffset(cardType);
    final nOffset = calNationalityOffset(cardType);
    final pooOffset = calPoOOffset(cardType);
    final porOffset = calPoROffset(cardType);
    final edOffset = calExpiredDateOffset(cardType);

    TextLine? fullNameTL;
    TextLine? dateOfBirthTL;
    TextLine? sexTL;
    TextLine? nationalityTL;
    TextLine? placeOfOriginTL;
    TextLine? placeOfResidence0TL;
    TextLine? placeOfResidence1TL;
    // TextLine? issueDateTL;
    // TextLine? issueLocTL;
    TextLine? dateOfExpiryTL;
    // TextLine? ethnicityTL;
    for (int i = recognizedText!.blocks.length - 1; i >= 0; i--) {
      final b = recognizedText!.blocks[i];
      var scaleW = cardType == CardType.cccd_chip ? 0.15 : 0.1;
      var scaleH = cardType == CardType.cccd_chip ? 0.15 : 0.3;
      for (var l in b.lines) {
        if (l.boundingBox.overlaps(Rect.fromCenter(
            center: fnOffset, width: dW * scaleW, height: dH * scaleH))) {
          if (lookPatterns(
                  l.text, ['birth', 'of', 'Full name', ':', '/', '|']) ==
              null) {
            fullNameTL = l;
            log('FullName: ${l.text}');
          }
        }

        if (l.boundingBox.overlaps(Rect.fromCenter(
            center: dobOffset, width: dW * scaleW, height: dH * scaleH))) {
          if (l.text.numericOnly().length > 6) {
            dateOfBirthTL = l;
            log('Date of birth: ${l.text}');
          }
        }

        if (l.boundingBox.overlaps(Rect.fromCenter(
            center: sexOffset, width: dW * scaleW, height: dH * scaleH))) {
          if (l.text.removeDiacritics().contains('Nam') ||
              l.text.removeDiacritics().contains('Nu')) {
            sexTL = l;
            log('Sex: ${l.text}');
          }
        }

        if (l.boundingBox.contains(nOffset)) {
          nationalityTL = l;
          log('Nationality: ${l.text}');
        }

        if (l.boundingBox.overlaps(Rect.fromCenter(
            center: pooOffset, width: dW * scaleW, height: dH * scaleH))) {
          if (lookPatterns(l.text, ['Place', 'of', 'origin', 'resid']) ==
              null) {
            placeOfOriginTL = l;
            log('Place of origin: ${l.text}');
          }
        }

        if (l.boundingBox.contains(porOffset[0])) {
          placeOfResidence0TL = l;
          log('Place of residence 1: ${l.text}');
        }

        if (l.boundingBox.contains(porOffset[1])) {
          placeOfResidence1TL = l;
          log('Place of residence 2: ${l.text}');
        }

        if (l.boundingBox.contains(edOffset) ||
            ((l.cornerPoints[1].x - edOffset.dx) < 0.3 * dW &&
                l.cornerPoints[1].x > edOffset.dx)) {
          dateOfExpiryTL = l;
          log('Date of expiry: ${l.text}');
        }
      }
    }
    e.cardType ??= cardType;
    e.identifyNumber ??= identifyNumber;
    e.fullName ??= correctFullName(fullNameTL, cardType);
    e.sex ??= correctSex(sexTL, cardType);
    e.dateOfBirth ??= correctDoB(dateOfBirthTL, cardType);
    e.dateOfExpiry ??= correctDoE(dateOfExpiryTL, e.dateOfBirth, cardType);
    e.nationality ??= correctNat(nationalityTL, cardType);
    e.placeOfOrigin ??= correctPoO(placeOfOriginTL, cardType);
    e.placeOfResidence ??=
        correctPoR(placeOfResidence0TL, placeOfResidence1TL, cardType);

    offsets.clear();
    offsets.add(topLeft);
    offsets.add(center);
    offsets.add(fnOffset);
    offsets.add(dobOffset);
    offsets.add(sexOffset);
    offsets.add(nOffset);
    offsets.add(pooOffset);
    offsets.addAll(porOffset);
    offsets.add(edOffset);

    update();
  }

  String? correctDoB(TextLine? dateOfBirthTL, CardType cardType) {
    var text = dateOfBirthTL?.text;
    if (text == null) return null;
    if (text.length > 10) {
      text = text.substring(text.length - 10);
    }
    try {
      DateFormat('dd/MM/yyyy').parse(text);
      return text;
    } catch (e) {
      return null;
    }
  }

  String? correctDoE(TextLine? dateOfExpiryTL, String? dob, CardType cardType) {
    var text = dateOfExpiryTL?.text ?? '';
    if (text.length > 10) {
      text = text.substring(text.length - 10);
    }
    try {
      DateFormat('dd/MM/yyyy').parse(text);
      return text;
    } catch (e) {
      if (dob != null) {
        final b = DateFormat('dd/MM/yyyy').parse(dob);

        return DateTime(b.year + 40, b.month, b.day)
            .toStringFormat('dd/MM/yyyy');
      }
      return null;
    }
  }

  String? correctNat(TextLine? nationalityTL, CardType cardType) {
    var text = nationalityTL?.text;
    if (text == null) return null;
    if (cardType == CardType.cccd_chip) {
      final pattern =
          lookPatterns(text, ['Nationality:', 'Nationality', ':', ';', '.']);
      if (pattern != null) {
        text = text.split(pattern).last;
      }
    } else {
      final pattern = lookPatterns(text, ['Quốc tịch:', ':', ';', '.']);
      if (pattern != null) {
        text = text.split(pattern).last;
      }
    }
    return text;
  }

  String? correctPoO(TextLine? placeOfOriginTL, CardType cardType) {
    if (cardType == CardType.cccd_chip) {
      return placeOfOriginTL?.text;
    } else {
      var t = placeOfOriginTL?.text;
      if (t == null) return null;
      final patten = lookPatterns(t, ['Quê quán:', ':', ';', '.']);
      if (patten != null) return t.split(patten).last;
      return t;
    }
  }

  String? correctPoR(TextLine? placeOfResidence0TL,
      TextLine? placeOfResidence1TL, CardType cardType) {
    var l1 = placeOfResidence0TL?.text;
    final l2 = placeOfResidence1TL?.text ?? '';
    if (l1 == null) return null;
    if (cardType == CardType.cccd_chip) {
      final pattern = lookPatterns(l1, [
        'residence:',
        'residenc8:',
        'residence',
        'residenc8',
        ':',
      ]);
      if (pattern != null) {
        l1 = l1.split(pattern).last;
      }
    }
    return '$l1 $l2'.trim();
  }

  String? lookPatterns(String source, List<String> patterns) {
    for (var p in patterns) {
      if (source.contains(p)) return p;
    }
    return null;
  }

  String? correctFullName(TextLine? fullNameTL, CardType cardType) {
    return fullNameTL?.text;
  }

  String? correctSex(TextLine? sexTL, CardType cardType) {
    bool found = false;
    if (sexTL == null) return null;
    if (cardType == CardType.cccd_chip) {
      for (int i = 0; i < sexTL.elements.length; i++) {
        final e = sexTL.elements[i];
        if (found) return e.text;

        if (e.text.comparePrecise('Sex:') > 0.8 ||
            e.text.comparePrecise('Sex') > 0.9) {
          found = true;
        }
      }
    } else {
      var t = sexTL.text;
      final patten =
          lookPatterns(t, ['tính:', 'tinh:', 'tính', 'tinh', ':', ';', '.']);
      if (patten != null) return t.split(patten).last;
      return t.substring(t.length - 3).trim();
    }
    return null;
  }
}
