import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/converters.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@unfreezed
class Student with _$Student {
  const Student._();

  factory Student(
      {int? id,
      required String name,
      @ListIntConverter() required List<int> classId,
      @DateTimeConverter() required DateTime beginStudy,
      @BoolConverter() required bool isFollow,
      @BoolConverter() required bool isSpecial,
      required int fee,
      @ListStringConverter() required List<String> phones,
      String? image}) = _Student;

  factory Student.fromJson(Map<String, Object?> json) =>
      _$StudentFromJson(json);

  static List<Student> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => Student.fromJson(e)).toList();

  static init() => Student(
      name: '',
      classId: [],
      phones: [],
      beginStudy: DateTime.now(),
      isFollow: true,
      isSpecial: false,
      fee: 0);
}
