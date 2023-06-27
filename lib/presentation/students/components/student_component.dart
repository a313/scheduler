import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/presentation/students/components/swipe_student_cell.dart';
import 'package:scheduler/widgets/custom_divider.dart';

import 'student_header.dart';

class StudentComponent extends StatelessWidget {
  const StudentComponent({
    super.key,
    required this.classRoom,
    required this.data,
    this.onTapped,
    this.onTappedEdit,
    // this.headerKey,
  });
  final ClassRoom? classRoom;
  final List<Student> data;
  final Function(Student student)? onTapped;
  final Function(Student student)? onTappedEdit;

  @override
  Widget build(BuildContext context) {
    final length = data.length;

    return SliverStickyHeader.builder(
      builder: (context, state) => StudentHeader(classRoom: classRoom),
      sliver: SliverList.separated(
        itemCount: length,
        itemBuilder: (context, index) => SwipeStudentCell(
          data: data[index],
          onTapped: onTapped,
        ),
        separatorBuilder: (context, index) => const CustomDivider(),
      ),
    );
  }
}
