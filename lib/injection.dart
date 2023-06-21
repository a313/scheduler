import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scheduler/data/datasource/class_room_db.dart';
import 'package:scheduler/data/datasource/db_helper.dart';
import 'package:scheduler/data/datasource/event_db.dart';
import 'package:scheduler/data/datasource/reminder_db.dart';
import 'package:scheduler/data/datasource/student_db.dart';
import 'package:scheduler/data/repo_impl/class_room_repo_impl.dart';
import 'package:scheduler/data/repo_impl/event_repo_impl.dart';
import 'package:scheduler/data/repo_impl/local_data_repo_impl.dart';
import 'package:scheduler/data/repo_impl/reminder_repo_impl.dart';
import 'package:scheduler/data/repo_impl/student_repo_impl.dart';
import 'package:scheduler/domain/usecases/class_room_usecases.dart';
import 'package:scheduler/domain/usecases/event_usecases.dart';
import 'package:scheduler/domain/usecases/local_usecase.dart';
import 'package:scheduler/domain/usecases/reminder_usecases.dart';
import 'package:scheduler/domain/usecases/student_usecases.dart';
import 'package:scheduler/global.dart';

class DependencyInjection {
  static Future<void> injection() async {
    Get.put(Global());
    Get.put(LocalUseCases(LocalDataImpl(GetStorage())));
    final db = await DBHelper.openDb();

    Get.put(EventUseCases(EventRepoImpl(EventDbImpl(db))));

    Get.put(StudentUseCases(StudentRepoImpl(StudentDbImpl(db))));

    Get.put(ClassRoomUseCases(ClassRoomRepoImpl(ClassRoomDBImpl(db))));

    Get.put(ReminderUseCases(ReminderRepoImpl(ReminderDBImpl(db))));

    Get.put(ReminderUseCases(ReminderRepoImpl(ReminderDBImpl(db))));
  }
}
