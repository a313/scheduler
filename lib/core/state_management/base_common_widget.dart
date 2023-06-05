import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../../widgets/loading_indicator.dart';
import '../../widgets/popups/confirm_popup.dart';
import '../usecase/data_state.dart';
import '../utils/util.dart';

class BaseCommonWidgets {
  /// Do not call on onInit
  ///
  /// it may cause error

  void showLoading() {
    // EasyLoading.show();
    try {
      Get.dialog(
        const LoadingIndicator(),
        barrierDismissible: false,
        name: "LOADING_DIALOG",
      );
    } catch (e) {
      log(e.toString());
    }
  }

  void dismissLoading() {
    hideDialog(name: "LOADING_DIALOG");
  }

  void hideDialog({String? name}) {
    if (Get.isDialogOpen ?? false) {
      if (name != null) {
        if (Get.routing.route?.settings.name == name) {
          Get.back();
        }
      } else {
        Get.back();
      }
    }
  }

  void hideAllDialog() {
    if (Get.isDialogOpen ?? false) {
      Get.back(closeOverlays: true);
    }
  }

  void hideKeyboard() {
    Get.focusScope?.unfocus();
  }

  void showSnackBar(String message,
      {String? title,
      SnackBarType type = SnackBarType.success,
      SnackPosition position = SnackPosition.TOP}) {
    Color textColor;
    Color bgColor;
    Color iconColor;
    String iconPath;
    final context = Get.context!;
    switch (type) {
      case SnackBarType.info:
        textColor = context.neutral1100;
        bgColor = context.bgColor;
        iconPath = "assets/svg/ic_info_regular.svg";
        iconColor = context.primaryDark;
        break;

      case SnackBarType.error:
        textColor = context.neutral100;
        bgColor = context.funcRadicalRed;
        iconPath = "assets/svg/ic_warning_circle_regular.svg";
        iconColor = context.neutral100;
        break;

      case SnackBarType.success:
        textColor = context.neutral100;
        bgColor = context.primaryDark;
        iconPath = "assets/svg/ic_check_circle.svg";
        iconColor = context.neutral100;
        break;

      case SnackBarType.warning:
        textColor = context.primaryDark;
        bgColor = context.funcIcterine;
        iconPath = "assets/svg/ic_warning_regular.svg";
        iconColor = context.primaryDark;
        break;
    }

    final bar = GetSnackBar(
      titleText: title == null
          ? null
          : Text(title,
              style: AppFonts.h500.copyWith(color: textColor, height: 1)),
      messageText: Text(
        message,
        textScaleFactor: 1,
        style: AppFonts.bSmall.copyWith(color: textColor, height: 1),
      ),
      mainButton: IconButton(
        icon: const Icon(Icons.close),
        iconSize: 16,
        color: iconColor,
        onPressed: Get.closeCurrentSnackbar,
      ),
      margin: padAll16,
      padding: padSymHor16Ver12,
      borderRadius: 8.0,
      icon: Padding(
        padding: const EdgeInsets.only(left: 6),
        child: SvgPicture.asset(iconPath,
            width: 28,
            height: 28,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn)),
      ),
      snackPosition: position,
      backgroundColor: bgColor,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 250),
    );

    Get.showSnackbar(bar);
  }

  void bottomSheet(Widget bottomSheet) {
    Get.bottomSheet(
      bottomSheet,
      useRootNavigator: true,
      isScrollControlled: true,
    );
  }

  Future<T?> showPopup<T>(
    Widget popup, {
    bool dismissable = true,
    Function? onCompleted,
    bool useSafeArea = true,
  }) {
    return Get.dialog<T>(
      popup,
      barrierDismissible: dismissable,
      name: popup.runtimeType.toString(),
      useSafeArea: useSafeArea,
    ).whenComplete(() => onCompleted?.call());
  }

  void onDataFailed<T>(
    DataFailure<T> failure, {
    VoidCallback? onConfirm,
    String? title,
    String? btnTitle,
    bool dismissable = true,
  }) {
    showPopup(
      ConfirmPopup(
        title: title,
        btnTitle: btnTitle,
        desc: failure.message,
        onConfirm: onConfirm,
      ),
      dismissable: dismissable,
    );
  }
}
