import 'package:drift/drift.dart';

const SCHEDULE_TABLE = "schedule_drift";

@DataClassName(SCHEDULE_TABLE)
class ScheduleTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 255)();
  TextColumn get begin => text()();
  TextColumn get end => text()();
}
