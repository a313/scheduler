import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'lunar_controller.dart';

class LunarPage extends GetView<LunarController> {
  const LunarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Lunar'.tr,
      body: const Column(
        children: [],
      ),
    );
  }
}
