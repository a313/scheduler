import 'package:scheduler/data/datasource/db_helper.dart';

const CLASSROOM_TABLE = "class_room_db";

abstract class ClassRoomDB extends DBSQLHelper {
  ClassRoomDB(super.db);

  static String getCreateSQL() {
    return '''CREATE TABLE $CLASSROOM_TABLE (
      id INTEGER PRIMARY KEY,
      name TEXT not null,   
      schedulerId TEXT,   
      createDate TEXT,      
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