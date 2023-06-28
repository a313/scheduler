import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/event.dart';

import '../../../data/models/class_room.dart';
import '../../../data/models/student.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({
    super.key,
    required this.data,
    required this.student,
    required this.classRoom,
  });
  final Student student;
  final ClassRoom classRoom;
  final Event data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(80, 0, 16, 0),
      child: Row(
        children: [
          Expanded(
              child: Text(
                  data.startTime.toStringFormat(DateFormater.EEEEddMMyyyy))),
          IgnorePointer(
            ignoring: true,
            child: Switch(
                value: data.isActive && data.joinedIds.contains(student.id),
                onChanged: (value) {}),
          ),
        ],
      ),
    );
  }
}
