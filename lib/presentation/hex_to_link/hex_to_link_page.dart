import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/widgets/base/base_button.dart';
import 'package:aio/widgets/base/base_input.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';

import 'hex_to_link_controller.dart';

class HexToLinkPage extends GetView<HexToLinkController> {
  const HexToLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar(
        title: 'Hext To Text'.tr,
        onTappedScene: () => Get.focusScope?.unfocus(),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  children: [
                    BaseTextField(
                      controller: controller.hexController,
                      labelText: 'Hex String'.tr,
                    ),
                    sizedBoxH08,
                    BaseTextField(
                      controller: controller.decodedController,
                      labelText: 'Decoded String'.tr,
                    ),
                  ],
                ),
              ),
            ),
            // BaseButton.fixBottom(title: 'title', onPressed: () {}),
            BaseButton.fixBottom2(
              leftTitle: 'Decode'.tr,
              onLeftPressed: controller.onDecode,
              rightTitle: 'Open'.tr,
              onRightPressed: controller.onOpen,
            )
          ],
        ));
  }
}
