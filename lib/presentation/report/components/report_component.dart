import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/event.dart';
import 'package:scheduler/presentation/events/components/event_item.dart';
import 'package:scheduler/widgets/custom_divider.dart';

import 'report_header.dart';

class ReportComponent extends StatefulWidget {
  const ReportComponent({
    super.key,
    required this.classRoom,
    required this.data,
  });
  final ClassRoom classRoom;
  final List<Event> data;

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
    final length = widget.data.length;
    return SliverStickyHeader.builder(
      builder: (context, state) => ReportHeader(
        data: widget.classRoom,
        isShowChildren: isShowChildren,
        onToggle: (isShow) {
          setState(() {
            isShowChildren = isShow;
          });
        },
      ),
      sliver: SliverList.separated(
        itemCount: isShowChildren ? length : 0,
        itemBuilder: (context, index) => EventItem(data: widget.data[index]),
        separatorBuilder: (context, index) => const CustomDivider(),
      ),
    );
  }
}
