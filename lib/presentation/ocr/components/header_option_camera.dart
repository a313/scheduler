import 'package:flutter/material.dart';
import 'package:scheduler/core/utils/util.dart';

import '../../../theme/app_fonts.dart';

class HeaderOptionCamera extends StatelessWidget {
  const HeaderOptionCamera({
    Key? key,
    required this.appBarHeight,
    required this.topText,
    required this.bgColor,
  }) : super(key: key);

  final double appBarHeight;
  final String topText;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      height: double.infinity,
      child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                topText,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: AppFonts.bMedium.copyWith(color: context.neutral100),
              ),
            ],
          )),
    );
  }
}
