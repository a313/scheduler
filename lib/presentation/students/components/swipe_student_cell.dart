import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/presentation/students/components/student_item.dart';

class SwipeStudentCell extends StatelessWidget {
  const SwipeStudentCell({
    super.key,
    required this.data,
    this.onTapped,
    this.actions,
  });
  final Student data;
  final Function(Student student)? onTapped;
  final List<SwipeAction>? actions;

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
        key: ObjectKey(data),
        trailingActions: actions,
        child: StudentItem(data: data));
  }
}
