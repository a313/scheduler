import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';

class BaseSliverAppBar extends StatelessWidget {
  const BaseSliverAppBar({
    super.key,
    required this.isShrink,
    required this.title,
    required this.background,
    this.expandedHeight = 160.0,
    this.leadingIcon = Icons.arrow_back_ios_new,
    this.bottom,
    this.fixedOverlayStyle,
  });

  final RxBool isShrink;
  final IconData? leadingIcon;
  final String title;
  final Widget background;
  final double expandedHeight;
  final PreferredSizeWidget? bottom;
  final SystemUiOverlayStyle? fixedOverlayStyle;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverAppBar(
          pinned: true,
          systemOverlayStyle: fixedOverlayStyle ?? getUIStyle(),
          expandedHeight: expandedHeight,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              leadingIcon,
              color: isShrink.value ? context.primaryDark : context.neutral100,
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              title,
              style: isShrink.value
                  ? AppFonts.h400.copyWith(color: context.neutral1100)
                  : AppFonts.h400.copyWith(color: context.transparent),
            ),
            stretchModes: const [StretchMode.blurBackground],
            background: background,
          ),
          bottom: bottom,
        ));
  }

  SystemUiOverlayStyle getUIStyle() {
    return (isShrink.value
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light);
  }
}
