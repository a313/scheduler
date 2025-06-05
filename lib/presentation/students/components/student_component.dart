import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:aio/data/models/class_room.dart';
import 'package:aio/data/models/student.dart';
import 'package:aio/presentation/students/components/swipe_student_cell.dart';
import 'package:aio/widgets/custom_divider.dart';

import '../../../domain/entities/swipe_action_data.dart';
import 'student_header.dart';

class StudentComponent extends StatelessWidget {
  const StudentComponent({
    super.key,
    required this.classRoom,
    required this.data,
    this.onTapped,
    this.actions,
    // this.headerKey,
  });
  final ClassRoom classRoom;
  final List<Student> data;
  final Function(Student student)? onTapped;
  final List<SwipeActionData<Student>>? actions;

  @override
  Widget build(BuildContext context) {
    final length = data.length;

    return SliverStickyHeader.builder(
      builder: (context, state) => StudentHeader(
        classRoom: classRoom,
        data: data,
      ),
      sliver: SliverList.separated(
        itemCount: length,
        itemBuilder: (context, index) => SwipeStudentCell(
          data: data[index],
          onTapped: onTapped,
          actions: actions,
        ),
        separatorBuilder: (context, index) => const CustomDivider(),
      ),
    );
  }
}
