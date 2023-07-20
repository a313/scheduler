import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'periods_controller.dart';

class PeriodsPage extends GetView<PeriodsController> {
  const PeriodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Periods'.tr,
      body: const Column(),
    );
  }
}
