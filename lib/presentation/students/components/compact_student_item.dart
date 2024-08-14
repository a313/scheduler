import 'package:flutter/material.dart';
import 'package:aio/data/models/student.dart';

import '../../../core/utils/util.dart';
import '../../../theme/app_fonts.dart';
import '../../../widgets/local_avatar.dart';

class CompactStudentItem extends StatelessWidget {
  const CompactStudentItem({
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
