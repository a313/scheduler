import 'package:get/get.dart';
import 'gemini_controller.dart';

class GeminiBinding implements Bindings {
   	@override
  	void dependencies() {
    	Get.put<GeminiController>(GeminiController());
  	}
}