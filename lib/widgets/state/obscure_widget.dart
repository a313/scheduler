import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheduler/core/utils/util.dart';

class ObscureWidget extends StatelessWidget {
  const ObscureWidget({
    Key? key,
    required this.isObscure,
    this.onTap,
  }) : super(key: key);
  final bool isObscure;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Padding(
            padding: padAll16,
            child: isObscure
                ? SvgPicture.asset(
                    'assets/svg/ic_eye_open.svg',
                  )
                : SvgPicture.asset(
                    'assets/svg/ic_eye_close.svg',
                  )));
  }
}
