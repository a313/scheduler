import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/presentation/events/components/calenar_component.dart';
import 'package:aio/presentation/events/components/events_component.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';
import 'package:aio/widgets/shimmer/shimmer_list.dart';

import '../../widgets/custom_refresher.dart';
import 'events_controller.dart';

class EventsPage extends GetView<EventsController> {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar(
        centerTitle: false,
        titleWidget: Obx(() =>
            Text(controller.selectedDay.value.toStringFormat('LLLL yyyy'))),
        fab: FloatingActionButton(
          onPressed: controller.addEvent,
          backgroundColor: context.primaryDark,
          child: Icon(
            Icons.add,
            color: context.neutral100,
          ),
        ),
        body: Column(
          children: [
            sizedBoxH04,
            Obx(() => CalendarComponent(
                  focusedDay: controller.selectedDay.value,
                  onDaySelected: controller.onDaySelected,
                )),
            Expanded(
              child: GetBuilder<EventsController>(
                builder: (_) {
                  final data = controller.formatedData;
                  if (data.isEmpty) return const ShimmerListWidget();
                  return CustomRefresher(
                    onRefresh: controller.onRefresh,
                    onLoading: controller.onLoading,
                    controller: controller.refreshController,
                    child: CustomScrollView(
                      slivers: List.generate(data.length, (index) {
                        final key = data.keys.elementAt(index);
                        final events = data[key]!;
                        final weather = controller.weather?.findByKey(key);
                        return EventsComponent(
                          time: key,
                          weather: weather,
                          data: events,
                          onTapped: controller.onTappedEvent,
                          onTappedEdit: controller.onTappedEdit,
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
