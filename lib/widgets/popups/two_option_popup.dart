import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/base_button.dart';
import '../base/base_popup.dart';

class TwoOptionPopup extends StatelessWidget {
  const TwoOptionPopup({
    Key? key,
    required this.desc,
    this.title = 'Warning',
    this.primaryTitle = 'Ok',
    this.secondaryTitle = 'Cancel',
    required this.onPrimary,
    this.onSecondary,
  }) : super(key: key);

  final String desc;
  final String? title;
  final String primaryTitle;
  final String secondaryTitle;
  final Function() onPrimary;
  final Function()? onSecondary;
  @override
  Widget build(BuildContext context) {
    return BasePopup(
      title: title?.tr,
      desc: desc,
      actions: [
        BaseButton.largeSecondary(
          width: double.infinity,
          title: secondaryTitle.tr,
          onPressed: onSecondary != null ? onSecondary! : Get.back,
        ),
        BaseButton.largePrimary(
          width: double.infinity,
          title: primaryTitle.tr,
          onPressed: onPrimary,
        )
      ],
    );
  }
}
