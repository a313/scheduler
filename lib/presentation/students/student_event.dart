import 'package:aio/data/models/student.dart';

import '../../core/manager/event_tracking.dart';

class StudentEvent extends EventTracking {
  StudentEvent({String? eventName}) : super(name: eventName ?? "Student");

  factory StudentEvent.onInitEditStudent(Student data) {
    return StudentEvent(eventName: 'onInitEditStudent')
      ..other = {
        'data': data.toString(),
      };
  }

  factory StudentEvent.onInsertOrUpdate(Student data) {
    return StudentEvent(eventName: 'onInsertOrUpdate')
      ..other = {
        'data': data.toString(),
      };
  }
}
