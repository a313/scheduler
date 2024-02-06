import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/widgets/avatar_picker.dart';
import 'package:scheduler/widgets/base/base_button.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'qrcode_controller.dart';

class QrcodePage extends GetView<QrcodeController> {
  const QrcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Generate Qr',
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    controller.obx(
                      (state) => Image.memory(state!)
                          .paddingSymmetric(horizontal: 24, vertical: 12),
                      onLoading: sizedBoxZero,
                    ),
                    sizedBoxH12,
                    Padding(
                      padding: padSymHor16,
                      child: Column(
                        children: [
                          Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                AvatarPicker(
                                    onChangedAvatar: controller.onChangedLogo),
                                BaseTextField(
                                  labelText: 'Content',
                                  controller: controller.contentController,
                                  validator: (value) {
                                    if (!value.hasText) {
                                      return 'Nothing to generate QR';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BaseButton.fixBottom2(
              leftTitle: 'Share',
              onLeftPressed: controller.shareQr,
              rightTitle: 'Generate',
              onRightPressed: controller.generateQr,
            )
          ],
        ));
  }
}
