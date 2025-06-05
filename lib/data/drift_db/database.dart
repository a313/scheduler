import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'reminder_table.dart';
import 'schedule_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [ReminderTable, ScheduleTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'db_drift'));

  @override
  int get schemaVersion => 1;
}
