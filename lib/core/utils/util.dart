import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scheduler/core/utils/util.dart';
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

extension ListExt on List {
  void addSeparated({required Function(int index) separated}) {
    for (int i = length - 1; i > 0; i--) {
      insert(i, separated(i - 1));
    }
  }
}

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

  static double degreesToRadians(double degrees) {
    return degrees * pi / 180.0;
  }

  static double radiansToDegrees(double radians) {
    return radians * 180 / pi;
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
        createDate: DateTime.now().dateWithoutTime(),
        openDate: begin.dateWithoutTime(),
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
        repeat: RepeatType.None,
        alert: AlertType.None,
        interval: 1,
        name: name,
        remindDate: begin,
        createDate: DateTime.now().dateWithoutTime(),
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
          begin: const TimeOfDay(hour: 8, minute: 20),
          end: const TimeOfDay(hour: 9, minute: 05)),
      Schedule(
          name: 'AM Lesson 3',
          begin: const TimeOfDay(hour: 9, minute: 20),
          end: const TimeOfDay(hour: 10, minute: 05)),
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

  static String getPath(String? icon, {bool isSmall = true}) {
    final suffix = isSmall ? 'small' : 'large';
    switch (icon) {
      case 't01d':
      case 't02d':
      case 't03d':
        return 'assets/png/weather/$suffix/80030_tstorm_partly_cloudy_$suffix.png';
      case 't01n':
      case 't02n':
      case 't03n':
        return 'assets/png/weather/$suffix/80011_tstorm_mostly_clear_$suffix.png';
      case 't04d':
      case 't05d':
        return 'assets/png/weather/$suffix/80000_tstorm_$suffix.png';
      case 't04n':
      case 't05n':
        return 'assets/png/weather/$suffix/80021_tstorm_mostly_cloudy_$suffix.png';
      case 'd01d':
      case 'd02d':
      case 'd03d':
        return 'assets/png/weather/$suffix/40000_drizzle_$suffix.png';
      case 'd01n':
      case 'd02n':
      case 'd03n':
        return 'assets/png/weather/$suffix/42041_drizzle_partly_cloudy_$suffix.png';
      case 'r01d':
        return 'assets/png/weather/$suffix/80030_tstorm_partly_cloudy_$suffix.png';
      case 'r01n':
        return 'assets/png/weather/$suffix/42131_rain_light_mostly_clear_$suffix.png';
      case 'r02d':
        return 'assets/png/weather/$suffix/40010_rain_$suffix.png';
      case 'r02n':
        return 'assets/png/weather/$suffix/42081_rain_partly_cloudy_$suffix.png';
      case 'r03d':
        return 'assets/png/weather/$suffix/42111_rain_heavy_mostly_clear_$suffix.png';
      case 'r03n':
        return 'assets/png/weather/$suffix/80011_tstorm_mostly_clear_$suffix.png';
      case 'f01d':
        return 'assets/png/weather/$suffix/62010_freezing_rain_heavy_$suffix.png';
      case 'f01n':
        return 'assets/png/weather/$suffix/62021_freezing_rain_heavy_partly_cloudy_$suffix.png';
      case 'r04d':
      case 'r05d':
      case 'r06d':
        return 'assets/png/weather/$suffix/62020_freezing_rain_heavy_partly_cloudy_$suffix.png';
      case 'r04n':
      case 'r05n':
      case 'r06n':
        return 'assets/png/weather/$suffix/62020_freezing_rain_heavy_partly_cloudy_$suffix.png';
      case 's01d':
        return 'assets/png/weather/$suffix/51000_snow_light_$suffix.png';
      case 's01n':
        return 'assets/png/weather/$suffix/51021_snow_light_mostly_clear_$suffix.png';
      case 's02d':
        return 'assets/png/weather/$suffix/50000_snow_$suffix.png';
      case 's02n':
        return 'assets/png/weather/$suffix/51051_snow_mostly_clear_$suffix.png';
      case 's03d':
        return 'assets/png/weather/$suffix/51010_snow_heavy_$suffix.png';
      case 's03n':
        return 'assets/png/weather/$suffix/51191_snow_heavy_mostly_clear_$suffix.png';
      case 's04d':
      case 's05d':
      case 's06d':
        return 'assets/png/weather/$suffix/51050_snow_mostly_clear_$suffix.png';
      case 's04n':
      case 's05n':
      case 's06n':
        return 'assets/png/weather/$suffix/51051_snow_mostly_clear_$suffix.png';
      case 'a01d':
      case 'a02d':
      case 'a03d':
      case 'a04d':
        return 'assets/png/weather/$suffix/11020_mostly_cloudy_$suffix.png';
      case 'a01n':
      case 'a02n':
      case 'a03n':
      case 'a04n':
        return 'assets/png/weather/$suffix/11021_mostly_cloudy_$suffix.png';
      case 'a05d':
      case 'a06d':
        return 'assets/png/weather/$suffix/21060_fog_mostly_clear_$suffix.png';
      case 'a05n':
      case 'a06n':
        return 'assets/png/weather/$suffix/21061_fog_mostly_clear_$suffix.png';
      case 'c01d':
        return 'assets/png/weather/$suffix/10000_clear_$suffix.png';
      case 'c01n':
        return 'assets/png/weather/$suffix/10001_clear_$suffix.png';
      case 'c02d':
        return 'assets/png/weather/$suffix/11000_mostly_clear_$suffix.png';
      case 'c02n':
        return 'assets/png/weather/$suffix/11001_mostly_clear_$suffix.png';
      case 'c03d':
        return 'assets/png/weather/$suffix/11010_partly_cloudy_$suffix.png';
      case 'c03n':
        return 'assets/png/weather/$suffix/11011_partly_cloudy_$suffix.png';
      case 'c04d':
        return 'assets/png/weather/$suffix/10010_cloudy_$suffix.png';
      case 'c04n':
        return 'assets/png/weather/$suffix/10010_cloudy_$suffix.png';
      default:
        return 'assets/png/weather/$suffix/10000_clear_$suffix.png';
    }
  }
}
