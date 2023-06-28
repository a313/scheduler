import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/presentation/report/components/class_header.dart';
import 'package:scheduler/widgets/custom_divider.dart';

import '../../../data/models/event.dart';
import '../../../data/models/report.dart';
import 'report_header.dart';
import 'report_item.dart';

class ReportComponent extends StatefulWidget {
  const ReportComponent({
    super.key,
    required this.data,
    this.onTapped,
  });
  final Report data;
  final Function(Report data)? onTapped;

  @override
  State<ReportComponent> createState() => _ReportComponentState();
}

class _ReportComponentState extends State<ReportComponent> {
  bool isShowChildren = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    return SliverStickyHeader.builder(
      builder: (context, state) => ReportHeader(
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
                return ReportClassComponent(
                    student: data.student, classRoom: key, data: events);
              },
              separatorBuilder: (context, index) => const CustomDivider(),
            )
          : const SliverToBoxAdapter(),
    );
  }
}

class ReportClassComponent extends StatelessWidget {
  const ReportClassComponent({
    super.key,
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
        (index) => ReportItem(
            student: student, classRoom: classRoom, data: data[index]))
      ..addSeparated(
          separated: (index) => const CustomDivider().paddingOnly(left: 80))
      ..insert(0, ClassHeader(data: classRoom, events: data));

    return Column(children: children);
  }
}
