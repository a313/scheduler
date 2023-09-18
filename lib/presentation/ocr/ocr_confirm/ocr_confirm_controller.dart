import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/ekyc.dart';

import '../ocr_camera/ocr_camera_binding.dart';
import '../ocr_camera/ocr_camera_page.dart';

class OcrConfirmController extends BaseController {
  final Ekyc origin;

  late Ekyc current;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  OcrConfirmController(this.origin);

  @override
  void onInit() {
    super.onInit();
    current = origin.copyWith();
  }

  void onReTake() {
    Get.off(
      () => const OcrCameraPage(),
      binding: OcrCameraBinding(CameraType.portrait, current),
    );
  }

  void onSubmit() {
    if (formKey.currentState?.validate() ?? false) {
      showSnackBar('Success', type: SnackBarType.success);
    } else {
      showSnackBar('Error', type: SnackBarType.error);
    }
  }

  void onChangePoR(String p1) {
    current.placeOfResidence = p1;
  }

  void onChangeCCCD(String p1) {
    current.identifyNumber = p1;
  }

  void onChangeName(String p1) {
    current.fullName = p1;
  }

  void onChangeNation(String p1) {
    current.nationality = p1;
  }

  void onChangeIssueLoc(String p1) {
    current.issueLoc = p1;
  }

  void onChangePoO(String p1) {
    current.placeOfOrigin = p1;
  }

  void onChangeBirthday(DateTime? date) {
    if (date != null) {
      current.dateOfBirth = date.toStringFormat(DateFormater.ddMMYYYY);
    }
  }

  void onChangeGender(String value) {
    current.sex = value;
  }

  void onChangeIssueDate(DateTime? date) {
    if (date != null) {
      current.issueDate = date.toStringFormat(DateFormater.ddMMYYYY);
    }
  }

  void onChangeDateOfExpired(DateTime? date) {
    if (date != null) {
      current.dateOfExpiry = date.toStringFormat(DateFormater.ddMMYYYY);
    }
  }
}
