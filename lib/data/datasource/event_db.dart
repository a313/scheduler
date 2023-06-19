import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/datasource/db_helper.dart';

const EVENT_TABLE = "event_db";

abstract class EventDB extends DBSQLHelper {
  EventDB(super.db);

  static String getCreateSQL() {
    return '''CREATE TABLE $EVENT_TABLE (
      id INTEGER PRIMARY KEY,
      parentId INTEGER,
      name TEXT not null,
      startTime INTEGER,
      endTime INTEGER,
      isActive INTEGER,
      location TEXT,
      type TEXT,
      alert TEXT,
      repeat TEXT,
      classIds TEXT,
      invitedIds TEXT,
      joinedIds TEXT,
      note TEXT
      )''';
  }

  Future<List<Map<String, dynamic>>> getEventByType(EventType type);

  Future<List<Map<String, dynamic>>> getEventsFrom(int from, int to);
}

class EventDbImpl extends EventDB {
  @override
  String get table => EVENT_TABLE;

  EventDbImpl(super.db);

  @override
  Future<List<Map<String, dynamic>>> getEventByType(EventType type) async {
    final result = await db.query(table, where: 'type = ?', whereArgs: [type]);
    return result;
  }

  @override
  Future<List<Map<String, dynamic>>> getEventsFrom(int from, int to) async {
    final result = await db.query(table,
        where: 'startTime BETWEEN ? and ?', whereArgs: [from, to]);
    return result;
  }
}
