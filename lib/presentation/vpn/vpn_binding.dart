import 'package:get/get.dart';

import 'vpn_controller.dart';

class VpnBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VpnController>(() => VpnController(), fenix: true);
  }
}
