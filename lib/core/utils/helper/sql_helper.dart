import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const dbName = 'db.database';

class DbHelper {
  Future<Database> openAssertDB() async {
    String path = await getDbPath(dbName);

    Database? db;
    try {
      db = await openDatabase(path, readOnly: true);
    } catch (e) {
      log(e.toString());
    }

    if (db == null) {
      log('Creating new copy from asset');

      final data = await rootBundle.load(join('assets', 'db.sqlite'));
      final bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await writeFileAsBytes(path, bytes);

      db = await openDatabase(path, readOnly: true);
    } else {
      log('Opening existing database');
    }

    return db;
  }

  Future<String> getDbPath(String name) async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, name);
    return path;
  }

  Future<File> writeFileAsBytes(String path, Uint8List data) async {
    return File(path).writeAsBytes(data);
  }

  Future<void> replaceDatabase() async {
    final data = await rootBundle.load(join('assets', 'app_database.db'));
    final bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    final path = await getDbPath('app_database.db');
    await deleteDatabase(path);
    await writeFileAsBytes(path, bytes);
  }
}
