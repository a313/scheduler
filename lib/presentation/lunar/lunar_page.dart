import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';

import 'lunar_controller.dart';

class LunarPage extends GetView<LunarController> {
  const LunarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar(
      title: 'Lunar'.tr,
      body: const Column(
        children: [],
      ),
    );
  }
}
