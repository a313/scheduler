import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aio/core/utils/extensions/date_time.dart';

import '../../core/converters.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@unfreezed
class Student with _$Student {
  const Student._();

  factory Student({
    int? id,
    required String name,
    @ListIntConverter() required List<int> classId,
    @DateTimeConverter() required DateTime beginStudy,
    @BoolConverter() required bool isFollow,
    @BoolConverter() required bool isSpecial,
    required int fee,
    @ListStringConverter() required List<String> phones,
    @DateTimeConverter() DateTime? lastCharge,
    String? image,
  }) = _Student;

  @override
  bool operator ==(Object other) =>
      other is Student &&
      other.id == id &&
      other.name == name &&
      listEquals(other.classId, classId) &&
      other.beginStudy == beginStudy &&
      other.isFollow == isFollow &&
      other.isSpecial == isSpecial &&
      other.fee == fee &&
      listEquals(other.phones, phones) &&
      other.lastCharge == lastCharge &&
      other.image == image;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      classId.hashCode ^
      beginStudy.hashCode ^
      isFollow.hashCode ^
      isSpecial.hashCode ^
      fee.hashCode ^
      classId.hashCode ^
      phones.hashCode ^
      lastCharge.hashCode ^
      image.hashCode;

  factory Student.fromJson(Map<String, Object?> json) =>
      _$StudentFromJson(json);

  static List<Student> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => Student.fromJson(e)).toList();

  static init() => Student(
      name: '',
      classId: [],
      phones: [],
      beginStudy: DateTime.now().dateWithoutTime(),
      isFollow: true,
      isSpecial: false,
      fee: 0);
}
