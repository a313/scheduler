import 'package:drift/drift.dart';

const REMINDER_TABLE = "reminder_drift";

@DataClassName(REMINDER_TABLE)
class ReminderTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  DateTimeColumn get remindDate => dateTime().nullable()();
  DateTimeColumn get createDate => dateTime().nullable()();
  TextColumn get alert => text().nullable()();
  TextColumn get time => text().nullable()();
  TextColumn get repeat => text().nullable()();
  IntColumn get interval => integer()();
  IntColumn get softIndex => integer().withDefault(const Constant(-1))();
  TextColumn get image => text().nullable()();
}
