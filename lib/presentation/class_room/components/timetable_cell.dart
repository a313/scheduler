import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

import '../../../data/models/timetable.dart';

class TimetableCell extends StatelessWidget {
  const TimetableCell({
    Key? key,
    required this.data,
    this.onTapped,
    this.onRemove,
  }) : super(key: key);

  final Timetable data;
  final Function(Timetable data)? onTapped;
  final Function(Timetable data)? onRemove;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapped?.call(data),
      child: Row(
        children: [
          IconButton(
            onPressed: () => onRemove?.call(data),
            icon: const Icon(Icons.remove),
            color: context.funcRadicalRed,
          ),
          Text(
              'Ngày ${data.dayInWeek.getDayOfWeek} từ ${data.begin.formated} đến ${data.end.formated}'),
        ],
      ),
    );
  }
}
