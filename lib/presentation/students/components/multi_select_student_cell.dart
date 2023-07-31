import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/presentation/students/components/compact_student_item.dart';

class MultiSelectStudentCell extends StatelessWidget {
  const MultiSelectStudentCell(
      {super.key, required this.data, required this.didSelect});

  final Student data;
  final bool didSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: padSymHor12,
          child: Icon(
              didSelect ? Icons.check_circle_sharp : Icons.radio_button_off,
              color: Colors.green),
        ),
        Expanded(child: CompactStudentItem(data: data)),
      ],
    );
  }
}
