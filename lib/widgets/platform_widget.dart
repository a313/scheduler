import 'package:flutter/material.dart';
import 'package:aio/core/utils/util.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({super.key, this.desktop, this.mobile});
  final Widget? desktop;
  final Widget? mobile;

  @override
  Widget build(BuildContext context) {
    if (desktop != null && isDesktop) return desktop!;
    if (mobile != null && isMobile) return mobile!;
    return const SizedBox();
  }
}
