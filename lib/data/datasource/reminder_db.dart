import 'package:sqflite/sqflite.dart';

const REMINDER_TABLE = "reminder_db";

abstract class ReminderDB {
  static String getCreateSQL() {
    return '''CREATE TABLE $REMINDER_TABLE (
      id INTEGER PRIMARY KEY,
      name TEXT not null,      
      createDate TEXT,      
      tuition INTEGER,      
      isOpen INTEGER,          
      softIndex INTEGER,
      image TEXT      
      )''';
  }

  Future<List<Map<String, Object?>>> getAllReminder();
  Future<bool> isExist(int id);
  Future<int> insertOrUpdate(Map<String, Object?> values);
  Future<int> insert(Map<String, Object?> values);
  Future<int> update(Map<String, Object?> values);
  Future<int> delete(int id);
}

class ReminderDBImpl extends ReminderDB {
  final Database _;
  final table = REMINDER_TABLE;
  ReminderDBImpl(this._);

  @override
  Future<List<Map<String, Object?>>> getAllReminder() async {
    return await _.query(table);
  }

  @override
  Future<int> insertOrUpdate(Map<String, Object?> values) async {
    final id = values['id'] as int?;
    if (id == null || !await isExist(id)) {
      return insert(values);
    } else {
      return update(values);
    }
  }

  @override
  Future<bool> isExist(int id) async {
    return (await _.query(table, where: 'id = ?', whereArgs: [id])).isNotEmpty;
  }

  @override
  Future<int> insert(Map<String, Object?> values) async {
    return await _.insert(table, values);
  }

  @override
  Future<int> update(Map<String, Object?> values) async {
    return await _.update(table, values);
  }

  @override
  Future<int> delete(int id) async {
    return await _.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
