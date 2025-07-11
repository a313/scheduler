import 'package:aio/data/sqlite_db/db_helper.dart';

const STUDENT_TABLE = "student_db";

abstract class StudentDB extends DBSQLHelper {
  StudentDB(super.db);

  static String getCreateSQL() {
    return '''CREATE TABLE $STUDENT_TABLE (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      classId TEXT NOT NULL,
      beginStudy INTEGER,
      phones TEXT,
      isSpecial INTEGER,
      fee INTEGER,
      isFollow INTEGER,
      image TEXT,
      lastCharge INTEGER
      )''';
  }

  static String getAlterSQL() {
    return '''ALTER TABLE $STUDENT_TABLE 
      ADD lastCharge INTEGER
      ''';
  }

  Future<List<Map<String, Object?>>> getAllStudent();
}

class StudentDbImpl extends StudentDB {
  @override
  String get table => STUDENT_TABLE;

  StudentDbImpl(super.db);

  @override
  Future<List<Map<String, Object?>>> getAllStudent() async {
    return await db.query(table);
  }
}
