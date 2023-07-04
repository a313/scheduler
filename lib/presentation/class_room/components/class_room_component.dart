import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/domain/entities/swipe_action_data.dart';
import 'package:scheduler/presentation/class_room/components/class_room_cell.dart';
import 'package:scheduler/presentation/class_room/components/class_room_header.dart';
import 'package:scheduler/widgets/custom_divider.dart';

class ClassRoomComponent extends StatelessWidget {
  const ClassRoomComponent({
    super.key,
    required this.title,
    required this.data,
    this.onTapped,
    this.actions,
    // this.headerKey,
  });
  final String title;
  final List<ClassRoom> data;
  final Function(ClassRoom data)? onTapped;
  final List<SwipeActionData<ClassRoom>>? actions;

  @override
  Widget build(BuildContext context) {
    final length = data.length;

    return SliverStickyHeader.builder(
      builder: (context, state) => ClassRoomHeader(title: title, data: data),
      sliver: SliverList.separated(
        itemCount: length,
        itemBuilder: (context, index) => SwipeClassRoomCell(
          data: data[index],
          onTapped: onTapped,
          actions: actions,
        ),
        separatorBuilder: (context, index) => const CustomDivider(),
      ),
    );
  }
}
