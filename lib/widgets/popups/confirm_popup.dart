import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/base_button.dart';
import '../base/base_popup.dart';

class ConfirmPopup extends StatelessWidget {
  const ConfirmPopup({
    Key? key,
    required this.desc,
    this.title,
    this.onConfirm,
    this.btnTitle,
  }) : super(key: key);

  final String desc;
  final String? title;
  final String? btnTitle;
  final Function()? onConfirm;
  @override
  Widget build(BuildContext context) {
    return BasePopup(
      title: title ?? 'Oops! Something wrong',
      desc: desc,
      actions: [
        BaseButton.largePrimary(
          width: double.infinity,
          title: btnTitle ?? 'Close',
          onPressed: onConfirm != null ? onConfirm! : Get.back,
        )
      ],
    );
  }
}
