
import 'package:get/get.dart';
import 'note_edit_controller.dart';

class NoteEditBinding implements Bindings {
@override
void dependencies() {
    Get.put<NoteEditController>(NoteEditController());
}
}