import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'report_controller.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Report',
        body: GetBuilder<ReportController>(
          init: ReportController(),
          builder: (_) {
            return const Column(
              children: [],
            );
          },
        ));
  }
}
