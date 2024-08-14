import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/swipe_action_data.dart';
import 'package:scheduler/presentation/class_room/components/class_room_component.dart';

import '../../theme/app_fonts.dart';
import '../../widgets/base/base_scafold_appbar.dart';
import '../../widgets/shimmer/shimmer_list.dart';
import 'class_room_controller.dart';

class ClassRoomPage extends GetView<ClassRoomController> {
  const ClassRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar(
      title: 'Class room'.tr,
      fab: FloatingActionButton(
        backgroundColor: context.primaryDark,
        onPressed: controller.addClassRoom,
        child: Icon(
          Icons.add,
          color: context.neutral100,
        ),
      ),
      actions: [
        TextButton(
          onPressed: controller.onTappedFilter,
          child: Text('Filter'.tr, style: AppFonts.bSmall),
        )
      ],
      body: SafeArea(
        child: controller.obx(
          (state) => CustomScrollView(
              slivers: List.generate(state!.keys.length, (index) {
            final keys = state.keys.sorted((a, b) => a.compareTo(b)).reversed;
            final key = keys.elementAt(index);
            final data = state[key]!;
            return ClassRoomComponent(
              title: key,
              data: data,
              onTapped: controller.onTappedClassRoom,
              actions: [
                SwipeActionData(
                  styleBuilder: (data) {
                    final isOpen = data.isOpen;
                    return SwipeData(
                        title: isOpen ? 'Deactivate'.tr : 'Activate'.tr,
                        color: isOpen
                            ? context.funcRadicalRed
                            : context.funcCornflowerBlue);
                  },
                  onTap: controller.toggleStateClass,
                ),
              ],
            );
          })),
          onLoading:
              const Padding(padding: padAll16, child: ShimmerListWidget()),
          onEmpty: Center(
            child: Text('Not exist class room'.tr),
          ),
        ),
      ),
    );
  }
}
