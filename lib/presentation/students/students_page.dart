import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/students/components/student_item.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/custom_divider.dart';
import 'package:scheduler/widgets/custom_refresher.dart';
import 'package:scheduler/widgets/shimmer/shimmer_list.dart';

import 'students_controller.dart';

class StudentsPage extends GetView<StudentsController> {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      fab: FloatingActionButton(
        mini: true,
        onPressed: controller.addStudent,
        backgroundColor: context.funcBitterLemon,
        child: Icon(
          Icons.add,
          color: context.neutral100,
        ),
      ),
      actions: [
        TextButton(
          onPressed: controller.onTappedFilter,
          child: Text(
            'Filter',
            style: AppFonts.bSmall.copyWith(
              color: context.primaryDark,
            ),
          ),
        )
      ],
      title: 'Students',
      body: controller.obx(
        (state) => CustomRefresher(
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          controller: controller.refreshController,
          child: ListView.separated(
              itemCount: state!.length,
              separatorBuilder: (context, index) => const CustomDivider(),
              itemBuilder: (context, index) {
                return StudentItem(
                  data: state[index],
                  onEdit: controller.onEditStudent,
                  onTapped: controller.onTappedStudent,
                );
              }),
        ),
        onLoading: const Padding(padding: padAll16, child: ShimmerListWidget()),
        onEmpty: CustomRefresher(
          onRefresh: controller.onRefresh,
          onLoading: controller.onRefresh,
          controller: controller.emptyController,
          child: const Center(child: Text("Not exist Student")),
        ),
      ),
    );
  }
}
