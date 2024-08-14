import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/data/sqlite_db/reminder_db.dart';
import 'package:aio/data/models/reminder.dart';

import '../../core/utils/util.dart';
import '../../domain/repo_abs/reminder_repo_abs.dart';

class ReminderRepoImpl extends ReminderRepo {
  final ReminderDB db;

  ReminderRepoImpl(this.db);
  @override
  Future<DataState<List<Reminder>>> getAllReminder() async {
    final data = await db.fetchAll();
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
    final id = await db.insertOrUpdate(data.toJson());

    if (id == 0) {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    } else {
      data.id ??= id;
      return DataSuccess(data);
    }
  }
}
