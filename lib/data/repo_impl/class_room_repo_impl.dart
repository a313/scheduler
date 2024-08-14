import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/sqlite_db/class_room_db.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/domain/repo_abs/class_room_repo_abs.dart';

import '../../core/utils/util.dart';

class ClassRoomRepoImpl extends ClassRoomRepo {
  final ClassRoomDB db;

  ClassRoomRepoImpl(this.db);
  @override
  Future<DataState<List<ClassRoom>>> getAllClassRoom() async {
    final data = await db.fetchAll();
    return DataSuccess(ClassRoom.getListFromDB(data));
  }

  @override
  Future<DataState<ClassRoom>> getClassRoomById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<ClassRoom>> insertOrUpdate(ClassRoom data) async {
    final id = await db.insertOrUpdate(data.toJson());
    if (id == 0) {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    } else {
      data.id ??= id;
      return DataSuccess(data);
    }
  }

  @override
  Future<DataState<int>> delete(int id) async {
    final data = await db.delete(id);
    if (data > 0) {
      return DataSuccess(data);
    } else {
      return DataFailure(DB_ERR_CODE, DB_ERR_MSG);
    }
  }
}
