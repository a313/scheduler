import 'package:scheduler/data/datasource/db_helper.dart';

const EVENT_TABLE = "event_db";

abstract class EventDB extends DBSQLHelper {
  EventDB(super.db);

  static String getCreateSQL() {
    return '''CREATE TABLE $EVENT_TABLE (
      id INTEGER PRIMARY KEY,
      name TEXT not null,
      startTime INTEGER,
      endTime INTEGER,
      location TEXT,
      alert TEXT,
      repeat TEXT,
      classIds TEXT,
      invitedIds TEXT,
      joinedIds TEXT,
      note TEXT
      )''';
  }
}

class EventDbImpl extends EventDB {
  @override
  String get table => EVENT_TABLE;

  EventDbImpl(super.db);
}
