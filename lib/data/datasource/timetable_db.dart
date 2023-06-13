import 'package:scheduler/data/datasource/db_helper.dart';

const TIMETABLE_TABLE = "timetable_db";

abstract class TimetableDB extends DBSQLHelper {
  TimetableDB(super.db);

  static String getCreateSQL() {
    return '''CREATE TABLE $TIMETABLE_TABLE (
      id INTEGER PRIMARY KEY,
      classId INTEGER,      
      begin TEXT,      
      end TEXT,      
      dayInWeek INTEGER                
      )''';
  }

  Future<List<Map<String, dynamic>>> getTimetableOfClass(int id);
}

class TimetableDBImpl extends TimetableDB {
  @override
  String get table => TIMETABLE_TABLE;

  TimetableDBImpl(super.db);

  @override
  Future<List<Map<String, dynamic>>> getTimetableOfClass(int id) {
    return db.query(table, where: 'classId = ?', whereArgs: [id]);
  }
}
