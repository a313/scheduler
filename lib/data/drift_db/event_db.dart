import 'dart:developer';

import 'package:aio/core/utils/util.dart';
import 'package:aio/data/sqlite_db/db_helper.dart';

const EVENT_TABLE = "event_db";

abstract class EventDB extends DBSQLHelper {
  EventDB(super.db);

  static String getCreateSQL() {
    return '''CREATE TABLE $EVENT_TABLE (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      parentId INTEGER,
      name TEXT NOT NULL,
      startTime INTEGER,
      endTime INTEGER,
      isActive INTEGER,
      location TEXT,
      type TEXT,
      alert TEXT,
      repeat TEXT,
      classId INTEGER,
      invitedIds TEXT,
      joinedIds TEXT,
      note TEXT
      )''';
  }

  static String getAlterSQL1() {
    return '''ALTER TABLE $EVENT_TABLE 
      ADD COLUMN classId INTEGER    
    ''';
  }

  static String getAlterSQL2() {
    return '''UPDATE $EVENT_TABLE SET classId = CAST(classIds as INTEGER)''';
  }

  static String getAlterSQL3() {
    return '''ALTER TABLE $EVENT_TABLE DROP COLUMN classIds''';
  }

  Future<List<Map<String, dynamic>>> getAllEvent(OrderType order);

  Future<List<Map<String, dynamic>>> getEventByType(EventType type);

  Future<List<Map<String, dynamic>>> getEventsFrom(
      int from, int to, OrderType type);

  Future<int> removeEvents({
    int? parentId,
    EventType? type,
    required int from,
    required int to,
  });

  Future<List<Map<String, dynamic>>> getClassEventsFrom(
      int from, int to, OrderType type);
}

class EventDbImpl extends EventDB {
  @override
  String get table => EVENT_TABLE;

  EventDbImpl(super.db);

  @override
  Future<List<Map<String, dynamic>>> getEventByType(EventType type) async {
    final result =
        await db.query(table, where: 'type = ?', whereArgs: [type.name]);
    return result;
  }

  @override
  Future<List<Map<String, dynamic>>> getEventsFrom(
      int from, int to, OrderType type) async {
    final result = await db.query(table,
        where: 'startTime BETWEEN ? and ?',
        whereArgs: [from, to],
        orderBy: 'startTime ${type.name}');
    log('${result.length} Events - startTime BETWEEN $from and $to',
        name: 'QUERY');
    return result;
  }

  @override
  Future<int> removeEvents({
    int? parentId,
    EventType? type,
    required int from,
    required int to,
  }) async {
    var where = 'startTime BETWEEN ? AND ?';
    List<dynamic> whereArgs = [from, to];
    if (parentId != null) {
      where += ' AND parentId = ?';
      whereArgs.add(parentId);
    }
    if (type != null) {
      where += ' AND type = ?';
      whereArgs.add(type.name);
    }
    final result = await db.delete(table, where: where, whereArgs: whereArgs);
    log('$result Events - startTime BETWEEN $from AND $to AND parentId:$parentId AND type:$type',
        name: 'DELETED');
    return result;
  }

  @override
  Future<List<Map<String, dynamic>>> getAllEvent(OrderType order) async {
    final result = await db.query(table, orderBy: 'startTime ${order.name}');
    return result;
  }

  @override
  Future<List<Map<String, dynamic>>> getClassEventsFrom(
      int from, int to, OrderType type) async {
    final result = await db.query(table,
        where: 'classId IS NOT NULL AND startTime BETWEEN ? and ?  ',
        whereArgs: [from, to],
        orderBy: 'startTime ${type.name}');
    return result;
  }
}
