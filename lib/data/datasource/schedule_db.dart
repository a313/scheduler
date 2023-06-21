import 'package:scheduler/data/datasource/db_helper.dart';

const SCHEDULE_TABLE = "schedule_db";

abstract class ScheduleDB extends DBSQLHelper {
  ScheduleDB(super.db);

  static String getCreateSQL() {
    return '''CREATE TABLE $SCHEDULE_TABLE (
      id INTEGER PRIMARY KEY,
      name TEXT not null,
      begin TEXT not null,
      end TEXT not null
      )''';
  }
}

class ScheduleDBImpl extends ScheduleDB {
  @override
  String get table => SCHEDULE_TABLE;

  ScheduleDBImpl(super.db);
}
