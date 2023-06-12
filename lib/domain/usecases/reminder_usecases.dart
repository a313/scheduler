import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/reminder.dart';

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
}
