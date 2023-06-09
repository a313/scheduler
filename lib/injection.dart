import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scheduler/data/datasource/db_helper.dart';
import 'package:scheduler/data/datasource/student_db.dart';
import 'package:scheduler/data/repo_impl/local_data_impl.dart';
import 'package:scheduler/data/repo_impl/student_repo_impl.dart';
import 'package:scheduler/domain/usecases/local_usecase.dart';
import 'package:scheduler/domain/usecases/student_usecase.dart';

class DependencyInjection {
  static Future<void> injection() async {
    Get.put<LocalUseCases>(LocalUseCases(LocalDataImpl(GetStorage())));
    final db = await DBHelper.openDb();

    Get.lazyPut<StudentUseCase>(
      () => StudentUseCase(StudentRepoImpl(StudentDbImpl(db))),
      fenix: true,
    );
  }
}
