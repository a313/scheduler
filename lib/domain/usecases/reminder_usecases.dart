import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/data/models/reminder.dart';

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
    final alertAt = reminder.time;
    final remindDate = reminder.remindDate;

    if (reminder.repeat == RepeatType.None ||
        alertAt == null ||
        reminder.createDate.isAfter(from)) {
      return result;
    }
    for (var date = from;
        date.isBefore(to);
        date = date.add(const Duration(days: 1))) {
      var diff = date.difference(remindDate);
      final inDays = diff.inDays;
      final interval = reminder.interval;
      final startTime =
          date.copyWith(hour: alertAt.hour, minute: alertAt.minute);
      if (reminder.repeat == RepeatType.Daily) {
        if (inDays % interval != 0) {
          continue;
        }
      } else if (reminder.repeat == RepeatType.Weekly) {
        if (inDays % 7 != 0 || ((inDays / 7) % interval) != 0) {
          continue;
        }
      } else if (reminder.repeat == RepeatType.Monthly) {
        final inMonth = date.month - remindDate.month;
        if (remindDate.day != date.day || inMonth % interval != 0) {
          continue;
        }
      } else if (reminder.repeat == RepeatType.Yearly) {
        final inYear = date.year - remindDate.year;
        if (remindDate.month != date.month ||
            remindDate.day != date.day ||
            inYear % interval != 0) {
          continue;
        }
      }
      result.add(Event(
          parentId: reminder.id,
          name: reminder.name,
          startTime: startTime,
          endTime: startTime,
          type: EventType.GeneradeReminder,
          alert: reminder.alert,
          repeat: RepeatType.None));
    }
    return result;
  }
}
