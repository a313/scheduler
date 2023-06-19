import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/domain/usecases/class_room_usecases.dart';

import '../../routes/routes.dart';

class ClassRoomController extends BaseController
    with StateMixin<List<ClassRoom>> {
  final ClassRoomUseCases useCase = Get.find();

  final refreshController = RefreshController();
  final emptyController = RefreshController();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void onTappedFilter() {}

  void onRefresh() {}

  void onLoading() {}

  Future<void> addClassRoom() async {
    final result = await Get.toNamed(Routes.editClassRoom);
    if (result != null) {
      getData();
    }
  }

  Future<void> onEditClassRoom(ClassRoom classroom) async {
    final result =
        await Get.toNamed(Routes.editClassRoom, arguments: classroom);
    if (result != null) {
      getData();
    }
  }

  void onTappedClassRoom(ClassRoom classroom) {}

  Future<void> getData() async {
    final result = await useCase.getAllClassRoom();
    if (result is DataSuccess<List<ClassRoom>>) {
      allClassRoom = result.data;
      updateUI();
    } else if (result is DataFailure<List<ClassRoom>>) {
      onDataFailed(result);
    }
  }

  void updateUI() {
    if (allClassRoom.isEmpty) {
      change(allClassRoom, status: RxStatus.empty());
    } else {
      change(allClassRoom, status: RxStatus.success());
    }
  }
}
