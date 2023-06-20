import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/local_avatar.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({
    super.key,
    required this.data,
  });
  final Student data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padAll12,
      child: Row(
        children: [
          LocalAvatar(
            path: data.image,
            size: 32,
            name: data.name,
          ),
          sizedBoxW12,
          Text(
            data.name,
            style: AppFonts.bMedium,
          ),
          sizedBoxW06,
          Expanded(
            child: Text(
              data.phones.join(","),
              style: AppFonts.bMedium,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
