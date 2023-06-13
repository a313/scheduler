import 'package:path/path.dart';
import 'package:scheduler/data/datasource/class_room_db.dart';
import 'package:scheduler/data/datasource/reminder_db.dart';
import 'package:scheduler/data/datasource/timetable_db.dart';
import 'package:sqflite/sqflite.dart';

import 'student_db.dart';

class DBHelper {
  static Future<Database> openDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'app_database.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(ReminderDB.getCreateSQL());
      await db.execute(TimetableDB.getCreateSQL());
      await db.execute(StudentDB.getCreateSQL());
      await db.execute(ClassRoomDB.getCreateSQL());
    });
    return database;
  }
}

abstract class DBSQLHelper {
  final Database db;
  String get table;

  DBSQLHelper(this.db);

  Future<List<Map<String, dynamic>>> fetchAll() async {
    return db.query(table);
  }

  Future<int> insertOrUpdate(Map<String, Object?> values) async {
    final id = values['id'] as int?;
    if (id == null || !await isExist(id)) {
      return insert(values);
    } else {
      return update(id, values);
    }
  }

  Future<Map<String, dynamic>?> findById(int id) async {
    final data = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (data.isNotEmpty) return data.first;
    return null;
  }

  Future<bool> isExist(int id) async {
    return (await db.query(table, where: 'id = ?', whereArgs: [id])).isNotEmpty;
  }

  Future<int> insert(Map<String, Object?> values) async {
    return await db.insert(table, values);
  }

  Future<int> update(int id, Map<String, Object?> values) async {
    return await db.update(table, values, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
