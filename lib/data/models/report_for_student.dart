import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/data/models/student.dart';

part 'report_for_student.freezed.dart';

@unfreezed
class ReportForStudent with _$ReportForStudent {
  const ReportForStudent._();

  factory ReportForStudent({
    required Student student,
    required Map<ClassRoom, List<Event>> data,
  }) = _ReportForStudent;
}
