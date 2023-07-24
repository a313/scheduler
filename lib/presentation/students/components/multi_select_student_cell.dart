import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/local_avatar.dart';

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
        Expanded(child: SelectStudentItem(data: data)),
      ],
    );
  }
}

class SelectStudentItem extends StatelessWidget {
  const SelectStudentItem({
    super.key,
    required this.data,
  });
  final Student data;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: data.isFollow ? 1 : 0.3,
      child: Padding(
        padding: padSymHor12Ver06,
        child: Row(
          children: [
            LocalAvatar(
              path: data.image,
              size: 26,
              name: data.name,
            ),
            sizedBoxW12,
            Row(
              children: [
                Text(
                  data.name,
                  style: AppFonts.h400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
