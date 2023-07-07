import 'package:freezed_annotation/freezed_annotation.dart';

import 'class_room.dart';
import 'event.dart';
import 'student.dart';

part 'report_for_class.freezed.dart';

@freezed
class ReportForClass with _$ReportForClass {
  ReportForClass._();
  factory ReportForClass({
    required ClassRoom classRoom,
    required Map<Student, List<Event>> data,
  }) = _ReportForClass;

  String get getActive => 'true';
}
