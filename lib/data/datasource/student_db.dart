import 'package:sqflite/sqflite.dart';

const STUDENT_TABLE = "student_db";

abstract class StudentDb {
  static String getCreateSQL() {
    return '''CREATE TABLE $STUDENT_TABLE (
      id INTEGER PRIMARY KEY,
      name TEXT not null,
      classId TEXT not null,
      beginStudy String,
      phones TEXT,
      isSpecial INTEGER,
      fee INTEGER,
      isFollow INTEGER,
      image TEXT
      )''';
  }

  Future<List<Map<String, Object?>>> getAllStudent();
  Future<bool> isExist(int id);
  Future<int> insertOrUpdate(Map<String, Object?> values);
  Future<int> insert(Map<String, Object?> values);
  Future<int> update(Map<String, Object?> values);
}

class StudentDbImpl extends StudentDb {
  final Database _;
  final table = STUDENT_TABLE;
  StudentDbImpl(this._);

  @override
  Future<List<Map<String, Object?>>> getAllStudent() async {
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
    return (await _.query(table, where: 'id = $id')).isNotEmpty;
  }

  @override
  Future<int> insert(Map<String, Object?> values) async {
    return await _.insert(table, values);
  }

  @override
  Future<int> update(Map<String, Object?> values) async {
    return await _.update(table, values);
  }
}
