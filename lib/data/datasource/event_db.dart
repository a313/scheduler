import 'dart:developer';

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

  Future<List<Map<String, dynamic>>> getAllEvent(OrderType order);

  Future<List<Map<String, dynamic>>> getEventByType(EventType type);

  Future<List<Map<String, dynamic>>> getEventsFrom(
      int from, int to, OrderType type);

  Future<int> removeEvents({
    required int parentId,
    required EventType type,
    required int from,
    required int to,
  });
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
    return result;
  }

  @override
  Future<int> removeEvents({
    required int parentId,
    required EventType type,
    required int from,
    required int to,
  }) async {
    final result = await db.delete(table,
        where: 'parentId = ? AND type = ? AND startTime BETWEEN ? and ?',
        whereArgs: [parentId, type.name, from, to]);
    return result;
  }

  @override
  Future<List<Map<String, dynamic>>> getAllEvent(OrderType order) async {
    final result = await db.query(table, orderBy: 'startTime ${order.name}');
    log('getAllEvent $table: ${result.length}', name: 'DATABASE');
    return result;
  }
}
