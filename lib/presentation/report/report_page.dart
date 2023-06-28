import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import '../../widgets/shimmer/shimmer_list.dart';
import 'components/report_component.dart';
import 'report_controller.dart';

class ReportPage extends GetView<ReportController> {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Report',
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: padSymHor16,
                child: Row(
                  children: [
                    Expanded(
                      child: BaseDateField(
                          labelText: 'Start',
                          initDate: controller.startDate,
                          onSelected: controller.onChangeStart,
                          timeFormat: DateFormater.ddMMYYYY),
                    ),
                    sizedBoxW12,
                    Expanded(
                      child: BaseDateField(
                          labelText: 'End',
                          initDate: controller.endDate,
                          onSelected: controller.onChangeEnd,
                          timeFormat: DateFormater.ddMMYYYY),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: controller.obx(
                (state) => CustomScrollView(
                  slivers: List.generate(state!.length, (index) {
                    final report = state.elementAt(index);
                    return ReportComponent(
                      data: report,
                    );
                  }),
                ),
                onLoading: const Padding(
                    padding: padAll16, child: ShimmerListWidget()),
                onEmpty: const Center(
                  child: Text("Not exist data"),
                ),
              ))
            ],
          ),
        ));
  }
}
