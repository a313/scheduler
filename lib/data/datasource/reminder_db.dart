import 'db_helper.dart';

const REMINDER_TABLE = "reminder_db";

abstract class ReminderDB extends DBSQLHelper {
  ReminderDB(super.db);

  static String getCreateSQL() {
    return '''CREATE TABLE $REMINDER_TABLE (
      id INTEGER PRIMARY KEY,
      name TEXT not null,      
      createDate INTEGER,              
      softIndex INTEGER,
      image TEXT      
      )''';
  }
}

class ReminderDBImpl extends ReminderDB {
  ReminderDBImpl(super.db);

  @override
  String get table => REMINDER_TABLE;
}
