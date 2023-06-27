import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../base/base_button.dart';
import '../base/base_popup.dart';

class YesNoPopup extends StatelessWidget {
  const YesNoPopup({
    Key? key,
    required this.desc,
    this.title = 'Warning',
    this.okTitle = 'Ok',
    this.cancelTitle = 'Cancel',
    required this.onOk,
    this.onCancel,
  }) : super(key: key);

  final String desc;
  final String title;
  final String okTitle;
  final String cancelTitle;
  final Function() onOk;
  final Function()? onCancel;
  @override
  Widget build(BuildContext context) {
    return BasePopup(
      title: title,
      desc: desc,
      actions: [
        BaseButton.largeSecondary(
          width: double.infinity,
          title: cancelTitle,
          onPressed: onCancel != null ? onCancel! : Get.back,
        ),
        BaseButton.largePrimary(
          width: double.infinity,
          title: okTitle,
          onPressed: onOk,
        )
      ],
    );
  }
}
