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
      required DateTime beginStudy,
      @BoolConverter() required bool isFollow,
      @BoolConverter() required bool isSpecial,
      required int fee,
      @ListStringConverter() required List<String> phones,
      String? image}) = _Student;

  factory Student.fromJson(Map<String, Object?> json) =>
      _$StudentFromJson(json);

  static List<Student> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => Student.fromJson(e)).toList();

  // static Student fromDB(Map<String, dynamic> json) => Student(
  //       id: json['id'] as int?,
  //       name: json['name'] as String,
  //       classId: (json['classId'] as String).toListInt(PATTERN),
  //       beginStudy: DateTime.parse(json['beginStudy'] as String),
  //       isFollow: (json['isFollow'] as int).toBool,
  //       isSpecial: (json['isSpecial'] as int).toBool,
  //       fee: json['fee'] as int,
  //       phones: (json['phones'] as String).toListString(PATTERN),
  //       image: json['image'] as String?,
  //     );

  // Map<String, dynamic> toDB() => <String, dynamic>{
  //       'id': id,
  //       'name': name,
  //       'classId': classId.join(PATTERN),
  //       'beginStudy': beginStudy.toIso8601String(),
  //       'isFollow': isFollow.toInt,
  //       'isSpecial': isSpecial.toInt,
  //       'fee': fee,
  //       'phones': phones.join(PATTERN),
  //       'image': image,
  //     };

  static init() => Student(
      name: '',
      classId: [],
      phones: [],
      beginStudy: DateTime.now(),
      isFollow: true,
      isSpecial: false,
      fee: 0);
}
