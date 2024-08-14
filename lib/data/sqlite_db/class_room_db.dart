import 'package:aio/data/sqlite_db/db_helper.dart';

const CLASSROOM_TABLE = "class_room_db";

abstract class ClassRoomDB extends DBSQLHelper {
  ClassRoomDB(super.db);

  static String getCreateSQL() {
    return '''CREATE TABLE $CLASSROOM_TABLE (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,      
      createDate INTEGER,     
      openDate INTEGER,     
      timetables TEXT,
      alert TEXT,
      location TEXT,
      tuition INTEGER,      
      isOpen INTEGER,          
      softIndex INTEGER,
      image TEXT      
      )''';
  }
}

class ClassRoomDBImpl extends ClassRoomDB {
  @override
  String get table => CLASSROOM_TABLE;

  ClassRoomDBImpl(super.db);
}
