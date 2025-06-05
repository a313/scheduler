import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:aio/data/models/student.dart';
import 'package:aio/presentation/students/components/student_item.dart';

import '../../../domain/entities/swipe_action_data.dart';

class SwipeStudentCell extends StatelessWidget {
  const SwipeStudentCell({
    super.key,
    required this.data,
    this.onTapped,
    this.actions,
  });
  final Student data;
  final Function(Student student)? onTapped;
  final List<SwipeActionData<Student>>? actions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapped?.call(data),
      child: SwipeActionCell(
          key: ObjectKey(data),
          trailingActions: actions?.map((e) => e.toAction(data)).toList(),
          child: StudentItem(data: data)),
    );
  }
}
