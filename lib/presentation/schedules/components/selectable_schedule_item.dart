import 'package:flutter/material.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/schedule.dart';
import 'package:aio/presentation/schedules/components/schedule_item.dart';

class SelectableStudentCell extends StatelessWidget {
  const SelectableStudentCell(
      {super.key, required this.data, required this.didSelect});

  final Schedule data;
  final bool didSelect;

  @override
  Widget build(BuildContext context) {
    return ScheduleItem(
        data: data,
        suffix: Icon(Icons.check_circle_sharp,
            color: didSelect ? context.primaryDark : context.transparent));
  }
}
