import 'dart:developer';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:intl/intl.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/ekyc.dart';

class OcrIDCard {
  Offset topLeft = const Offset(0, 0);
  Offset bottomCenter = const Offset(0, 0);
  Offset center = const Offset(0, 0);
  // List<Offset> offsets = [];

  int imgWidth = 0, imgHeight = 0;
  double dH = 0, dW = 0;
  CardType findCardType(RecognizedText t) {
    if (t.text.contains('SOCIALIST') ||
        t.text.contains('REPUBLIC') ||
        t.text.contains('Independence') ||
        t.text.contains('Freedom') ||
        t.text.contains('Full name:') ||
        t.text.contains('Sex:') ||
        t.text.contains('Nationality:') ||
        t.text.contains('Place of origin:') ||
        t.text.contains('Place of residence:') ||
        t.text.contains('identification:') ||
        t.text.contains('Date, month, year:') ||
        t.text.contains('index finger') ||
        t.text.contains('<<<<')) return CardType.cccd_chip;
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
            center = e.boundingBox.center;

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

  List<Offset> calPoOOffset(CardType cardType) {
    List<Offset> result = [Offset.zero];
    if (cardType == CardType.cccd_chip) {
      result = [Offset(center.dx - 0.15 * dW, center.dy + 0.9 * dH)];
    } else {
      result = [
        Offset(center.dx, center.dy + 1.45 * dH),
        Offset(center.dx, center.dy + 1.45 * dH),
        Offset(center.dx, center.dy + 1.65 * dH),
      ];
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
        Offset(center.dx, center.dy + 2.1 * dH),
      ];
    }
    return result;
  }

