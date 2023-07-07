import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/presentation/report/group_by_class/group_by_class_item.dart';
import 'package:scheduler/widgets/custom_divider.dart';

import 'group_by_class_header.dart';

class GrByClassComponent extends StatelessWidget {
  const GrByClassComponent({
    super.key,
    required this.classRoom,
    required this.data,
    this.onTapped,
  });
  final ClassRoom classRoom;
  final List<Event> data;
  final Function(ClassRoom classRoom)? onTapped;

  @override
  Widget build(BuildContext context) {
    final length = data.length;

    return SliverStickyHeader.builder(
      builder: (context, state) => GrByClassHeader(
        data: classRoom,
        events: data,
      ),
      sliver: SliverList.separated(
        itemCount: length,
        itemBuilder: (context, index) => GrByClassItem(
          data: data[index],
        ),
        separatorBuilder: (context, index) => const CustomDivider(),
      ),
    );
  }
}
