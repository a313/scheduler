import 'package:flutter/material.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/presentation/students/components/student_item.dart';

class MultiSelectStudentCell extends StatelessWidget {
  const MultiSelectStudentCell(
      {super.key, required this.data, required this.didSelect});

  final Student data;
  final bool didSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: StudentItem(data: data)),
        if (didSelect)
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.check_circle_sharp, color: Colors.green),
          ),
      ],
    );
  }
}
