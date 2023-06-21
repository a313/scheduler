import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scheduler/core/utils/constants/enums.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/reminder.dart';
import 'package:scheduler/data/models/schedule.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/class_room_usecases.dart';
import 'package:scheduler/domain/usecases/reminder_usecases.dart';
import 'package:scheduler/domain/usecases/student_usecases.dart';
import 'package:sqflite/sqflite.dart';

import 'helper/sql_helper.dart';

export 'constants/borders.dart';
export 'constants/date_format.dart';
export 'constants/durations.dart';
export 'constants/enums.dart';
export 'constants/error_code.dart';
export 'constants/paddings.dart';
export 'constants/sized_boxs.dart';
export 'constants/strings.dart';
export 'extensions/app_lifecycle_ext.dart';
export 'extensions/build_context.dart';
export 'extensions/color_context.dart';
export 'extensions/date_time.dart';
export 'extensions/durations.dart';
export 'extensions/map_ext.dart';
export 'extensions/nums.dart';
export 'extensions/scroll_controller.dart';
export 'extensions/string.dart';
export 'extensions/string_nullsafety.dart';
export 'extensions/widgets_ext.dart';
export 'helper/helper.dart';

class Utils {
  static String hexToAscii(String source) {
    source = source.removeAllWhitespace;
    return List.generate(
      source.length ~/ 2,
      (i) => String.fromCharCode(
          int.parse(source.substring(i * 2, (i * 2) + 2), radix: 16)),
    ).join();
  }

  static String asciiToHex(String source) {
    var buffer = StringBuffer();
    for (int i = 0; i < source.length; i++) {
      buffer.write(source.codeUnitAt(i).toRadixString(16));
    }
    return buffer.toString();
  }

  static Future<XFile?> pickImage(
      {required ImageSource source,
      double maxHeight = 300,
      double maxWidth = 300,
      int imageQuality = 90}) async {
    final ImagePicker picker = ImagePicker();

    final image = await picker.pickImage(
      source: source,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      imageQuality: imageQuality,
    );

    return image;
  }

  static Future<File> saveFileToLocal(
      {required String filePath, String? name}) async {
    final file = File(filePath);
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = name ?? basename(filePath);
    final amved = await file.copy('${appDir.path}/$fileName');
    return amved;
  }

  Future<void> cloneDb() async {
    final db = await DbHelper().openAssertDB();
    await cloneStudent(db);
    await cloneClass(db);
    await cloneReminder(db);
  }

  Future<void> cloneStudent(Database db) async {
    final students = await db.query('students');
    final uc = Get.find<StudentUseCases>();
    for (var s in students) {
      final name = s['name'] as String;
      final begin = DateTime.parse(s['beginStudy'] as String);
      final isSpecial = (s['isSpecial'] as int) == 1;
      final isFollow = (s['isFollow'] as int) == 1;
      final fee = s['fee'] as int;
      final classId = s['classId'] as int;
      //3->1
      //7->2
      var ids = <int>[];
      if (classId == 3) ids = [1];
      if (classId == 7) ids = [2];

      final obj = Student(
          name: name,
          classId: ids,
          phones: [],
          beginStudy: begin,
          isSpecial: isSpecial,
          isFollow: isFollow,
          fee: fee);
      uc.insertOrUpdate(obj);
    }
  }

  Future<void> cloneClass(Database db) async {
    final classRooms = await db.query('classRooms');
    final uc = Get.find<ClassRoomUseCases>();
    for (var data in classRooms) {
      final name = data['className'] as String;
      final begin = DateTime.parse(data['createDate'] as String);
      final fee = data['tuition'] as int;
      final obj = ClassRoom(
        name: name,
        createDate: begin,
        isOpen: true,
        tuition: fee,
        location: 'Home',
      );
      uc.insertOrUpdate(obj);
    }
  }

  Future<void> cloneReminder(Database db) async {
    final rs = await db.query('reminders');
    final uc = Get.find<ReminderUseCases>();
    for (var data in rs) {
      final name = data['label'] as String;
      final begin = DateTime.parse(data['createDate'] as String);

      final obj = Reminder(
        alert: AlertType.None,
        name: name,
        createDate: begin,
      );
      uc.insertOrUpdate(obj);
    }
  }

  static Iterable<Map<String, dynamic>> addExampleSchdule() {
    return [
      Schedule(
          name: 'AM Lesson 1',
          begin: const TimeOfDay(hour: 7, minute: 30),
          end: const TimeOfDay(hour: 8, minute: 15)),
      Schedule(
          name: 'AM Lesson 2',
          begin: const TimeOfDay(hour: 7, minute: 30),
          end: const TimeOfDay(hour: 8, minute: 15)),
      Schedule(
          name: 'AM Lesson 3',
          begin: const TimeOfDay(hour: 8, minute: 20),
          end: const TimeOfDay(hour: 9, minute: 05)),
      Schedule(
          name: 'AM Lesson 4',
          begin: const TimeOfDay(hour: 10, minute: 10),
          end: const TimeOfDay(hour: 10, minute: 55)),
      Schedule(
          name: 'AM Lesson 5',
          begin: const TimeOfDay(hour: 11, minute: 00),
          end: const TimeOfDay(hour: 11, minute: 45)),
      Schedule(
          name: 'PM Lesson 1',
          begin: const TimeOfDay(hour: 14, minute: 00),
          end: const TimeOfDay(hour: 14, minute: 45)),
      Schedule(
          name: 'PM Lesson 2',
          begin: const TimeOfDay(hour: 14, minute: 50),
          end: const TimeOfDay(hour: 15, minute: 35)),
      Schedule(
          name: 'PM Lesson 3',
          begin: const TimeOfDay(hour: 15, minute: 45),
          end: const TimeOfDay(hour: 16, minute: 30)),
      Schedule(
          name: 'PM Lesson 4',
          begin: const TimeOfDay(hour: 16, minute: 35),
          end: const TimeOfDay(hour: 17, minute: 20)),
    ].map((e) => e.toJson());
  }
}
