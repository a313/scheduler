import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:path/path.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/datasource/class_room_db.dart';
import 'package:scheduler/data/datasource/event_db.dart';
import 'package:scheduler/data/datasource/reminder_db.dart';
import 'package:scheduler/data/datasource/schedule_db.dart';
import 'package:sqflite/sqflite.dart';

import 'student_db.dart';

class DBHelper {
  static Future<Database> openDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'app_database.db');
    Database database = await openDatabase(
      path,
      version: 3,
      onCreate: (Database db, int version) async {
        await db.execute(EventDB.getCreateSQL());
        await db.execute(ReminderDB.getCreateSQL());
        await db.execute(StudentDB.getCreateSQL());
        await db.execute(ClassRoomDB.getCreateSQL());
        await db.execute(ScheduleDB.getCreateSQL());
        await db.insertMultiple(SCHEDULE_TABLE, Utils.addExampleSchdule());
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        log('onUpgrade database old:$oldVersion - new:$newVersion');
        if (oldVersion < 2) {
          await db.execute(StudentDB.getAlterSQL());
        }
        if (oldVersion < 3) {
          await db.execute(EventDB.getAlterSQL1());
          await db.execute(EventDB.getAlterSQL2());
          await db.execute(EventDB.getAlterSQL3());
        }
      },
    );

    return database;
  }
}

abstract class DBSQLHelper {
  final Database db;
  String get table;

  DBSQLHelper(this.db);

  Future<List<Map<String, dynamic>>> fetchAll() async {
    final result = await db.query(table);
    log('$table: ${result.length}', name: 'FetchAll');
    return result;
  }

  Future<int?> insertAll(Iterable<Map<String, Object?>> data) async {
    log('$table: ${data.length}', name: 'InsertAll');
    if (data.isEmpty) return 0;
    return await db.insertMultiple(table, data);
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
    log('Into $table: ${values.toString()}', name: 'INSERT');
    return await db.insert(table, values);
  }

  Future<int> update(int id, Map<String, Object?> values) async {
    log('At $table id:$id: ${values.toString()}', name: 'UPDATE');
    return await db.update(table, values, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    log('At $table id:$id', name: 'DELETE');
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> truncate() async {
    log(table, name: 'DELETE ALL');
    return await db.delete(table);
  }
}

extension MultipleInsert on Database {
  Future<int?> insertMultiple(
    String table,
    Iterable<Map<String, Object?>> data, {
    ConflictAlgorithm? conflictAlgorithm,
    int blockSize = 100,
  }) async {
    final conflictStr = conflictAlgorithm == null
        ? ''
        : '${_conflictValues[conflictAlgorithm]}';
    final cols = data.first.keys.toList();
    final colsString = cols.map((e) => '"$e"').join(',\n\t');
    final command =
        'INSERT $conflictStr INTO "$table" (\n\t$colsString\n\t)\nVALUES\n\t';
    final argsString = '(${cols.map((e) => '?').join(', ')})';

    int? result;
    for (var chunk in chunk(data, blockSize)) {
      final sql = StringBuffer(command);
      final params = <Object?>[];
      chunk.forEachIndexed((i, row) {
        sql.write(argsString);
        if (i == chunk.length - 1) {
          sql.write(';');
        } else {
          sql.write(',\n\t');
        }
        for (var col in cols) {
          params.add(row[col]);
        }
      });
      result = await rawInsert(sql.toString(), params);
    }
    return result;
  }
}

const _conflictValues = {
  ConflictAlgorithm.rollback: 'OR ROLLBACK',
  ConflictAlgorithm.abort: 'OR ABORT',
  ConflictAlgorithm.fail: 'OR FAIL',
  ConflictAlgorithm.ignore: 'OR IGNORE',
  ConflictAlgorithm.replace: 'OR REPLACE'
};

Iterable<Iterable<T>> chunk<T>(Iterable<T> iterable, int chunkSize) sync* {
  var start = 0;
  while (start < iterable.length) {
    yield iterable.skip(start).take(chunkSize);
    start += chunkSize;
  }
}
