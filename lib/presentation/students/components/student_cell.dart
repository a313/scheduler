import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/presentation/students/components/student_item.dart';

class StudentCell extends StatelessWidget {
  const StudentCell({
    super.key,
    required this.data,
    this.onTapped,
    required this.onEdit,
  });
  final Student data;
  final Function(Student student)? onTapped;
  final Function(Student student) onEdit;

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
        key: ObjectKey(data),
        trailingActions: [
          SwipeAction(
            onTap: (handler) => onEdit(data),
            title: 'Edit',
          )
        ],
        child: StudentItem(data: data));
  }
}
