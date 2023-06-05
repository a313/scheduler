import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const dbName = 'db.db';

class DbHelper {
  Future<void> openAssertDB() async {
    String path = await getDbPath();

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

    await db.close();
  }

  Future<String> getDbPath() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, dbName);
    return path;
  }

  Future<File> writeFileAsBytes(String path, Uint8List data) async {
    return File(path).writeAsBytes(data);
  }
}
