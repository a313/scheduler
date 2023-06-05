import 'package:flutter/material.dart';
import 'package:scheduler/domain/entities/student.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({super.key, required this.data, this.onTapped});
  final Student data;
  final Function(Student student)? onTapped;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(data.name),
    );
  }
}
