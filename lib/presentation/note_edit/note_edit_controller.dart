import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class NoteEditController extends GetxController {
  final quill = QuillController.basic();

  void onTapCamera() {}

  void onSave() {
    final data = jsonEncode(quill.document.toDelta().toJson());
  }
}
