import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/user_avatar.dart';

class UserComponent extends StatelessWidget {
  const UserComponent({
    super.key,
    this.name,
  });
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padAll16,
      child: Row(
        children: [
          const UserAvatar(),
          sizedBoxW08,
          Text(
            'Chào ${name ?? 'bạn'}',
            style: AppFonts.h400,
          )
        ],
      ),
    );
  }
}
