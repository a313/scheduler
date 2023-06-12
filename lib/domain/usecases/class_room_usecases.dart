import '../../core/usecase/data_state.dart';
import '../../data/models/class_room.dart';
import '../repo_abs/class_room_repo_abs.dart';

class ClassRoomUseCases {
  final ClassRoomRepo _;

  ClassRoomUseCases(this._);

  Future<DataState<List<ClassRoom>>> getAllClassRoom() async {
    return await _.getAllClassRoom();
  }

  Future<DataState<ClassRoom>> insertOrUpdate(ClassRoom data) async {
    return await _.insertOrUpdate(data);
  }
}
