import 'package:freezed_annotation/freezed_annotation.dart';

import 'class_room.dart';
import 'event.dart';

part 'report_for_class.freezed.dart';

@freezed
sealed class ReportForClass with _$ReportForClass {
  ReportForClass._();
  factory ReportForClass({
    required ClassRoom classRoom,
    required List<Event> events,
  }) = _ReportForClass;

  String get getActive => 'true';
}
