import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:scheduler/data/models/report_for_class.dart';
import 'package:scheduler/presentation/report/group_by_class/group_by_class_item.dart';
import 'package:scheduler/widgets/custom_divider.dart';

import 'group_by_class_header.dart';

class GrByClassComponent extends StatelessWidget {
  const GrByClassComponent({
    super.key,
    required this.data,
    this.onTapped,
  });
  final ReportForClass data;
  final Function(ReportForClass data)? onTapped;

  @override
  Widget build(BuildContext context) {
    final length = data.events.length;

    return SliverStickyHeader.builder(
      builder: (context, state) => GrByClassHeader(
        data: data.classRoom,
        events: data.events,
      ),
      sliver: SliverList.separated(
        itemCount: length,
        itemBuilder: (context, index) => GrByClassItem(
          data: data.events[index],
        ),
        separatorBuilder: (context, index) => const CustomDivider(),
      ),
    );
  }
}
