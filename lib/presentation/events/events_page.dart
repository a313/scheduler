import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/events/components/calenar_component.dart';
import 'package:scheduler/presentation/events/components/events_component.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'events_controller.dart';

class EventsPage extends GetView<EventsController> {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Events',
        backgroundColor: context.neutral200,
        elevation: 0,
        fab: FloatingActionButton(
          mini: true,
          onPressed: controller.addEvent,
          backgroundColor: context.primaryDark,
          child: Icon(
            Icons.add,
            color: context.neutral100,
          ),
        ),
        body: Column(
          children: [
            Obx(() => CalendarComponent(
                  focusedDay: controller.selectedDay.value,
                  onDaySelected: controller.onDaySelected,
                )),
            Expanded(
              child: controller.obx(
                (state) => CustomScrollView(
                  slivers: List.generate(state!.length, (index) {
                    final key = state.keys.elementAt(index);
                    final events = state[key]!;
                    return EventsComponent(
                      time: key,
                      data: events,
                      onTapped: controller.onTappedEvent,
                    );
                  }),
                ),
              ),
            ),
          ],
        ));
  }
}
