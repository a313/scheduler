import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/swipe_action_data.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/shimmer/shimmer_list.dart';

import 'components/student_component.dart';
import 'students_controller.dart';

class StudentsPage extends GetView<StudentsController> {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Student'.tr,
      fab: FloatingActionButton(
        heroTag: runtimeType,
        onPressed: controller.addStudent,
        backgroundColor: context.primaryDark,
        child: Icon(
          Icons.add,
          color: context.neutral100,
        ),
      ),
      // actions: [
      //   TextButton(
      //     onPressed: controller.onTappedFilter,
      //     child: Text(
      //       'Grouping'.tr,
      //       style: AppFonts.bSmall,
      //     ),
      //   )
      // ],
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
              actions: [
                SwipeActionData(onTap: controller.onDeleteStudent),
                SwipeActionData(
                  onTap: controller.onToggleFollow,
                  styleBuilder: (data) {
                    final isFollow = data.isFollow;
                    return SwipeData(
                        title: isFollow ? 'Deactivate'.tr : 'Activate'.tr,
                        color: isFollow
                            ? context.funcBitterLemon
                            : context.funcCornflowerBlue);
                  },
                ),
              ],
            );
          })),
          onLoading:
              const Padding(padding: padAll16, child: ShimmerListWidget()),
          onEmpty: Center(
            child: Text('Not exist student'.tr),
          ),
        ),
      ),
    );
  }
}
