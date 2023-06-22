import 'package:flutter/material.dart';
import 'package:scheduler/data/models/schedule.dart';
import 'package:scheduler/presentation/schedules/components/schedule_item.dart';

class SelectableStudentCell extends StatelessWidget {
  const SelectableStudentCell(
      {super.key, required this.data, required this.didSelect});

  final Schedule data;
  final bool didSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ScheduleItem(data: data)),
        if (didSelect)
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.check_circle_sharp, color: Colors.green),
          ),
      ],
    );
  }
}
