import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/shimmer/shimmer_list.dart';

import 'components/student_component.dart';
import 'students_controller.dart';

class StudentsPage extends GetView<StudentsController> {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      fab: FloatingActionButton(
        mini: true,
        onPressed: controller.addStudent,
        backgroundColor: context.primaryDark,
        child: Icon(
          Icons.add,
          color: context.neutral100,
        ),
      ),
      actions: [
        TextButton(
          onPressed: controller.onTappedFilter,
          child: const Text(
            'Grouping',
            style: AppFonts.bSmall,
          ),
        )
      ],
      title: 'Students',
      body: SafeArea(
        child: controller.obx(
          (state) => CustomScrollView(
              slivers: List.generate(state!.keys.length, (index) {
            final keys = state.keys.sorted((a, b) => a.id!.compareTo(b.id!));
            final key = keys.elementAt(index);
            final students = state[key]!;
            return StudentComponent(
              classRoom: key,
              data: students,
              onTapped: controller.onTappedStudent,
            );
          })),
          onLoading:
              const Padding(padding: padAll16, child: ShimmerListWidget()),
          onEmpty: const Center(
            child: Text("Not exist student"),
          ),
        ),
      ),
    );
  }
}
