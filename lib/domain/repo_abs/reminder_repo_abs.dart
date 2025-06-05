import 'package:aio/core/usecase/data_state.dart';

import '../../data/models/reminder.dart';

abstract class ReminderRepo {
  Future<DataState<List<Reminder>>> getAllReminder();

  Future<DataState<Reminder>> insertOrUpdate(Reminder data);

  Future<DataState<int>> delete(int id);
}
