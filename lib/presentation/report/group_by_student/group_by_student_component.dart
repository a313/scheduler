import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/widgets/custom_divider.dart';

import '../../../data/models/event.dart';
import '../../../data/models/report_for_student.dart';
import 'group_by_student_header.dart';
import 'group_by_student_item.dart';

class GrByStudentComponent extends StatefulWidget {
  const GrByStudentComponent({
    super.key,
    required this.data,
    this.onTapped,
  });
  final ReportForStudent data;
  final Function(ReportForStudent data)? onTapped;

  @override
  State<GrByStudentComponent> createState() => _GrByStudentComponentState();
}

class _GrByStudentComponentState extends State<GrByStudentComponent> {
  bool isShowChildren = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    return SliverStickyHeader.builder(
      builder: (context, state) => GrByStudentHeader(
        data: data,
        isShowChildren: isShowChildren,
        onToggle: (isShow) {
          setState(() {
            isShowChildren = isShow;
          });
        },
      ),
      sliver: isShowChildren
          ? SliverList.separated(
              itemCount: data.data.keys.length,
              itemBuilder: (context, index) {
                final key = data.data.keys.elementAt(index);
                final events = data.data[key]!;
                return _ClassComponent(
                    student: data.student, classRoom: key, data: events);
              },
              separatorBuilder: (context, index) => const CustomDivider(),
            )
          : const SliverToBoxAdapter(
              child: SizedBox(height: 1),
            ),
    );
  }
}

class _ClassComponent extends StatelessWidget {
  const _ClassComponent({
    required this.classRoom,
    required this.data,
    required this.student,
  });
  final Student student;
  final ClassRoom classRoom;
  final List<Event> data;

  @override
  Widget build(BuildContext context) {
    final children = List<Widget>.generate(
        data.length,
        (index) => GrByStudentItem(
              classRoom: classRoom,
              data: data[index],
              joinerId: student.id,
            ))
      ..addSeparated(
          separated: (index) => const CustomDivider().paddingOnly(left: 80));

    return Column(children: children);
  }
}
