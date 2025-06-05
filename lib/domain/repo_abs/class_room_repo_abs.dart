import 'package:aio/data/models/class_room.dart';

import '../../core/usecase/data_state.dart';

abstract class ClassRoomRepo {
  Future<DataState<List<ClassRoom>>> getAllClassRoom();
  Future<DataState<ClassRoom>> getClassRoomById(int id);
  Future<DataState<ClassRoom>> insertOrUpdate(ClassRoom data);
  Future<DataState<int>> delete(int id);
}
