import 'package:audio_service/audio_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/drift_db/database.dart';
import 'package:aio/data/repo_impl/class_room_repo_impl.dart';
import 'package:aio/data/repo_impl/event_repo_impl.dart';
import 'package:aio/data/repo_impl/local_data_repo_impl.dart';
import 'package:aio/data/repo_impl/notification_repo_impl.dart';
import 'package:aio/data/repo_impl/reminder_repo_impl.dart';
import 'package:aio/data/repo_impl/schedule_repo_impl.dart';
import 'package:aio/data/repo_impl/student_repo_impl.dart';
import 'package:aio/data/repo_impl/weather_repo_impl.dart';
import 'package:aio/data/services/music_service.dart';
import 'package:aio/data/services/vpn_service.dart';
import 'package:aio/data/services/weather_service.dart';
import 'package:aio/data/sqlite_db/class_room_db.dart';
import 'package:aio/data/sqlite_db/db_helper.dart';
import 'package:aio/data/sqlite_db/event_db.dart';
import 'package:aio/data/sqlite_db/reminder_db.dart';
import 'package:aio/data/sqlite_db/schedule_db.dart';
import 'package:aio/data/sqlite_db/student_db.dart';
import 'package:aio/domain/usecases/class_room_usecases.dart';
import 'package:aio/domain/usecases/event_usecases.dart';
import 'package:aio/domain/usecases/local_usecase.dart';
import 'package:aio/domain/usecases/music_usecases.dart';
import 'package:aio/domain/usecases/notification_usecases.dart';
import 'package:aio/domain/usecases/reminder_usecases.dart';
import 'package:aio/domain/usecases/schedule_usecases.dart';
import 'package:aio/domain/usecases/student_usecases.dart';
import 'package:aio/domain/usecases/weather_usecases.dart';
import 'package:aio/global.dart';

import 'data/repo_impl/audio_handler_impl.dart';
import 'data/repo_impl/music_repo_impl.dart';
import 'data/repo_impl/vpn_repo_impl.dart';
import 'domain/usecases/vpn_usecases.dart';

class DependencyInjection {
  static Future<void> injection() async {
    Get.put(Global());
    Get.put(LocalUseCases(LocalDataImpl(GetStorage())));
    Get.put(AppDatabase(), permanent: true);
    if (isMobile) {
      final db = await DBHelper.openDb();

      Get.put(NotificationUseCases(NotificationRepoImpl()));

      Get.put(EventUseCases(EventRepoImpl(EventDbImpl(db))));

      Get.put(StudentUseCases(StudentRepoImpl(StudentDbImpl(db))));

      Get.put(ClassRoomUseCases(ClassRoomRepoImpl(ClassRoomDBImpl(db))));

      Get.put(ReminderUseCases(ReminderRepoImpl(ReminderDBImpl(db))));

      Get.put(ReminderUseCases(ReminderRepoImpl(ReminderDBImpl(db))));

      Get.put(ScheduleUseCases(aioepoImpl(ScheduleDBImpl(db))));
    }
    Get.put(WeatherUseCases(
        WeatherRepoImpl(WeatherbitService(), LocalDataImpl(GetStorage()))));

    Get.put(VpnUseCases(VpnRepoImpl(VpnServiceImp())));

    Get.put(MusicUseCases(MusicRepoImpl(MusicServiceImpl())));

    final audioHandler = await AudioService.init(
        builder: () => AudioHandlerImpl(),
        config: const AudioServiceConfig(
          androidNotificationChannelId: 'com.ntt.aio.channel.audio',
          androidNotificationChannelName: 'Audio playback',
          androidNotificationOngoing: true,
        ));

    Get.put<AudioHandler>(audioHandler);
  }
}
