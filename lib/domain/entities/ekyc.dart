import 'package:intl/intl.dart';
import 'package:scheduler/core/utils/util.dart';

class Ekyc {
  String? faceImage;
  String? frontIdentifyImage;
  String? backIdentifyImage;
  CardType? cardType;
  String? identifyNumber;
  String? fullName;
  String? dateOfBirth;
  String? sex;
  String? nationality;
  String? placeOfOrigin;
  String? placeOfResidence;
  String? issueDate;
  String? issueLoc;
  String? dateOfExpiry;
  String? ethnicity;

  Ekyc(
      {this.faceImage,
      this.frontIdentifyImage,
      this.backIdentifyImage,
      this.cardType,
      this.identifyNumber,
      this.fullName,
      this.dateOfBirth,
      this.sex,
      this.nationality,
      this.placeOfOrigin,
      this.placeOfResidence,
      this.issueDate,
      this.issueLoc,
      this.dateOfExpiry,
      this.ethnicity});

  static Ekyc? fromQrCode(String? value) {
    if (value == null) return null;
    final fields = value.split("|");
    if (fields.length < 6) return null;

    return Ekyc(
      identifyNumber: fields[0],
      fullName: fields[2],
      dateOfBirth: rawToDateStr(fields[3]),
      sex: fields[4],
      placeOfResidence: fields[5],
      issueDate: rawToDateStr(fields[6]),
      cardType: CardType.cccd_chip,
    );
  }

  static String rawToDateStr(String raw) {
    return '${raw.substring(0, 2)}/${raw.substring(2, 4)}/${raw.substring(4)}';
  }

  Ekyc copyWith({
    String? faceImage,
    String? frontIdentifyImage,
    String? backIdentifyImage,
    CardType? cardType,
    String? identifyNumber,
    String? fullName,
    String? dateOfBirth,
    String? sex,
    String? nationality,
    String? placeOfOrigin,
    String? placeOfResidence,
    String? issueDate,
    String? issueLoc,
    String? dateOfExpiry,
    String? ethnicity,
  }) {
    return Ekyc(
      faceImage: faceImage ?? this.faceImage,
      frontIdentifyImage: frontIdentifyImage ?? this.frontIdentifyImage,
      backIdentifyImage: backIdentifyImage ?? this.backIdentifyImage,
      cardType: cardType ?? this.cardType,
      identifyNumber: identifyNumber ?? this.identifyNumber,
      fullName: fullName ?? this.fullName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      sex: sex ?? this.sex,
      nationality: nationality ?? this.nationality,
      placeOfOrigin: placeOfOrigin ?? this.placeOfOrigin,
      placeOfResidence: placeOfResidence ?? this.placeOfResidence,
      issueDate: issueDate ?? this.issueDate,
      issueLoc: issueLoc ?? this.issueLoc,
      dateOfExpiry: dateOfExpiry ?? this.dateOfExpiry,
      ethnicity: ethnicity ?? this.ethnicity,
    );
  }

  DateTime? get doB =>
      dateOfBirth.hasText ? DateFormat('dd/MM/yyyy').parse(dateOfBirth!) : null;

  DateTime? get doE => dateOfExpiry.hasText
      ? DateFormat('dd/MM/yyyy').parse(dateOfExpiry!)
      : null;

  DateTime? get doI =>
      issueDate.hasText ? DateFormat('dd/MM/yyyy').parse(issueDate!) : null;
}