  void analyzeFontCard(RecognizedText recognizedText, Ekyc e) {
    final cardType = findCardType(recognizedText);
    log(recognizedText.text);
    log(cardType.toString());
    final identifyNumber = findIdentifyNumber(recognizedText, cardType);
    log('IdentifyNumber: $identifyNumber');
    topLeft = findTopLeft(recognizedText, cardType);
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
    List<TextLine> placeOfOriginTLs = [];
    List<TextLine> placeOfResidenceTLs = [];

    TextLine? dateOfExpiryTL;

    for (int i = 0; i < recognizedText.blocks.length; i++) {
      final b = recognizedText.blocks[i];
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

        if (l.boundingBox.contains(edOffset) ||
            ((l.cornerPoints[1].x - edOffset.dx) < 0.3 * dW &&
                l.cornerPoints[1].x > edOffset.dx)) {
          dateOfExpiryTL = l;
          log('Date of expiry: ${l.text}');
        }

        if (cardType == CardType.cccd_chip) {
          for (var offset in pooOffset) {
            if (l.boundingBox.overlaps(Rect.fromCenter(
                center: offset, width: dW * scaleW, height: dH * 0.01))) {
              if (lookPatterns(l.text, ['Place', 'of', 'origin', 'resid']) ==
                  null) {
                if (placeOfOriginTLs.contains(l)) continue;
                if (placeOfResidenceTLs.contains(l)) continue;
                placeOfOriginTLs.add(l);
                log('Place of origin: ${l.text}');
              }
            }
          }
        } else {
          for (var offset in pooOffset) {
            if (l.boundingBox.overlaps(Rect.fromCenter(
                center: offset, width: dW * 0.2, height: dH * 0.01))) {
              if (placeOfOriginTLs.contains(l)) continue;
              if (placeOfResidenceTLs.contains(l)) continue;
              placeOfOriginTLs.add(l);
              log('Place of origin: ${l.text}');
            }
          }
        }

        for (var offset in porOffset) {
          if (l.boundingBox.overlaps(Rect.fromCenter(
              center: offset, width: dW * 0.2, height: dH * 0.01))) {
            if (placeOfOriginTLs.contains(l)) continue;
            if (placeOfResidenceTLs.contains(l)) continue;
            placeOfResidenceTLs.add(l);
            log('Place of Residence: ${l.text}');
          }
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
    e.placeOfOrigin ??= correctPoO(placeOfOriginTLs, cardType);
    e.placeOfResidence ??= correctPoR(placeOfResidenceTLs, cardType);

    // offsets.clear();
    // offsets.add(topLeft);
    // offsets.add(center);
    // offsets.add(fnOffset);
    // offsets.add(dobOffset);
    // offsets.add(sexOffset);
    // offsets.add(nOffset);
    // offsets.addAll(pooOffset);
    // offsets.addAll(porOffset);
    // offsets.add(edOffset);
  }

  String? correctDoB(TextLine? dateOfBirthTL, CardType cardType) {
    var text = dateOfBirthTL?.text;
    if (text == null) return null;
    if (text.length > 10) {
      text = text.substring(text.length - 10);
    }
    try {
      text = text.replaceAll('O', '0').replaceAll('o', '0');
      return DateFormat('dd/MM/yyyy').parse(text).toStringFormat('dd/MM/yyyy');
    } catch (e) {
      return text;
    }
  }

  String? correctDoE(TextLine? dateOfExpiryTL, String? dob, CardType cardType) {
    var text = dateOfExpiryTL?.text ?? '';
    if (text.length > 10) {
      text = text.substring(text.length - 10);
    }
    try {
      text = text.replaceAll('O', '0').replaceAll('o', '0');
      return DateFormat('dd/MM/yyyy').parse(text).toStringFormat('dd/MM/yyyy');
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

  String? correctPoO(List<TextLine> lines, CardType cardType) {
    if (cardType == CardType.cccd_chip) {
      return lines.map((e) => e.text).join(', ');
    } else {
      return lines.map((e) {
        final patten =
            lookPatterns(e.text, ['Quê quán:', 'uán:', 'n:', 'n;', ':', ';']);
        if (patten != null) return e.text.split(patten).last;
        return e.text;
      }).join(', ');
    }
  }

  String? correctPoR(List<TextLine> lines, CardType cardType) {
    if (cardType == CardType.cccd_chip) {
      return lines.map((e) {
        final pattern = lookPatterns(e.text, [
          'residence:',
          'residenc8:',
          'residence',
          'residenc8',
          ':',
        ]);
        if (pattern != null) return e.text.split(pattern).last;
        return e.text;
      }).join(', ');
    } else {
      return lines.map((e) {
        final pattern = lookPatterns(e.text, [
          'Nơi thường trú:',
          'Nơi thườngtrú:',
          'trú:',
          'rú:',
          ':',
          ';',
        ]);
        if (pattern != null) return e.text.split(pattern).last;
        return e.text;
      }).join(', ');
    }
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
        if (found) return e.text.trim().length == 2 ? 'Nữ' : 'Nam';
        if (e.text.contains('Sex') ||
            e.text.comparePrecise('Sex:') > 0.8 ||
            e.text.comparePrecise('Sex') > 0.8) {
          found = true;
        }
      }
    } else {
      var t = sexTL.text;
      final patten =
          lookPatterns(t, ['tính:', 'tinh:', 'tính', 'tinh', ':', ';', '.']);
      if (patten != null) return t.split(patten).last;
      return t.trim().length == 2 ? 'Nữ' : 'Nam';
    }
    return null;
  }

  void analyzeBackCard(RecognizedText recognizedText, Ekyc e) {
    final cardType = findCardType(recognizedText);
    log(recognizedText.text);
    log(cardType.toString());

    TextLine? issueDateTL;
    List<TextLine> issueLocTLs = [];
    int dateBlockIndex = 999;
    int dateLineIndex = 999;

    for (int i = 0; i < recognizedText.blocks.length; i++) {
      final block = recognizedText.blocks[i];

      for (int j = 0; j < block.lines.length; j++) {
        final l = block.lines[j];
        final text = l.text;

        if (cardType == CardType.cccd_chip) {
          if (text.comparePrecise('Ngày, tháng, năm/Date, month, year:') >
              0.7) {
            issueDateTL = l;
            dateBlockIndex = i;
            dateLineIndex = j;
          }
          if ((i >= dateBlockIndex && i < dateBlockIndex + 1) &&
              (j > dateLineIndex && j < dateLineIndex + 3)) {
            if (l.recognizedLanguages.contains('vi')) issueLocTLs.add(l);
          }
        } else {}
      }
    }

    e.issueDate ??= correctIssueDate(issueDateTL, cardType);
    e.issueLoc ??= correctIssueLoc(issueLocTLs, cardType);
    log(e.issueDate ?? 'null');
    log(e.issueLoc ?? 'null');
  }

  String? correctIssueDate(TextLine? issueDateTL, CardType cardType) {
    var text = issueDateTL?.text;
    if (text == null) return null;
    if (text.length > 10) text = text.substring(text.length - 10);
    try {
      text = text.replaceAll('O', '0').replaceAll('o', '0');
      return DateFormat('dd/MM/yyyy').parse(text).toStringFormat('dd/MM/yyyy');
    } catch (e) {
      return text;
    }
  }

  String? correctIssueLoc(List<TextLine> lines, CardType cardType) {
    return lines.map((e) => e.text.toUpperCase()).join(' ');
  }
}
