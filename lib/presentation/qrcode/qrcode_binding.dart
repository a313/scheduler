
import 'package:get/get.dart';
import 'qrcode_controller.dart';

class QrcodeBinding implements Bindings {
@override
void dependencies() {
    Get.put<QrcodeController>(QrcodeController());
}
}