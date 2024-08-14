import 'package:get/get.dart';
import 'package:aio/core/state_management/base_controller.dart';
import 'package:aio/core/usecase/data_state.dart';
import 'package:aio/domain/usecases/vpn_usecases.dart';

import '../../domain/entities/vpn_info.dart';

class VpnController extends BaseController with StateMixin<List<VpnInfo>> {
  late List<VpnInfo> data;

  VpnUseCases get useCases => Get.find<VpnUseCases>();

  @override
  void onInit() {
    fetchServers();
    super.onInit();
  }

  Future<void> fetchServers() async {
    final result = await useCases.getVpnServers();
    if (result is DataSuccess<List<VpnInfo>>) {
      data = result.data;
      change(data, status: RxStatus.success());
    } else {}
  }
}
