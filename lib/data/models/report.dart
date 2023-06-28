import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/data/models/student.dart';

part 'report.freezed.dart';

@unfreezed
class Report with _$Report {
  const Report._();

  factory Report({
    required DateTime start,
    required DateTime end,
    required Student student,
    required Map<ClassRoom, List<Event>> data,
  }) = _Report;

  String get getFormula {
    int total = 0;
    List<String> formula = [];
    data.forEach((key, value) {
      var fee = key.tuition;
      int onCount = 0;
      if (student.isSpecial) {
        fee = student.fee;
      }
      for (var element in value) {
        if (element.isActive && element.joinedIds.contains(student.id)) {
          onCount++;
        }
      }
      formula.add('$onCount x $fee');
      total += onCount * fee;
    });
    return '${formula.join(' + ')}= $total';
  }
}
