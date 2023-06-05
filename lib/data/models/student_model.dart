import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduler/domain/entities/student.dart';

part 'student_model.freezed.dart';
part 'student_model.g.dart';

@freezed
class StudentModel extends Student with _$StudentModel {
  factory StudentModel(
    final int id,
    final String name,
    final List<int> classIds,
    final DateTime beginStudy,
    final DateTime lastCharge,
    final String phones,
    final bool isSpecial,
    final int? fee,
    final bool isFollow,
    final String? image,
  ) = _StudentModel;

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);
}
