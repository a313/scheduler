import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';

import '../../theme/app_fonts.dart';
import '../../widgets/base/base_scafold_appbar.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/custom_refresher.dart';
import '../../widgets/shimmer/shimmer_list.dart';
import 'class_room_controller.dart';
import 'components/class_room_item.dart';

class ClassRoomPage extends GetView<ClassRoomController> {
  const ClassRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      fab: FloatingActionButton(
        mini: true,
        onPressed: controller.addClassRoom,
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
      title: 'Class Room',
      body: controller.obx(
        (state) => CustomRefresher(
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          controller: controller.refreshController,
          child: ListView.separated(
              itemCount: state!.length,
              separatorBuilder: (context, index) => const CustomDivider(),
              itemBuilder: (context, index) {
                return ClassRoomCell(
                  data: state[index],
                  onEdit: controller.onEditClassRoom,
                  onTapped: controller.onTappedClassRoom,
                );
              }),
        ),
        onLoading: const Padding(padding: padAll16, child: ShimmerListWidget()),
        onEmpty: CustomRefresher(
          onRefresh: controller.onRefresh,
          onLoading: controller.onRefresh,
          controller: controller.emptyController,
          child: const Center(
            child: Text("Not exist Class Room"),
          ),
        ),
      ),
    );
  }
}
