import 'package:get/get.dart';
import 'package:scheduler/domain/usecases/local_usecase.dart';

import 'base_common_widget.dart';

class BaseController extends GetxController with BaseCommonWidgets {
  LocalUseCases get local => Get.find();
  void backToHome({int selectTab = 0}) {}
}
