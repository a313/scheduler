import 'package:flutter/material.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:aio/widgets/user_avatar.dart';

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
