import 'package:get/get.dart';

import 'qrcode_controller.dart';

class QrcodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrcodeController>(() => QrcodeController(), fenix: true);
  }
}
