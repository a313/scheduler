import 'package:path/path.dart';
import 'package:scheduler/data/datasource/class_room_db.dart';
import 'package:scheduler/data/datasource/reminder_db.dart';
import 'package:sqflite/sqflite.dart';

import 'student_db.dart';

class DBHelper {
  static Future<Database> openDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'app_database.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(ReminderDB.getCreateSQL());
      await db.execute(StudentDB.getCreateSQL());
      await db.execute(ClassRoomDB.getCreateSQL());
    });
    return database;
  }
}
