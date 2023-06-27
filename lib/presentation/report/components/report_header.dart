import 'package:flutter/material.dart';
import 'package:scheduler/data/models/class_room.dart';

import '../../../core/utils/util.dart';
import '../../../theme/app_fonts.dart';
import '../../../widgets/local_avatar.dart';

class ReportHeader extends StatelessWidget {
  const ReportHeader({
    super.key,
    required this.data,
    required this.isShowChildren,
    required this.onToggle,
  });
  final ClassRoom data;
  final bool isShowChildren;
  final Function(bool isShow) onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.neutral200,
      child: Row(
        children: [
          LocalAvatar(
            path: data.image,
            size: 32,
            name: data.name,
          ),
          sizedBoxW12,
          Expanded(
            child: Text(
              data.name,
              style: AppFonts.h500,
            ),
          ),
          IconButton(
              onPressed: () => onToggle(!isShowChildren),
              icon: isShowChildren
                  ? const Icon(Icons.keyboard_double_arrow_up)
                  : const Icon(Icons.keyboard_double_arrow_down)),
        ],
      ),
    );
  }
}
