import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/base/base_state_widget.dart';
import 'package:scheduler/widgets/base/search_field.dart';

import '../../widgets/shimmer/shimmer_list.dart';
import 'group_by_student/group_by_student_component.dart';
import 'report_controller.dart';

class ReportPage extends GetView<ReportController> {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        elevation: 0,
        title: 'Report'.tr,
        actions: [
          Obx(() => TextButton(
              onPressed: controller.toggleGrouping,
              child: Text(
                controller.groupByClass.value
                    ? 'Group by student'.tr
                    : 'Group by class'.tr,
                style: AppFonts.bSmall.copyWith(color: context.neutral100),
              )))
        ],
        fab: FloatingActionButton(
          heroTag: runtimeType,
          onPressed: controller.exportExcel,
          backgroundColor: context.primaryDark,
          child: Icon(
            Icons.document_scanner,
            color: context.neutral100,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: padSymHor16,
                    child: Row(
                      children: [
                        Expanded(
                          child: BaseDateField(
                              labelText: 'Start'.tr,
                              initDate: controller.startDate,
                              onSelected: controller.onChangeStart,
                              timeFormat: DateFormater.ddMMYYYY),
                        ),
                        sizedBoxW12,
                        Expanded(
                          child: BaseDateField(
                              labelText: 'End'.tr,
                              initDate: controller.endDate,
                              onSelected: controller.onChangeEnd,
                              timeFormat: DateFormater.ddMMYYYY),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: padSymHor16,
                    child: SearchField(
                      hintText: 'Search'.tr,
                      onChanged: controller.onSearchChanged,
                      onClearSearch: controller.onClearSearch,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GetBuilder<ReportController>(
                  builder: (controller) {
                    return BaseStateWidget(
                      state: controller.state,
                      builder: (context) {
                        if (controller.groupByClass.value) {
                          final keys = controller.filterClassKeys;
                          return const SizedBox();
                          // return CustomScrollView(
                          //   slivers: List.generate(keys.length, (index) {
                          //     final key = keys.elementAt(index);
                          //     final events = controller.reportForClass[key]!;
                          //     return GrByClassComponent(
                          //         classRoom: key, data: events);
                          //   }),
                          // );
                        } else {
                          final data = controller.filterReportForStudent;
                          return CustomScrollView(
                            slivers: List.generate(data.length, (index) {
                              final report = data.elementAt(index);
                              return GrByStudentComponent(data: report);
                            }),
                          );
                        }
                      },
                      onLoading: const Padding(
                          padding: padAll16, child: ShimmerListWidget()),
                      onEmpty: const Center(child: Text('No report data')),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
