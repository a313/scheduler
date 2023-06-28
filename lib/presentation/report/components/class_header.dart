import 'package:flutter/material.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/widgets/custom_divider.dart';

import '../../../core/utils/util.dart';
import '../../../data/models/event.dart';
import '../../../theme/app_fonts.dart';
import '../../../widgets/local_avatar.dart';

class ClassHeader extends StatelessWidget {
  const ClassHeader({super.key, required this.data, required this.events});

  final ClassRoom data;
  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    final onCount = events.map((e) => e.isActive).length;
    return Column(
      children: [
        Padding(
          padding: padSymHor16Ver08,
          child: Row(
            children: [
              LocalAvatar(
                path: data.image,
                size: 26,
                name: data.name,
              ),
              sizedBoxW12,
              Expanded(
                child: Text(
                  data.name,
                  style: AppFonts.h500,
                ),
              ),
              Text('$onCount/${events.length}', style: AppFonts.h400),
              sizedBoxW16,
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 52.0),
          child: CustomDivider(height: 1.5),
        )
      ],
    );
  }
}
