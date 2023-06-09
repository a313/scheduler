import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/widgets/base/base_button.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'hex_to_link_controller.dart';

class HexToLinkPage extends GetView<HexToLinkController> {
  const HexToLinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Hext To Text',
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    BaseTextField(
                      controller: controller.hexController,
                      labelText: 'Hex String',
                      maxLines: 4,
                    ),
                    sizedBoxH08,
                    BaseTextField(
                      controller: controller.decodedController,
                      labelText: 'Decoded String',
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
              BaseButton.fixBottom2(
                leftTitle: 'Decode',
                onLeftPressed: controller.onDecode,
                rightTitle: 'Open',
                onRightPressed: controller.onOpen,
              )
            ],
          ),
        ));
  }
}
