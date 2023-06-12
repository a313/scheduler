import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/datasource/reminder_db.dart';
import 'package:scheduler/data/models/reminder.dart';

import '../../core/utils/util.dart';
import '../../domain/repo_abs/reminder_repo_abs.dart';

class ReminderRepoImpl extends ReminderRepo {
  final ReminderDB db;

  ReminderRepoImpl(this.db);
  @override
  Future<DataState<List<Reminder>>> getAllReminder() async {
    final data = await db.getAllReminder();
    return DataSuccess(Reminder.getListFromDB(data));
  }

  @override
  Future<DataState<int>> delete(int id) async {
    final data = await db.delete(id);
    if (data > 0) {
      return DataSuccess(data);
    } else {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    }
  }

  @override
  Future<DataState<Reminder>> insertOrUpdate(Reminder data) async {
    final id = await db.insertOrUpdate(data.toDB());
    data.id = id;
    if (id == 0) {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    } else {
      return DataSuccess(data);
    }
  }
}
