import 'package:scheduler/data/sqlite_db/db_helper.dart';

const SCHEDULE_TABLE = "schedule_db";

abstract class ScheduleDB extends DBSQLHelper {
  ScheduleDB(super.db);

  static String getCreateSQL() {
    return '''CREATE TABLE $SCHEDULE_TABLE (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      begin TEXT NOT NULL,
      end TEXT NOT NULL
      )''';
  }
}

class ScheduleDBImpl extends ScheduleDB {
  @override
  String get table => SCHEDULE_TABLE;

  ScheduleDBImpl(super.db);
}
