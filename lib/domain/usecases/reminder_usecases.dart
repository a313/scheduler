import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/reminder.dart';

import '../../core/utils/util.dart';
import '../../data/models/event.dart';
import '../repo_abs/reminder_repo_abs.dart';

class ReminderUseCases {
  final ReminderRepo _;

  ReminderUseCases(this._);

  Future<DataState<List<Reminder>>> getAllReminder() async {
    return await _.getAllReminder();
  }

  Future<DataState<Reminder>> insertOrUpdate(Reminder data) async {
    return await _.insertOrUpdate(data);
  }

  Future<DataState<int>> delete(int id) async {
    return await _.delete(id);
  }

  List<Event> generateEvent(
      {required Reminder reminder,
      required DateTime from,
      required DateTime to}) {
    List<Event> result = [];
    final alertAt = reminder.alertTime;
    final createDate = reminder.createDate;
    if (reminder.repeat == RepeatType.None ||
        alertAt == null ||
        createDate.isBefore(from)) {
      return result;
    }
    for (var date = from;
        date.isBefore(to);
        date = date.add(const Duration(days: 1))) {
      var diff = date.difference(createDate);
      final inDays = diff.inDays;
      final interval = reminder.interval;
      final startTime =
          date.copyWith(hour: alertAt.hour, minute: alertAt.minute);
      if (reminder.repeat == RepeatType.Daily) {
        if (inDays % interval != 0) {
          print(
              'Skiped ${createDate.toString()} - ${date.toString()} inDays:$inDays');
          continue;
        }
      } else if (reminder.repeat == RepeatType.Weekly) {
        if ((inDays % interval) % 7 != 0) {
          print(
              'Skiped ${createDate.toString()} - ${date.toString()} inDays:$inDays');
          continue;
        }
      } else if (reminder.repeat == RepeatType.Monthly) {
        continue;
      } else if (reminder.repeat == RepeatType.Yearly) {
        continue;
      }
      print(
          'ADDED ${createDate.toString()} - ${date.toString()} inDays:$inDays');
      result.add(Event(
          name: reminder.name,
          startTime: startTime,
          endTime: startTime,
          type: EventType.GeneradeReminder,
          alert: AlertType.None,
          repeat: RepeatType.None));
    }
    return result;
  }
}
