import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduler/core/utils/util.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@unfreezed
class Student with _$Student {
  const Student._();

  factory Student(
      {int? id,
      required String name,
      required List<int> classId,
      required DateTime beginStudy,
      required bool isFollow,
      required bool isSpecial,
      required int fee,
      required List<String> phones,
      String? image}) = _Student;

  factory Student.fromJson(Map<String, Object?> json) =>
      _$StudentFromJson(json);

  static List<Student> getListFromDB(List<Map<String, Object?>> data) =>
      data.map((e) => Student.fromDB(e)).toList();

  static Student fromDB(Map<String, dynamic> json) => Student(
        id: json['id'] as int?,
        name: json['name'] as String,
        classId: (json['classId'] as String).toListInt(PATTERN),
        beginStudy: DateTime.parse(json['beginStudy'] as String),
        isFollow: json['isFollow'] as int == 1,
        isSpecial: json['isSpecial'] as int == 1,
        fee: json['fee'] as int,
        phones: (json['phones'] as String).toListString(PATTERN),
        image: json['image'] as String?,
      );

  Map<String, dynamic> toDB() => <String, dynamic>{
        'id': id,
        'name': name,
        'classId': classId.join(PATTERN),
        'beginStudy': beginStudy.toIso8601String(),
        'isFollow': isFollow,
        'isSpecial': isSpecial,
        'fee': fee,
        'phones': phones.join(PATTERN),
        'image': image,
      };

  static init() => Student(
      name: '',
      classId: [],
      phones: [],
      beginStudy: DateTime.now(),
      isFollow: true,
      isSpecial: false,
      fee: 0);
}
