import 'package:get/get.dart';

import 'hex_to_link_controller.dart';

class HexToLinkBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HexToLinkController>(() => HexToLinkController(), fenix: true);
  }
}
